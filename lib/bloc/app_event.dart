part of 'app_bloc.dart';

@immutable
abstract class AppEvent {
  const AppEvent({required this.status});
  final AppStatus status;
}

class ScanAppEvent extends AppEvent {
  const ScanAppEvent({super.status = AppStatus.scanApp});
}

class CheckAppEvent extends AppEvent {
  const CheckAppEvent({super.status = AppStatus.checkApp});
}
