import 'package:flutter/material.dart';
import 'package:money_manager/presentation/pages/home/tabs/setting/main/tab/expenses_tab.dart';
import 'package:money_manager/presentation/pages/home/tabs/setting/main/tab/income_tab.dart';

class CategoriePage extends StatefulWidget {
  @override
  _CategoriePageState createState() => _CategoriePageState();
}

class _CategoriePageState extends State<CategoriePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {

    super.initState();
    tabController = TabController(length: 2, vsync: this);
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
        centerTitle: true,
        title: Text('Categories Setting'),
        bottom: TabBar(
          indicatorColor: Colors.deepOrange,
          controller: tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.white,
          tabs: <Widget>[
            Tab(
              text: "Expenses",
            ),
            Tab(
              text: "Income",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          ExpensesTab(),
          IncomeTab(),
        ],
      ),

    );
  }
}
