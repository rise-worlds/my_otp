import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';

import 'models/app_model.dart';

class OTP {

  /// Generates a Time-based one time password code
  ///
  /// Takes current time in milliseconds, converts to seconds and devides it by interval to get a code every iteration of the interval.
  /// A interval of 1 will be the same as if passing time into the HOTPCode function..
  ///
  /// Optional parameters to change the length of the code provided (default 6), interval (default 30), and hashing algorithm (default SHA256)
  /// These settings are defaulted to the RFC standard but can be changed.
  /// Throws a FormatException if string is not a base32 secret.
  static int generateTOTPCode(String secret, int time,
      {int length = 6,
        int interval = 30,
        Algorithm algorithm = Algorithm.SHA256}) {
    lastUsedTime = time;
    time = (((time ~/ 1000).round()) ~/ interval).floor();
    return _generateCode(secret, time, length, getAlgorithm(algorithm));
  }

  /// Generates a Time-based one time password code and return as a 0 padded string.
  ///
  /// Takes current time in milliseconds, converts to seconds and devides it by interval to get a code every iteration of the interval.
  /// A interval of 1 will be the same as if passing time into the HOTPCode function..
  ///
  /// Optional parameters to change the length of the code provided (default 6), interval (default 30), and hashing algorithm (default SHA256)
  /// These settings are defaulted to the RFC standard but can be changed.
  /// Throws a FormatException if string is not a base32 secret.
  static String generateTOTPCodeString(String secret, int time,
      {int length = 6,
        int interval = 30,
        Algorithm algorithm = Algorithm.SHA256,
        bool isGoogle = false}) {
    final code =
        '${generateTOTPCode(secret, time, length: length, interval: interval, algorithm: algorithm)}';
    return code.padLeft(length, '0');
  }

  /// Has the last used timestamp for TOTP codes, should match what you passed into the functions last.
  static int lastUsedTime = 0;

  static int _generateCode(String secret, int time, int length, Hash mac) {
    length = (length > 0) ? length : 6;

    var secretList = Uint8List.fromList(utf8.encode(secret));

    final timebytes = _int2bytes(time);

    final hmac = Hmac(mac, secretList);
    final digest = hmac.convert(timebytes).bytes;

    final offset = digest[digest.length - 1] & 0x0f;

    final binary = ((digest[offset] & 0x7f) << 24) |
    ((digest[offset + 1] & 0xff) << 16) |
    ((digest[offset + 2] & 0xff) << 8) |
    (digest[offset + 3] & 0xff);

    return binary % pow(10, length) as int;
  }

  static Uint8List _int2bytes(int long) {
    // we want to represent the input as a 8-bytes array
    final byteArray = Uint8List(8);

    for (var index = byteArray.length - 1; index >= 0; index--) {
      final byte = long & 0xff;
      byteArray[index] = byte;
      long = (long - byte) ~/ 256;
    }
    return byteArray;

    // Cleaner implementation but breaks in dart2js/flutter web
    // return Uint8List(8)..buffer.asByteData().setInt64(0, long);
  }

  /// Gets the Mac for the provided algorithm. Mostly used for testing, not very helpful outside of that.
  static Hash getAlgorithm(Algorithm algorithm) {
    switch (algorithm) {
      case Algorithm.SHA256:
        return sha256;
      case Algorithm.SHA512:
        return sha512;
      case Algorithm.SHA1:
        return sha1;
      default:
        return sha256;
    }
  }
}