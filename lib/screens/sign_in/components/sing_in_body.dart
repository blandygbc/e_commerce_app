import 'package:e_commerce_app/components/social_card.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/screens/sign_in/components/sign_form.dart';
import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/material.dart';

import 'no_account_text.dart';

class SingInBody extends StatelessWidget {
  const SingInBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight! * 0.04,
            ),
            Text(
              "Welcome Back!",
              style: TextStyle(
                color: Colors.black,
                fontSize: getProportionateScreenWidth(28),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            Text(
              "Sign in with your email and password \nor continue with social media",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.04,
            ),
            SignForm(),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.06,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialCard(
                  icon: iconGoole,
                  press: () {},
                ),
                SocialCard(
                  icon: iconFacebook,
                  press: () {},
                ),
                SocialCard(
                  icon: iconTwitter,
                  press: () {},
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            NoAccountText(),
          ],
        ),
      ),
    ));
  }
}
