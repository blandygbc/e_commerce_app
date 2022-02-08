import 'package:e_commerce_app/components/rounded_icon_btn.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF5F6F9),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(AppBar().preferredSize.height),
            child: AppBar(
              backgroundColor: Colors.transparent,
              leading: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedIconBtn(                    
                    iconData: Icons.arrow_back_ios,
                    press: () => Navigator.pop(context),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "4.5",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SvgPicture.asset(iconStar)
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({
    required this.product,
  });
}
