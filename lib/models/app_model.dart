import 'package:flutter/foundation.dart';

enum ApplicationType { undefined, unity3D }

extension ApplicationTypeNumber on ApplicationType {
  int get number {
    switch (this) {
      case ApplicationType.undefined:
        return 0;

      case ApplicationType.unity3D:
        return 1;
    }
  }
}

class AppModel {
  final String packageName;
  final String appName;
  final String apkFilePath;
  final String dataDir;
  final ApplicationType appType;
  final Uint8List icon;

  AppModel({required this.packageName, required this.appName, required this.apkFilePath, required this.dataDir, required this.appType, required this.icon});
}
