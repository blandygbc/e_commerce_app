import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRatio = 1.02,
    required this.product,
  }) : super(key: key);

  final double width, aspectRatio;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: aspectRatio,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                decoration: BoxDecoration(
                  color: kSecondaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(product.images[0]),
              ),
            ),
            Text(
              product.title,
              style: TextStyle(color: Colors.black),
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${product.price}",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: getProportionateScreenWidth(18)),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(4)),
                    width: getProportionateScreenWidth(20),
                    height: getProportionateScreenWidth(20),
                    decoration: BoxDecoration(
                      color: product.isFavourite
                          ? kPrimaryLightColor
                          : kSecondaryColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      iconHeart,
                      color: product.isFavourite
                          ? kFavProductColor
                          : kNotFavProductColor,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
