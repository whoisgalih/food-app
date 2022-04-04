import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:submission/theme/theme.dart';

typedef void IntCallback(int val);

class QtyStf extends StatefulWidget {
  final IntCallback callback;
  final double height;
  final TextStyle? textStyle;

  const QtyStf({
    Key? key,
    this.height = 16.0,
    this.textStyle,
    required this.callback,
  }) : super(key: key);

  @override
  State<QtyStf> createState() => _QtyStfState();
}

class _QtyStfState extends State<QtyStf> {
  int _qty = 1;

  int get quantity => _qty;

  void _add() {
    setState(() {
      _qty += 1;
    });
    widget.callback(quantity);
  }

  void _substract() {
    if (_qty != 1) {
      setState(() {
        _qty -= 1;
      });
    }
    widget.callback(quantity);
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
          Text(_qty.toString(), style: widget.textStyle ?? body('2', gray)),
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
