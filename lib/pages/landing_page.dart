import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:submission/pages/food_page.dart';
import 'package:submission/theme/theme.dart';
import 'package:submission/widgets/custom_button.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primary50,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 48, vertical: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                          'assets/images/icon/restaurant.svg',
                          color: primary50,
                          height: 20,
                          width: 20),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Food for Everyone',
                      style: Theme.of(context).textTheme.headline3,
                    )
                  ],
                ),
                CustomButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FoodPage()));
                    },
                    isOrange: false,
                    text: 'Continue')
              ],
            ),
          ),
        ));
  }
}
