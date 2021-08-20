import 'package:flutter/material.dart';
import 'package:foodify/src/model/restaurant_model.dart';
import 'package:foodify/src/widget/food_category.dart';
import 'package:foodify/src/widget/home_top_info.dart';
import 'package:foodify/src/widget/resturants.dart';

import 'package:foodify/src/data/restaurant_data.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Restaurant> _restaurants;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRestaurants();
  }

  Future<void> getRestaurants() async {
    _restaurants = await RestaurantApi.getRestaurant();
    setState(() {
      _isLoading = false;
    });
    // print(_restaurants);
  }

  final textStyle = TextStyle(
    fontSize: 35.0,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: ListView(
        padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 16.0),
        children: <Widget>[
          HomeTopInfo(),
          //SearchField(),
          SizedBox(height: 20.0),
          FoodCategory(),
          SizedBox(
            height: 40.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Popular Restaurants",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                EvaIcons.options2Outline,
                size: 24.0,
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          _isLoading
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: _restaurants.map(_buildRestaurants).toList(),
                )
        ],
      ),
    );
  }
}

Widget _buildRestaurants(Restaurant restaurants) {
  return Container(
    margin: EdgeInsets.only(bottom: 20.0),
    width: 500.0,
    //height: 80.0,
    child: Restaurants(
      name: restaurants.name,
      images: restaurants.images,
      category: restaurants.totalTime,
      rating: restaurants.rating,
    ),
  );
}
