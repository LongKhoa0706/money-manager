import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'tabs/history/history_tab.dart';
import 'tabs/recent/recent_tab.dart';
import 'tabs/setting/setting_tab.dart';

class HomePage extends StatefulWidget {
  /// Create a HomePage widget.
  HomePage({
    Key key,
  }): super(key: key);

  /// Creates the mutable state for this widget at a given location in the tree.
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 1;

  List<Widget> listTabs = [
    SettingTab(),
    RecentTab(),
    HistoryTab(),
  ];

  /// Called when this state first inserted into tree.
  @override
  void initState() {
    super.initState();
  }

  /// Called when a dependency of this state object changes.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  /// Called whenever the widget configuration changes.
  @override
  void didUpdateWidget(HomePage old) {
    super.didUpdateWidget(old);
  }

  /// Called when this state removed from the tree.
  @override
  void dispose() {
    super.dispose();
  }

  /// Build the widget with this state.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: listTabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        elevation: 0,
        showUnselectedLabels: false,
        selectedItemColor: Colors.orange[300],
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.cog, size: 20),
            title: Text('Setting'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.home, size: 20),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.history, size: 20),
            title: Text('History'),
          ),
        ],
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
