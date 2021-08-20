import 'package:flutter/material.dart';

class HomeTopInfo extends StatelessWidget {
  final textStyle = TextStyle(
      fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Color(0xffffffff),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 0.0, bottom: 0.0, left: 0.0, right: 0.0),
          child: TextField(
            decoration: InputDecoration(
                hintText: "Home",
                hintStyle: textStyle,
                prefixIcon: Material(
                  color: Color(0xfe5e5e5),
                  child: Icon(
                    Icons.location_on,
                    color: Color(0xff6d61f2),
                    size: 40.0,
                  ),
                ),
                border: InputBorder.none),
          ),
        ),
      ),
      //for taste the best and order now return row and for address bar return material
      // Column(//
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: <Widget>[
      //     Text(
      //       "Taste The Best",
      //       style: textStyle,
      //     ),
      //     Text(
      //       "Order Now!",
      //       style: textStyle,
      //     )
      //   ],
      // ),
      // Icon(
      //   Icons.notifications_none,
      //   size: 30.0,
      //   color: Theme.of(context).primaryColor,
      // ),
    );
  }
}
