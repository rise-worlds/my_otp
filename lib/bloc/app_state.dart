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

class LoadData extends AppState {
  const LoadData() : super(AppStatus.loadData);

  @override
  List<Object> get props => [status];
}

class LoadDataCompleted extends AppState {
  final List<OTPModel> apps;

  const LoadDataCompleted(this.apps) : super(AppStatus.loadDataCompleted);
  @override
  List<Object> get props => [status, apps];
}

