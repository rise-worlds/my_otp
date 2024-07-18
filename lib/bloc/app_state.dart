part of 'app_bloc.dart';

@immutable
abstract class AppState extends Equatable {
  const AppState(this.status);
  final AppStatus status;
}

class AppInitial extends AppState {
  const AppInitial() : super(AppStatus.initialApp);

  @override
  List<Object> get props => [status];
}

class ScanApp extends AppState {
  const ScanApp() : super(AppStatus.scanApp);

  @override
  List<Object> get props => [status];
}

class ScanAppCompleted extends AppState {
  final List<AppModel> apps;

  const ScanAppCompleted(this.apps) : super(AppStatus.scanAppCompleted);
  @override
  List<Object> get props => [status, apps];
}

class CheckApp extends AppState {
  final List<AppModel> apps;
  const CheckApp(this.apps) : super(AppStatus.checkApp);
  @override
  List<Object> get props => [status, apps];
}

class CheckAppCompleted extends AppState {
  final List<AppModel> apps;

  const CheckAppCompleted(this.apps) : super(AppStatus.checkAppCompleted);
  @override
  List<Object> get props => [status, apps];
}
