// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:my_otp/models/app_model.dart';
import 'package:my_otp/repository/app_repository.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
    required this.appRepository,
  }) : super(const AppInitial()) {
    on<ScanAppEvent>(_onScanAppChanged);
    on<CheckAppEvent>(_onCheckAppChanged);
  }

  final AppRepository appRepository;

  Future<void> _onScanAppChanged(
    ScanAppEvent event,
    Emitter<AppState> emit,
  ) async {
    emit(const ScanApp());
  }

  Future<void> _onCheckAppChanged(
    CheckAppEvent event,
    Emitter<AppState> emit,
  ) async {}
}
