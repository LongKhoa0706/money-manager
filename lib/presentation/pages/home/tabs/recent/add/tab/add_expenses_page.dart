
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_manager/presentation/shared/buildIcon.dart';
import 'package:money_manager/presentation/shared/form_keyboard/form_keyboard.dart';

class AddExpensesPage extends StatefulWidget {

  @override
  _AddExpensesPageState createState() => _AddExpensesPageState();
}

class _AddExpensesPageState extends State<AddExpensesPage> {

  List<String> listTitle = [
    'Food','Bills','Home','Car','Shopping','Clothing','Tax','Telephone','Baby',
    'Pet','Wine','Snack','Book','Office','Sport','Vegetable','Add'
  ];
  int selectIndex = 0;
  List<IconData> listIcon = [
    Icons.fastfood,FontAwesomeIcons.moneyBill,Icons.home,Icons.directions_car,Icons.add_shopping_cart,FontAwesomeIcons.tshirt,Icons.attach_money,Icons.phone_android,FontAwesomeIcons.baby,
    FontAwesomeIcons.dog,FontAwesomeIcons.wineBottle,FontAwesomeIcons.candyCane,Icons.book,FontAwesomeIcons.pen,FontAwesomeIcons.footballBall,FontAwesomeIcons.apple,Icons.add
  ];
  IconData iconData;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          GridView(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            children: listIcon
                  .asMap()
                  .entries
                  .map((MapEntry map) => _buildIcon(map.key, context))
                  .toList(),
          )
        ],
      ),
    );
  }
  Widget _buildIcon(int index,BuildContext context){
    return  GestureDetector(
      onTap: () {
        selectIndex = index;
        setState(() {
          if (index == 16) {
            Navigator.pushNamed(context, '/settings/categories');
          } else {
            showBottomSheet(context);
          }
        });
      },
      child: BuildIcon(icon: listIcon[index],title: listTitle[index],selectIndex: this.selectIndex,index: index,),
    );
  }

  showBottomSheet(BuildContext context) {
    return showModalBottomSheet(shape: RoundedRectangleBorder(
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
    ),context: context, builder: (_) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              children: <Widget>[
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(listIcon[selectIndex], size: 20,),
                ),
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(FontAwesomeIcons.pen, size: 10,color: Colors.grey,),
                      hintText: 'Desciption',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Text('a22222222'),
                SizedBox(
                  height: 50,
                ),

              ],
            ),
          ),
          const FormKeyBoard()
        ],
      );
    });
  }


}
