import 'dart:ui';

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
  bool like = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.chevron_left_rounded, size: 24)),
                  GestureDetector(
                      onTap: () => setState(() {
                            if (like) {
                              like = false;
                            } else {
                              like = true;
                            }
                          }),
                      child: Icon(
                          like
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          size: 24)),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          const BoxShadow(
                              color: Color.fromARGB(7, 0, 0, 0),
                              blurRadius: 40,
                              offset: Offset(0, 40)),
                        ],
                      ),
                      child: FractionallySizedBox(
                        widthFactor: 0.7,
                        child: Image(
                          image:
                              AssetImage('assets/images/foods/' + widget.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            widget.name,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          const SizedBox(height: 4),
                          Text(widget.price,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(color: primary50)),
                        ],
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Food Info',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                  'Nulla ut voluptate eu commodo consequat amet.',
                                  style: Theme.of(context).textTheme.bodyText2),
                            ])),
                    Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Delivery Info',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                  'Mollit nostrud veniam mollit qui reprehenderit aliquip proident do non nisi dolore.',
                                  style: Theme.of(context).textTheme.bodyText2),
                            ])),
                  ],
                ),
              ),
            ),
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  margin: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      QtyStf(
                        callback: (val) => setState(() => _qty = val),
                      ),
                      SizedBox(width: 26),
                      Expanded(
                        child: CustomButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
