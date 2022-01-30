import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/material.dart';
import 'components/home_body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: HomeBody(),
    );
  }
}
