import 'package:delivery_thema/utils/theme.dart';
import 'package:flutter/material.dart';

class BotonItem extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final EdgeInsets padding;

  const BotonItem({
    Key key,
    this.onTap,
    this.text,
    this.padding = const EdgeInsets.all(20.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: deliveryGradients,
          ),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        // width: width,
        child: Padding(
          padding: padding,
          child: Text(
            text,
            style: TextStyle(color: DeliveryColors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
