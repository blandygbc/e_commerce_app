import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/material.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenHeight(15)),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kBannerColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(TextSpan(
          text: "A Summer Surprise\n",
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(
                text: "Cashback 20%",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
          ])),
    );
  }
}
