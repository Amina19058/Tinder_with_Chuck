import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tinder_with_chuck/config/theme.dart';

class ListBuilder extends StatefulWidget {
  const ListBuilder({
    super.key,
    required this.selectedList,
    required this.isSelectionMode,
    required this.onSelectionChange,
  });

  final bool isSelectionMode;
  final List<bool> selectedList;
  final Function(bool)? onSelectionChange;

  @override
  State<ListBuilder> createState() => _ListBuilderState();
}

class _ListBuilderState extends State<ListBuilder> {
  final int favoriteJokesIndex = 0;
  var favoriteJokes = Hive.box('favoriteJokes');

  @override
  void initState() {
    super.initState();
  }

  void addNewJoke(newJoke) {
    favoriteJokes.put('text', newJoke);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _toggle(int index) {
    if (widget.isSelectionMode) {
      setState(() {
        widget.selectedList[index] = !widget.selectedList[index];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: favoriteJokes.listenable(),
      builder: (context, Box box, _) {
        if (box.values.isEmpty) {
          return const Text(
            'No Chucks yet',
            style: TextStyle(color: Colors.white),
          );
        } else {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: box.values.length,
            itemBuilder: (context, favoriteJokesIndex) {
              var item = box.getAt(favoriteJokesIndex);
              return Container(
                  color: theme().backgroundColor,
                  child: Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2))),
                      color: theme().backgroundColor,
                      child: ListTile(
                        contentPadding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                        onTap: () => _toggle(favoriteJokesIndex),
                        onLongPress: () {
                          if (!widget.isSelectionMode) {
                            setState(() {
                              widget.selectedList[favoriteJokesIndex] = true;
                            });
                            widget.onSelectionChange!(true);
                          }
                        },
                        trailing: widget.isSelectionMode
                            ? Checkbox(
                                value: widget.selectedList[favoriteJokesIndex],
                                onChanged: (bool? x) =>
                                    _toggle(favoriteJokesIndex),
                              )
                            : const SizedBox.shrink(),
                        title: Text(
                          item,
                          style: theme().textTheme.bodyText2,
                        ),
                      )));
            },
          );
        }
      },
    );
  }
}
