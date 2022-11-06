import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:tinder_with_chuck/config/app_router.dart';
import 'config/theme.dart';
import 'pages/home.dart';

class ChuckNorrisTinder extends StatelessWidget {
  const ChuckNorrisTinder({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<InternetConnectionStatus>(
        initialData: InternetConnectionStatus.connected,
        create: (_) {
          return InternetConnectionChecker().onStatusChange;
        },
        child: MaterialApp(
          title: "Tinder with Chuck Norris",
          theme: theme(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: HomeScreen.routeName,
        ));
  }
}
