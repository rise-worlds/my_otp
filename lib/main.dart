import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_otp/bloc/app_bloc.dart';
import 'package:my_otp/views/otp_list_page.dart';
import 'package:my_otp/views/splash_page.dart';

import 'package:my_otp/repository/app_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _AppState();
}

class _AppState extends State<MyApp> {
  late final AppRepository _appRepository;

  @override
  void initState() {
    super.initState();

    _appRepository = AppRepository();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _appRepository,
      child: BlocProvider(
        create: (_) => AppBloc(
          appRepository: _appRepository,
        ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const AppView(),
        ),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  // final _navigatorKey = GlobalKey<NavigatorState>();

  // NavigatorState get _navigator => _navigatorKey.currentState!;

  late AppBloc _appBloc;

  @override
  void initState() {
    super.initState();

    _appBloc = BlocProvider.of<AppBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
      Widget child = context.widget;
      if (state.status == AppStatus.initialApp) {
        child = const SplashPage();
        _appBloc.add(const LoadDataEvent());
      } else if (state.status == AppStatus.loadDataCompleted) {
        var _ = (state as LoadDataCompleted);
        child = OtpListPage(_.apps);
      } else {
        child = const Center(child: CircularProgressIndicator());
      }
      return Scaffold(
            appBar: AppBar(
              title: const Text('My OTP'),
            ),
            body: child);
    });
  }
}
