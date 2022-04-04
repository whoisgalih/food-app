import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:submission/theme/theme.dart';

class PillText extends StatefulWidget {
  final String text;
  final bool active;

  const PillText({
    Key? key,
    required this.text,
    required this.active,
  }) : super(key: key);

  @override
  State<PillText> createState() => _PillTextState();
}

class _PillTextState extends State<PillText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final int d = 300;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: d));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.active) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    return AnimatedContainer(
        duration: Duration(milliseconds: d),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Row(
          children: [
            Text(this.widget.text,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: widget.active ? white : black)),
            SizedBox(width: 5),
            RotationTransition(
              turns: Tween(begin: 0.0, end: 45 / 360).animate(_controller),
              child: SvgPicture.asset(
                'assets/images/icon/add-circle.svg',
                height: 16,
                width: 16,
                color: widget.active ? white : primary50,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: widget.active ? primary50 : Color(0xFFF9F9F9),
            borderRadius: BorderRadius.circular(20)));
  }
}
