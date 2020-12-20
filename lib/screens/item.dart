import 'package:flutter/material.dart';
import 'package:menu/models/menu.dart';

class MenuItem extends StatelessWidget {
  final Menu selectedMenu;

  MenuItem({this.selectedMenu});

  @override
  Widget build(BuildContext context) {
    final image = selectedMenu.img;
    final title = selectedMenu.title;
    final price = selectedMenu.price;
    final desc = selectedMenu.desc;

    return Card(
        child: Padding(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Container(
          child: Image.asset(image),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.orange[400], width: 5.0)),
        ),
        SizedBox(height: 16),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Text(price,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[400])),
            ]),
        SizedBox(height: 8),
        Text(desc, style: TextStyle(fontSize: 16, color: Colors.grey))
      ]),
    ));
  }
}
