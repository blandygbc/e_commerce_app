import 'package:e_commerce_app/screens/home/components/categories.dart';
import 'package:e_commerce_app/screens/home/components/discount_banner.dart';
import 'package:e_commerce_app/screens/home/components/popular_products.dart';
import 'package:e_commerce_app/screens/home/components/special_offers.dart';
import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/material.dart';
import 'home_header.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenWidth(20)),
          HomeHeader(),
          SizedBox(height: getProportionateScreenWidth(20)),
          DiscountBanner(),
          SizedBox(height: getProportionateScreenWidth(30)),
          Categories(),
          SizedBox(height: getProportionateScreenWidth(20)),
          SpecialOffers(),
          SizedBox(height: getProportionateScreenWidth(20)),
          PopularProducts(),
          SizedBox(height: getProportionateScreenWidth(30)),
        ],
      ),
    ));
  }
}
