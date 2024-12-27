import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/pages/food_page.dart';
import 'package:food_app/theme/theme.dart';
import 'package:food_app/widgets/custom_button.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary50,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 48, vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      'assets/images/icon/restaurant.svg',
                      color: primary50,
                      height: 20,
                      width: 20,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Food for Everyone',
                    style: Theme.of(context).textTheme.displaySmall,
                  )
                ],
              ),
              CustomButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FoodPage(),
                    ),
                  );
                },
                isOrange: false,
                text: 'Continue',
              )
            ],
          ),
        ),
      ),
    );
  }
}
