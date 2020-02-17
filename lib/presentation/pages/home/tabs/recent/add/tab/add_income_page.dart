import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_manager/presentation/shared/buildIcon.dart';

class AddIncomePage extends StatefulWidget {
  @override
  _AddIncomePageState createState() => _AddIncomePageState();
}

class _AddIncomePageState extends State<AddIncomePage> {
  List<String> listTitle = [
    'Salary','Awards','Sales','Investiment',
  ];
  int selectIndex = 0;
  List<IconData> listIcon = [
    Icons.account_balance_wallet,FontAwesomeIcons.moneyBillWaveAlt,FontAwesomeIcons.salesforce,
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              runSpacing: 30,
              spacing: 45,
              children: listIcon
                  .asMap()
                  .entries
                  .map((MapEntry map) => _buildIcon(map.key, context))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildIcon(int index,BuildContext context){
    return GestureDetector(
      onTap: () {

        selectIndex = index;
        setState(() {
          if (index == 16) {
            Navigator.pushNamed(context, '/settings/categories');
          } else {

          }
        });
      },
      child: BuildIcon(icon: listIcon[index],title: listTitle[index],selectIndex: this.selectIndex,index: index,),
    );
  }

}
