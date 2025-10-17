import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:dartway_core_serverpod_server/dartway_core_serverpod_server.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';

class DwAuthUtils {
  static String hashVerificationCode(String verificationCode) {
    return sha256.convert(verificationCode.codeUnits).toString();
  }

  static String generateSecureToken([int length = 32]) {
    final random = Random.secure();
    final bytes = List<int>.generate(length, (_) => random.nextInt(256));
    return base64Url.encode(bytes).replaceAll('=', '');
  }

  /// Default OTP generation callback that generates a random 6-digit OTP and prints it to the server.
  static Future<String> defaultVerificationCodeGenerationMethod(
    Session session, {
    required DwAuthRequest verificationRequest,
  }) async {
    final otp = randomDigits(6);
    // print('Generated OTP for $number: $otp');
    return otp;
  }

  // /// Generates a new DwPhoneAuthConfig.current.validationCodeLength digit OTP.
  static String randomDigits(int length) {
    return Random().nextString(length: length, chars: '0123456789');
  }
}
