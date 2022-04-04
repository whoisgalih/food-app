import 'package:flutter/material.dart';
import 'package:submission/widgets/food_item.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FoodList extends StatelessWidget {
  final List<Map> foods;

  const FoodList({
    Key? key,
    required this.foods,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      padding: EdgeInsets.symmetric(horizontal: 30),
      crossAxisCount: 2,
      mainAxisSpacing: 17,
      crossAxisSpacing: 30,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final food = foods[index];
        return FoodItem(
            id: food['id'],
            image: food['image'],
            name: food['name'],
            star: food['star'],
            price: food['price']);
      },
      itemCount: foods.length,
    );
  }
}
