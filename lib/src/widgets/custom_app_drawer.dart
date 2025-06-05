import 'package:flutter/material.dart';
import 'package:utilidades/src/app/app_menu.dart';

class CustomAppDrawer extends StatelessWidget {
  const CustomAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            color: Colors.teal,
            height: 150,
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: 1),
              child: Center(
                child: Image.asset("assets/logo/kings.png", width: 100,),
              ),
            )
          ),
          ...appMenuItems.map(
            (item) => ListTile(
              leading: Icon(item.icon),
              title:  Text(item.title),
              onTap: (){
                Navigator.pushReplacementNamed(context, item.route);
              },
            )
          )
        ]
      ),
    );
  }
}