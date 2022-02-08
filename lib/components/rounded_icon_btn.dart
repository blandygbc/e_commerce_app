import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/material.dart';

class RoundedIconBtn extends StatelessWidget {
  const RoundedIconBtn({
    Key? key,
    required this.iconData,
    required this.press,
  }) : super(key: key);

  final IconData iconData;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      
      height: getProportionateScreenWidth(10),
      width: getProportionateScreenWidth(10),
      child: IconButton(
        
        padding: EdgeInsets.zero,
        onPressed: press,
        icon: Icon(iconData),
      ),
    );
  }
}
