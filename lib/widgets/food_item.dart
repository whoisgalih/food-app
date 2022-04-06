import 'package:flutter/material.dart';
import 'package:food_app/pages/food_item_page.dart';
import 'package:food_app/theme/theme.dart';

class FoodItem extends StatelessWidget {
  const FoodItem({
    Key? key,
    required this.id,
    required this.image,
    required this.name,
    required this.price,
  }) : super(key: key);

  final String id;
  final String image;
  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FoodItemPage(
                  id: id, image: image, name: name, price: price))),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(10, 0, 0, 0),
                          blurRadius: 60,
                          offset: Offset(0, 30)),
                    ],
                    color: white,
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: white,
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(7, 0, 0, 0),
                                blurRadius: 40,
                                offset: Offset(0, 40)),
                          ],
                        ),
                        child: AspectRatio(
                          aspectRatio: 1 / 1,
                          child: Image(
                              image: AssetImage('assets/images/foods/' + image),
                              width: double.infinity,
                              fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(name,
                          style: Theme.of(context).textTheme.subtitle1,
                          textAlign: TextAlign.center),
                      const SizedBox(height: 12),
                      Text(price,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(
                                  color: primary50,
                                  fontWeight: FontWeight.w700))
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
