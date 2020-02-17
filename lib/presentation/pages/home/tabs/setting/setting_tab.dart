import 'package:flutter/material.dart';

class SettingItem {
  SettingItem({
    @required this.title,
    @required this.icon,
    @required this.onPressed,
  }): assert(title != null),
      assert(title.isNotEmpty),
      assert(icon != null),
      assert(onPressed != null);

  final String title;
  final IconData icon;
  final VoidCallback onPressed;
}

class SettingTab extends StatelessWidget {
  /// Create a SettingTab widget.
  SettingTab({
    Key key,
  }): super(key: key);

  /// Build this widget.
  @override
  Widget build(BuildContext context) {
    Map<String, List<SettingItem>> items = {
      'General': [
        SettingItem(
          title: 'Accounts',
          icon: Icons.account_balance_wallet,
          onPressed: () {
            Navigator.of(context).pushNamed('/settings/accounts');
          },
        ),
        SettingItem(
          title: 'Categories',
          icon: Icons.widgets,
          onPressed: () {
            Navigator.of(context).pushNamed('/settings/categories');
          },
        ),
        SettingItem(
          title: 'Passcode',
          icon: Icons.lock,
          onPressed: () {
            Navigator.of(context).pushNamed('/settings/passcode');
          },
        ),
      ],
      'Support': [
        SettingItem(
          title: 'Feedback',
          icon: Icons.feedback,
          onPressed: () {},
        ),
        SettingItem(
          title: 'Privacy Policy',
          icon: Icons.description,
          onPressed: () {},
        ),
        SettingItem(
          title: 'Rate for us',
          icon: Icons.star,
          onPressed: () {},
        ),
        SettingItem(
          title: 'About',
          icon: Icons.info,
          onPressed: () {},
        ),
      ],
    };

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: ListView.builder(
          physics: ClampingScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GroupListTile(
              title: items.keys.elementAt(index),
              items: items.values.elementAt(index),
            );
          },
        ),
      ),
    );
  }
}

class GroupListTile extends StatelessWidget {
  /// Create a GroupListTile widget.
  GroupListTile({
    Key key,
    @required this.title,
    @required this.items,
  }): assert(title != null),
      assert(title.isNotEmpty),
      super(key: key);

  final String title;
  final List<SettingItem> items;

  /// Build this widget.
  @override
  Widget build(BuildContext context) {
    List<Widget> children = <Widget>[];
    items.forEach((data) {
      children.add(
        GestureDetector(
          onTap: data.onPressed,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              border: Border(
                bottom: BorderSide(color: Color(0xffc2c3c4).withOpacity(0.5)),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 60,
            child: Row(
              children: <Widget>[
                Icon(
                  data.icon,
                  color: Colors.orange[300],
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(data.title),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      );
    });

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
          ...children,
        ],
      ),
    );
  }
}
