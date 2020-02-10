import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_manager/presentation/pages/home/tabs/setting/main/categories_page.dart';
import 'package:money_manager/presentation/pages/home/tabs/setting/main/passcode_page.dart';

class SettingTab extends StatefulWidget {
  /// Create a SettingTab widget.
  SettingTab({
    Key key,
  }) : super(key: key);

  @override
  _SettingTabState createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  List<String> listOptionMain = <String>[
    'Categories',
    'Passcode ',
  ];
  List<IconData> listOptionIconMain = <IconData>[
    Icons.widgets,
    Icons.lock,
  ];
  List<String> listSupport = <String>[
    'Report a Problem',
    'Privacy Policy',
    'Rate for us',
    'About us',
  ];
  List<IconData> listSupportIcon = <IconData>[
    Icons.chat,
    Icons.format_align_left,
    Icons.star,
    Icons.info,
  ];
  /// Build this widget.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: ScreenUtil().setHeight(80),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Text(
                "Main",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: ScreenUtil().setSp(50),
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(50),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white),
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  return ListTile(
                    onTap: (){
                      switch(index){
                        case 0:
                          Navigator.pushNamed(context, '/settings/categories');
                          break;
                        case 1:
                          Navigator.pushNamed(context, '/settings/passcodepage');
                          break;
                      }
                    },
                    leading: Icon(
                      listOptionIconMain[index],
                      color: Colors.orange[300],
                    ),
                    title: Text(
                      listOptionMain[index],
                    ),

                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                  );
                },
                separatorBuilder: (_, index) {
                  return Divider(
                    color: Colors.grey,
                  );
                },
                itemCount: listOptionMain.length,
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(80),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Text(
                "Support",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: ScreenUtil().setSp(50),
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(50),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  return ListTile(
                    leading: Icon(
                      listSupportIcon[index],
                      color: Colors.orange[300],
                    ),
                    title: Text(
                      listSupport[index],
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                  );
                },
                separatorBuilder: (_, index) {
                  return Divider(
                    color: Colors.grey,
                  );
                },
                itemCount: listSupport.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
