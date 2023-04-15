import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/data_export.dart';
import 'widgets/rating_stars.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({Key? key, this.restaurant}) : super(key: key);

  final RestaurantModel? restaurant;

  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  Center _buildMenuItem(FoodModel menuItem) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 175,
            width: 175,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  menuItem.imageUrl!,
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Container(
            height: 175,
            width: 175,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black87.withOpacity(0.3),
                  Colors.black54.withOpacity(0.3),
                  Colors.black38.withOpacity(0.3),
                ],
                stops: [0.1, 0.5, 0.7, 0.6],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
          ),
          Positioned(
            bottom: 65,
            child: Column(
              children: [
                Text(
                  menuItem.name!,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                Text(
                  '\$${menuItem.price}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add,
                ),
                iconSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: widget.restaurant!.imageUrl!,
                  child: Image(
                    image: AssetImage(
                      widget.restaurant!.imageUrl!,
                    ),
                    height: 220,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: IconButton(
                        onPressed: Get.back,
                        icon: Icon(
                          Icons.arrow_back,
                        ),
                        color: Colors.white,
                        iconSize: 20,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite,
                        ),
                        color: Colors.red,
                        iconSize: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.restaurant!.name!,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '0.2 miles away',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                  RatingStars(rating: widget.restaurant!.rating),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    widget.restaurant!.address!,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PrimaryButton(title: 'Reviews'),
                PrimaryButton(title: 'Contact'),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'Menu',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.count(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(10),
                crossAxisCount: 2,
                children:
                    List.generate(widget.restaurant!.menu!.length, (index) {
                  final food = widget.restaurant!.menu![index];
                  return _buildMenuItem(food);
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 30),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
