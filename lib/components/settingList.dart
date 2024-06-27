import 'package:flutter/material.dart';

class settingList extends StatelessWidget {
  const settingList({required this.title, required this.onPressed});
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward,
              color: Colors.black,
            ),
            onTap: onPressed,
            mouseCursor: SystemMouseCursors.click,
          ),
      
        ],
      ),
    );
  }
}
