import 'package:e_commerce_app/screens/home/components/search_field.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconBtnWithCounter(
            svgSrc: iconCart,
            press: () {
              //show notifications
            },
          ),
          IconBtnWithCounter(
            svgSrc: iconBell,
            numOfItems: 3,
            press: () {
              //show notifications
            },
          ),
        ],
      ),
    );
  }
}
