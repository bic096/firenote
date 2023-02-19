import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notefire/presentation/auth/sin_in_page.dart';
import 'package:notefire/presentation/splash/splasg_page.dart';

part 'router.gr.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: [
  AutoRoute(
    page: SplashPage,
    initial: true,
  ),
  AutoRoute(
    page: SignInPage,
  )
])
class AppRouter extends _$AppRouter {}
