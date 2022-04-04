import 'package:flutter/material.dart';
import 'package:submission/pages/food_item_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:submission/theme/theme.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class FoodItem extends StatefulWidget {
  const FoodItem({
    Key? key,
    required this.id,
    required this.image,
    required this.name,
    required this.star,
    required this.price,
  }) : super(key: key);

  final String id;
  final String image;
  final String name;
  final String star;
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
      return renderBox.size.height;
    } catch (e) {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showMaterialModalBottomSheet(
          barrierColor: const Color(0x4D000000),
          expand: false,
          context: context,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            return Wrap(
              children: [
                FoodItemPage(
                    id: widget.id,
                    image: widget.image,
                    name: widget.name,
                    star: widget.star,
                    price: widget.price)
              ],
            );
          }),
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
                    boxShadow: [
                      const BoxShadow(
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
            margin: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: white,
              boxShadow: [
                const BoxShadow(
                    color: Color.fromARGB(7, 0, 0, 0),
                    blurRadius: 40,
                    offset: Offset(0, 40)),
              ],
            ),
            child: Image(
                key: _imageKey,
                image: AssetImage('assets/images/foods/' + widget.image),
                width: double.infinity,
                fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
