import 'package:flutter/material.dart';
import 'list_builder.dart';

class ListTileSelect extends StatefulWidget {
  const ListTileSelect({super.key});

  @override
  ListTileSelectState createState() => ListTileSelectState();
}

class ListTileSelectState extends State<ListTileSelect> {
  bool isSelectionMode = false;
  final int listLength = 30;
  late List<bool> _selected;
  bool _selectAll = false;

  @override
  void initState() {
    super.initState();
    initializeSelection();
  }

  void initializeSelection() {
    _selected = List<bool>.generate(listLength, (_) => false);
  }

  @override
  void dispose() {
    _selected.clear();
    super.dispose();
  }

  Text textForButton(state) {
    Text text;

    if (!state) {
      text = Text('select all', style: Theme.of(context).textTheme.bodyText2);
    } else {
      text = Text('unselect all', style: Theme.of(context).textTheme.bodyText2);
    }

    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Favorite Chucks',
                style: Theme.of(context).textTheme.bodyText1),
            actions: isSelectionMode
                ? <Widget>[
                    TextButton(
                        child: textForButton(_selectAll),
                        onPressed: () {
                          _selectAll = !_selectAll;
                          setState(() {
                            _selected = List<bool>.generate(
                                listLength, (_) => _selectAll);
                          });
                        }),
                    TextButton(
                      child: Text('cancel',
                          style: Theme.of(context).textTheme.bodyText2),
                      onPressed: () {
                        setState(() {
                          isSelectionMode = false;
                        });
                        initializeSelection();
                      },
                    )
                  ]
                : const [SizedBox()]),
        body: ListBuilder(
          isSelectionMode: isSelectionMode,
          selectedList: _selected,
          onSelectionChange: (bool x) {
            setState(() {
              isSelectionMode = x;
            });
          },
        ));
  }
}
