import 'package:flutter/material.dart';
import 'package:submission/theme/theme.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isOrange;
  final String text;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.isOrange,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                elevation: 0,
                primary: isOrange ? primary50 : white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16)),
            onPressed: onPressed,
            child: Text(text,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    ?.copyWith(color: isOrange ? white : primary50))));
  }
}
