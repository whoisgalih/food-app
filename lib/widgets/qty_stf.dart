import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/theme/theme.dart';

class QTY extends StatefulWidget {
  final double height;
  final TextStyle? textStyle;

  const QTY({
    Key? key,
    this.height = 16.0,
    this.textStyle,
  }) : super(key: key);

  @override
  State<QTY> createState() => _QTYState();
}

class _QTYState extends State<QTY> {
  int _qty = 1;

  int get quantity => _qty;

  void _add() {
    setState(() {
      _qty += 1;
    });
  }

  void _substract() {
    if (_qty != 1) {
      setState(() {
        _qty -= 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => _substract(),
            child: SvgPicture.asset('assets/images/icon/remove-circle.svg',
                height: widget.height,
                width: widget.height,
                color: _qty == 1 ? gray : primary50),
          ),
          Text(_qty.toString(),
              style: widget.textStyle ??
                  Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: gray)),
          GestureDetector(
            onTap: () => _add(),
            child: SvgPicture.asset('assets/images/icon/add-circle.svg',
                height: widget.height, width: widget.height, color: primary50),
          ),
        ],
      ),
    );
  }
}
