import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import '../components/app_bar.dart';
import '../functionality/missing_network.dart';
import '../functionality/swipe.dart';

class HomeScreen extends StatelessWidget {
  // For routing:
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => HomeScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: ChuckAppBar(),
            body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Visibility(
                    visible: Provider.of<InternetConnectionStatus>(context) ==
                        InternetConnectionStatus.disconnected,
                    child: MissingNetworkWarning(),
                  ),
                  Provider.of<InternetConnectionStatus>(context) ==
                          InternetConnectionStatus.disconnected
                      ? MissingNetworkChuck()
                      : SwipeInterface(),
                ])));
  }
}
//SwipeInterface(),
