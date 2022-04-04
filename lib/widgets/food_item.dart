import 'package:flutter/material.dart';
import 'package:food_app/pages/food_item_page.dart';
import 'package:food_app/theme/theme.dart';

class FoodItem extends StatefulWidget {
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
  State<FoodItem> createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> {
  final GlobalKey _imageKey = GlobalKey();

  double _getImageHeight() {
    try {
      RenderBox renderBox =
          _imageKey.currentContext?.findRenderObject() as RenderBox;
      return renderBox.size.width;
    } catch (e) {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FoodItemPage(
                  id: widget.id,
                  image: widget.image,
                  name: widget.name,
                  price: widget.price))),
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: _getImageHeight() / 2,
              ),
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
                      SizedBox(
                        height: _getImageHeight() / 2,
                      ),
                      Text(widget.name,
                          style: Theme.of(context).textTheme.subtitle1,
                          textAlign: TextAlign.center),
                      const SizedBox(height: 12),
                      Text(widget.price,
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
                  key: _imageKey,
                  image: AssetImage('assets/images/foods/' + widget.image),
                  width: double.infinity,
                  // height: _getImageHeight(),
                  fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
