import 'package:my_otp/models/app_model.dart';

enum AppStatus {
  initialApp,
  loadData,
  loadDataCompleted,
}

class AppRepository {
  List<AppModel> models = <AppModel>[];
}
