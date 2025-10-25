import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/info.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.yellow,
            ),
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.yellow[600],
              ),
              accountName: Text(
                ' panika@mail.ru',
                style: TextStyle(color: Colors.black),
              ),
              accountEmail: Text(
                '88005553535',
                style: TextStyle(color: Colors.black),
              ),
              currentAccountPicture: Container(
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                    'https://image.winudf.com/v2/image/bW9iaS5hbmRyb2FwcC5wcm9zcGVyaXR5YXBwcy5jNTExMV9zY3JlZW5fN18xNTI0MDQxMDUwXzAyMQ/screen-7.jpg?fakeurl=1&type=.jpg',
                  ),
                ),
              ),
              otherAccountsPictures: [
                IconButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/auth');
                  },
                  icon: Icon(Icons.logout, color: Colors.blue),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text("О приложении"),
            leading: Icon(Icons.info, color: Colors.blue),
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => InfoPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
