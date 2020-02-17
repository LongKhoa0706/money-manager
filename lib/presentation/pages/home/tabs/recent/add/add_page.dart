import 'package:flutter/material.dart';
import 'package:money_manager/presentation/pages/home/tabs/recent/add/tab/add_expenses_page.dart';
import 'package:money_manager/presentation/pages/home/tabs/recent/add/tab/add_income_page.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> with SingleTickerProviderStateMixin {
  TabController tabController;
  int index = 0;
  String text = '';
  /// Called when this state first inserted into tree.
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.animation.addListener(onTabChanged);
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Colors.orange[200],
                Colors.orange[300],
              ],
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: Text(text.isEmpty ? 'Expenses' : text),
        bottom: TabBar(
          indicatorColor: Colors.deepOrange,
          controller: tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.white,
          tabs: <Widget>[
            Tab(text: 'Expenses'),
            Tab(text: 'Income'),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          AddExpensesPage(),
          AddIncomePage(),
        ],
      ),

    );
  }
  void onTabChanged() {
    final aniValue = tabController.animation.value;
    if (aniValue > 0.5 && index != 1) {
      setState(() {
        index = 1;
        text = 'Income';
      });
    } else if (aniValue <= 0.5 && index != 0) {
      setState(() {
        index = 0;
        text = 'Expenses';
      });
    }
  }
}
