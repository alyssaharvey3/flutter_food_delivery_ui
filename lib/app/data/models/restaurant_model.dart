import 'food_model.dart';

class RestaurantModel {
  RestaurantModel({
    this.imageUrl,
    this.name,
    this.address,
    this.rating,
    this.menu,
  });

  final String? imageUrl;
  final String? name;
  final String? address;
  final int? rating;
  final List<FoodModel>? menu;
}
