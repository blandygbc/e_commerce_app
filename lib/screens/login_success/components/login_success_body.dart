import 'package:e_commerce_app/components/default_button.dart';
import 'package:e_commerce_app/screens/home/home_screen.dart';
import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class LoginSuccessBody extends StatelessWidget {
  const LoginSuccessBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        SizedBox(
          height: SizeConfig.screenHeight! * 0.04,
        ),
        Container(
          width: double.infinity,
          height: SizeConfig.screenHeight! * 0.4,
          child: Image.asset(
            kImageLoginSuccess,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.08,
        ),
        Text(
          "Login Success",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.08,
        ),
        SizedBox(
          width: SizeConfig.screenWidth! * 0.6,
          child: DefaultButton(
            text: "Back to Home",
            press: () => Navigator.of(context).pushNamed(HomeScreen.routeName),
          ),
        ),
      ]),
    );
  }
}
