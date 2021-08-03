import 'package:e_commerce_app/screens/otp/components/otp_form.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce_app/size_config.dart';

import '../../../constants.dart';

class OtpBody extends StatelessWidget {
  const OtpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String phoneNumber = ModalRoute.of(context)!.settings.arguments as String;
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.04,
                ),
                Text(
                  "OTP Verification",
                  style: headingStyle,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(5),
                ),
                Text.rich(
                  TextSpan(
                    text: "We sent your code to ",
                    children: [
                      TextSpan(
                        text: phoneNumber,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                buildTimer(),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.15,
                ),
                OtpForm(),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.10,
                ),
                GestureDetector(
                  onTap: () {
                    //Resend OTP
                  },
                  child: Text(
                    "Resend OTP code",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This code will expire in "),
        TweenAnimationBuilder(
          tween: Tween(
            begin: 30.0,
            end: 0,
          ),
          duration: Duration(seconds: 30),
          builder: (context, value, _) => Text(
            "00:${(value as num).toInt()}",
            style: TextStyle(color: kPrimaryColor),
          ),
          onEnd: () {},
        )
      ],
    );
  }
}
