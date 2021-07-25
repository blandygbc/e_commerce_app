import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';
import '../size_config.dart';

class SocialCard extends StatelessWidget {
  final String icon;
  final VoidCallback press;
  const SocialCard({
    Key? key,
    required this.icon,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      height: getProportionateScreenHeight(48),
      width: getProportionateScreenWidth(48),
      padding: EdgeInsets.all(getProportionateScreenWidth(12)),
      decoration: BoxDecoration(
        color: kSocialIconBackground,
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(icon),
    );
  }
}
