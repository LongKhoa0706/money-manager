import 'package:flutter/material.dart';
import 'tabs/expense_tab.dart';
import 'tabs/income_tab.dart';

class CategoriesPage extends StatefulWidget {
  /// Create a CategoriesPage widget.
  CategoriesPage({
    Key key,
  }): super(key: key);

  /// Creates the mutable state for this widget at a given location in the tree.
  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> with SingleTickerProviderStateMixin {
  TabController tabController;

  /// Called when this state first inserted into tree.
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  /// Called when a dependency of this state object changes.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  /// Called whenever the widget configuration changes.
  @override
  void didUpdateWidget(CategoriesPage old) {
    super.didUpdateWidget(old);
  }

  /// Called when this state removed from the tree.
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  /// Build the widget with this state.
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
            Tab(text: 'Expenses'),
            Tab(text: 'Income'),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          ExpenseTab(),
          IncomeTab(),
        ],
      ),
    );
  }

}
