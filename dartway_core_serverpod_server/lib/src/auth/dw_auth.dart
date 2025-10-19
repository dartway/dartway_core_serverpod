import 'package:dartway_core_serverpod_server/dartway_core_serverpod_server.dart';
import 'package:serverpod/serverpod.dart';

import 'dw_auth_utils.dart';

class DwAuth<UserProfileClass extends TableRow> {
  final DwAuthConfig config;

  static DwAuth? _instance;

  static DwAuth get instance {
    if (_instance == null) {
      throw Exception('DwAuth not initialized. Call DwAuth.init() first.');
    }
    return _instance!;
  }

  DwAuth._(this.config);

  /// Инициализация DwAuth отдельно (например, из DwCore.init)
  static DwAuth<UserProfileClass> init<UserProfileClass extends TableRow>({
    required DwAuthConfig config,
  }) {
    if (_instance != null) {
      throw Exception('DwAuth already initialized.');
    }

    final instance = DwAuth<UserProfileClass>._(config);
    _instance = instance;
    return instance;
  }

  Future<bool> registerUserPassword(
    Session session, {
    required int userId,
    String? password,
    String? passwordHash,
  }) async {
    try {
      if (password == null && passwordHash == null) {
        throw ArgumentError(
            'Either password or passwordHash must be provided.');
      }

      if (password != null && passwordHash != null) {
        throw ArgumentError('Cannot provide both password and passwordHash.');
      }

      // Check if password record already exists
      final existing = await DwUserPassword.db.findFirstRow(
        session,
        where: (t) => t.userId.equals(userId),
      );

      final newHash = passwordHash ?? DwAuthUtils.hashPassword(password!);

      if (existing != null) {
        session.log('Updating password for userId=$userId',
            level: LogLevel.info);

        final updated = existing.copyWith(
          passwordHash: newHash,
          updatedAt: DateTime.now(),
        );

        await DwUserPassword.db.updateRow(session, updated);
        return true;
      }

      // Check if user profile exists (without FK)
      final userProfile = await DwCore.instance.getUserProfile(session, userId);
      if (userProfile == null) {
        throw StateError('UserProfile with id=$userId not found.');
      }

      // Create new password record
      final newPassword = DwUserPassword(
        userId: userId,
        passwordHash: newHash,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      session.log('Creating password for userId=$userId', level: LogLevel.info);
      await DwUserPassword.db.insertRow(session, newPassword);

      return true;
    } catch (e, st) {
      session.log(
        'registerUserPassword() failed for userId=$userId: $e',
        level: LogLevel.error,
        exception: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<DwAuthKey> signInUser(
    Session session,
    int userId, {
    bool updateSession = true,
  }) async {
    var key = DwAuthUtils.generateRandomString();
    var hash = DwAuthUtils.hashAuthKey(key);

    var authKey = DwAuthKey(
      userId: userId,
      hash: hash,
      key: key,
    );

    var insertedAuthKey = await DwAuthKey.db.insertRow(session, authKey);

    if (updateSession) {
      session.updateAuthenticated(
        AuthenticationInfo(
          userId,
          const <Scope>{},
          authId: '${insertedAuthKey.id}',
        ),
      );
    }
    return insertedAuthKey;
  }
}
