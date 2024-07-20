part of 'app_bloc.dart';

@immutable
abstract class AppEvent {
  const AppEvent({required this.status});
  final AppStatus status;
}

class LoadDataEvent extends AppEvent {
  const LoadDataEvent({super.status = AppStatus.loadData});
}
