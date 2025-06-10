import 'package:dartway_core_serverpod_server/dartway_core_serverpod_server.dart';
import 'package:serverpod/serverpod.dart';

import '../endpoints/dw_real_time_endpoint.dart';

extension DwSessionExtension on Session {
  static Future<int> Function(Session session, int userInfoId)?
      userIdCustomGetter;

  Future<int?> get currentUserId async => await authenticated.then(
        (auth) async => auth?.userId == null
            ? null
            : userIdCustomGetter == null
                ? auth!.userId
                : await userIdCustomGetter!.call(this, auth!.userId),
      );

  Future<int> get requireUserId async => (await currentUserId)!;

  Future<bool> isUser(int userId) async => userId == await currentUserId;

  dwSendUpdatesToUser(
    int userId, {
    List<TableRow?>? updatedModels,
    List<TableRow?>? deletedModels,
  }) {
    messages.postMessage(
      DwRealTimeEndpoint.userUpdatesChannel(userId),
      DwUpdatesTransport(
        wrappedModelUpdates: [
          if (updatedModels != null) ...DwModelWrapper.wrapMany(updatedModels),
          if (deletedModels != null)
            ...deletedModels.where((e) => e != null).map(
                  (e) => DwModelWrapper.deleted(object: e!),
                )
        ],
      ),
    );
  }

  // nitSendToChat(int chatId, SerializableModel update) {
  //   messages.postMessage(
  //     NitChatEndpoint.chatUpdatesChannel(chatId),
  //     update,
  //   );
  // }
}
