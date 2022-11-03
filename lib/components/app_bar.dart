import 'package:flutter/material.dart';
import 'package:tinder_with_chuck/config/theme.dart';
import 'package:tinder_with_chuck/pages/favorite.dart';
import 'package:tinder_with_chuck/pages/home.dart';

class ChuckAppBar extends StatelessWidget with PreferredSizeWidget {
  const ChuckAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: theme().primaryColor,
        title: Row(children: [
          Expanded(
            child: Text('Joke Norris',
                style: Theme.of(context).textTheme.headline1),
          ),
        ]),
        actions: [
          IconButton(
              icon: Icon(
                Icons.home,
                size: 32,
                color: Theme.of(context).primaryColorLight,
              ),
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(HomeScreen.routeName);
              }),
          IconButton(
              icon: Icon(
                Icons.favorite,
                size: 32,
                color: Theme.of(context).primaryColorLight,
              ),
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(FavoriteScreen.routeName);
              }),
        ]);
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}
