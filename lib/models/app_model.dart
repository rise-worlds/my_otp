import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

/// Hashing algorithm used to generate one time password codes
enum Algorithm {
  /// Use SHA1
  SHA1,
  /// Use SHA256
  SHA256,
  /// Use SHA512
  SHA512,
}

extension AlgorithmNumber on Algorithm {
  int get number {
    switch (this) {
      case Algorithm.SHA1:
        return 0;
      case Algorithm.SHA256:
        return 1;
      case Algorithm.SHA512:
        return 2;
    }
  }
}

enum OTPType {
  TOTP,
  HOTP,
}

extension OTPTypeNumber on OTPType {
  int get number {
    switch (this) {
      case OTPType.TOTP:
        return 0;
      case OTPType.HOTP:
        return 1;
    }
  }
}

//TOTP(K, C) = Truncate(HMAC-SHA-1(K, C))
//'otpauth://totp/$issuer:$account?secret=$secret&issuer=$issuer&algorithm=$algorithm&digits=$digits&period=$timer';
//'otpauth://hotp/$issuer:$account?secret=$secret&issuer=$issuer&algorithm=$algorithm&digits=$digits&counter=$counter';

class OTPModel {
  final String account;
  final String issuer;
  final Algorithm algorithm;
  final String secret;
  final int interval;
  final int digits;
  final Uint8List icon = Uint8List(0);

  OTPModel({required this.account, required this.issuer, required this.secret, this.algorithm = Algorithm.SHA256, this.digits = 6, this.interval = 30});
}
