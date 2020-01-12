import 'dart:async';

import 'package:flutter/material.dart';
import 'package:web_example/pages/common_widgets/tree_menu.dart';
import 'package:web_example/pages/pr_pages/pr_list_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StreamController<bool> _menuHiddenStreamController =
      StreamController<bool>.broadcast();
  Stream<bool> get _menuHideStream => _menuHiddenStreamController.stream;
  bool _isHidden = false;

  @override
  void dispose() {
    _menuHiddenStreamController.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _menuHiddenStreamController.add(_isHidden);
  }

  _switchMenuTreeHidden() {
    _isHidden = !_isHidden;
    _menuHiddenStreamController.add(_isHidden);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: _switchMenuTreeHidden,
        ),
        title: Text('title'),
      ),
      body: Row(
        children: <Widget>[
          StreamBuilder<bool>(
            stream: _menuHideStream,
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.hasData && snapshot.data == true) {
                return Container(
                  width: 150,
                  color: Colors.red,
                  child: TreeMenu(),
                );
              }
              return Container();
            },
          ),
          Expanded(
            child: Container(
              color: Colors.green,
              child: PRListPage(),
            ),
          )
        ],
      ),
    );
  }
}
