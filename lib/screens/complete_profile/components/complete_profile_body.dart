import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'complete_profile_form.dart';

class CompleteProfileBody extends StatelessWidget {
  const CompleteProfileBody({Key? key}) : super(key: key);

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
              "Complete your Profile!",
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
              height: SizeConfig.screenHeight! * 0.02,
            ),
            CompleteProfileForm(),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.03,
            ),
            Text(
              "By continuing you confirm that you agree \nwith our Term and Condition",
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    ));
  }
}
