import 'package:e_commerce_app/components/social_card.dart';
import 'package:e_commerce_app/screens/sign_up/components/sign_up_form.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SingUpBody extends StatelessWidget {
  const SingUpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight! * 0.01,
            ),
            Text(
              "Register Account!",
              style: headingStyle,
            ),
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            Text(
              "Complete yours details or\n continue with social media",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.03,
            ),
            SignUpForm(),
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
              height: getProportionateScreenHeight(20),
            ),
            Text(
              "By continuing you confurm that you agree \nwith our Term and Condition",
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    ));
  }
}
