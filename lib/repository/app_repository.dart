import 'package:my_otp/models/app_model.dart';

enum AppStatus {
  initialApp,
  loadData,
  loadDataCompleted,
}

class AppRepository {
  List<OTPModel> models = <OTPModel>[
    OTPModel(account: 'rise.worlds', issuer: 'microsoft', secret: '6FLLEVPDSIIN3GCO4PXBG6UEMCCUT5W2')
  ];

}
