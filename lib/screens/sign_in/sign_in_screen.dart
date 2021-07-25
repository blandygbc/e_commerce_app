import 'package:e_commerce_app/screens/sign_in/components/sing_in_body.dart';
import 'package:flutter/material.dart';

class SingInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  const SingInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
        centerTitle: true,
      ),
      body: SingInBody(),
    );
  }
}
