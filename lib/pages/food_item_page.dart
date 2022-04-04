import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';
import 'package:submission/models/food.dart';
import 'package:submission/widgets/custom_button.dart';
// import 'package:submission/provider/food_provider.dart';
import 'package:submission/widgets/qty_stf.dart';
import 'package:submission/theme/theme.dart';
// import 'package:submission/widgets/qty_stl.dart';

class FoodItemPage extends StatefulWidget {
  final String id;
  final String image;
  final String name;
  final String star;
  final String price;

  const FoodItemPage({
    Key? key,
    required this.id,
    required this.image,
    required this.name,
    required this.star,
    required this.price,
  }) : super(key: key);

  @override
  State<FoodItemPage> createState() => _FoodItemPageState();

  static _FoodItemPageState? of(BuildContext context) =>
      context.findAncestorStateOfType<_FoodItemPageState>();
}

class _FoodItemPageState extends State<FoodItemPage> {
  int _qty = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Stack(children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image(
                  image: AssetImage('assets/images/foods/' + widget.image),
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover),
              Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.name,
                              style: title('1'),
                            ),
                            const SizedBox(height: 8),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                      'assets/images/icon/star.svg',
                                      height: 16,
                                      width: 16),
                                  const SizedBox(width: 8),
                                  SvgPicture.asset(
                                      'assets/images/icon/star.svg',
                                      height: 16,
                                      width: 16),
                                  const SizedBox(width: 8),
                                  SvgPicture.asset(
                                      'assets/images/icon/star.svg',
                                      height: 16,
                                      width: 16),
                                  const SizedBox(width: 8),
                                  SvgPicture.asset(
                                      'assets/images/icon/star.svg',
                                      height: 16,
                                      width: 16),
                                  const SizedBox(width: 8),
                                  SvgPicture.asset(
                                      'assets/images/icon/star.svg',
                                      height: 16,
                                      width: 16),
                                  const SizedBox(width: 8),
                                  Text(widget.star, style: body('2', gray)),
                                ])
                          ],
                        ),
                        QtyStf(
                          callback: (val) => setState(() => _qty = val),
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(widget.price, style: title('1')),
                    const SizedBox(height: 32),
                    CustomButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Successfuly place order',
                                  style: body('1', white)),
                            ],
                          ),
                          duration: const Duration(milliseconds: 3000),
                          padding: const EdgeInsets.all(16),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 24),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ));
                      },
                      isOrange: true,
                      text: 'Place Order',
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Center(
            child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: SvgPicture.asset(
                    'assets/images/icon/action bottom sheet.svg',
                    height: 4,
                    width: 40)))
      ]),
    );
  }
}
