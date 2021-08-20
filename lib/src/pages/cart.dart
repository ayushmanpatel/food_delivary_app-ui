import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'package:foodify/src/screens/main_screen.dart';

class CartPage extends StatefulWidget {
  final String image;
  final String dishname;
  final double price;
  final double totalitems;
  final double totalprice;
  CartPage(
      {this.dishname,
      this.image,
      this.price,
      this.totalitems,
      this.totalprice});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final textstyle = TextStyle(color: Color(0xff6e80b0), fontSize: 14.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: new IconButton(
          icon: new Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Cart",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: ListView(
          children: <Widget>[
            Container(
              height: 96.0,
              width: 343.0,
              padding: EdgeInsets.only(top: 24.0, left: 32.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color(0xff6d61f2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Deliver To",
                    style: TextStyle(fontSize: 14.0, color: Colors.white70),
                  ),
                  Row(
                    children: [
                      Text(
                        "Sundargarh,Odisha",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      new IconButton(
                        icon: new Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              height: 96.0,
              width: 343.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      Container(
                        height: 80.0,
                        width: 80.0,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Image.asset(
                          "assets/biriyani.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        "Chicken Biriyani",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "₹ ${widget.price}",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 90.0,
            ),
            Material(
              elevation: 0.0,
              color: Color(0xa6e80b0),
              borderRadius: BorderRadius.circular(10.0),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                    hintText: "Promo Code",
                    suffixIcon: Material(
                      elevation: 0.0,
                      color: Color(0xa6e80b0),
                      child: Icon(
                        EvaIcons.plus,
                      ),
                    ),
                    border: InputBorder.none),
              ),
            ),
            Divider(
              indent: null,
              thickness: 0.0,
              color: Colors.black,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Item Total", style: textstyle),
                    Text(
                      "₹ ${widget.totalprice}",
                      style: textstyle,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Discount", style: textstyle),
                    Text(
                      "₹ 0.0",
                      style: textstyle,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "₹ ${widget.totalprice}",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
              height: 64.0,
              width: 343.0,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildPopupDialog(context),
                  );
                },
                child: Text(
                  "Confirm Order",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff6d61f2),
                  elevation: 10.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildPopupDialog(BuildContext context) {
  return new AlertDialog(
    backgroundColor: Colors.yellowAccent,
    //title: const Text('Popup example'),
    content: Container(
      height: 300.0,
      width: 300.0,
      child: new Column(
        //mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            maxRadius: 100.0,
            child: Icon(
              EvaIcons.shoppingCart,
              size: 100.0,
            ),
          ),
          Text("Order Placed!"),
          ElevatedButton(onPressed: () {}, child: Text("Track Your Order"))
        ],
      ),
    ),
    actions: <Widget>[
      new ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MainScreen()),
          );
        },
        //textColor: Theme.of(context).primaryColor,
        child: const Text('Close'),
      ),
    ],
  );
}
