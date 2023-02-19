import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notefire/application/auth/auth_bloc.dart';
import 'package:notefire/injection.dart';
import 'package:notefire/presentation/routes/router.dart';

class AppWiget extends StatelessWidget {
  const AppWiget({super.key});

  @override
  Widget build(BuildContext context) {
    final AppRouter appRuter = AppRouter();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ((context) => getIt<AuthBloc>()
            ..add(
              const AuthEvent.authCheckRequested(),
            )),
        )
      ],
      child: MaterialApp.router(
        routerDelegate: appRuter.delegate(),
        routeInformationParser: appRuter.defaultRouteParser(),
        title: 'Firenote',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
            primaryColor: Colors.green[800],
            inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8)))),
      ),
    );
  }
}
