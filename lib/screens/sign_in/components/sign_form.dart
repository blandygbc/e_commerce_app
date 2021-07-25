import 'package:e_commerce_app/components/default_button.dart';
import 'package:e_commerce_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:e_commerce_app/screens/login_success/login_success_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../components/custom_suffix_icon.dart';
import 'form_error.dart';

class SignForm extends StatefulWidget {
  SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool remember = false;
  final List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              buildFormField(
                type: TextInputType.emailAddress,
                onSaveInput: "Email",
                label: "Email",
                hint: "Enter your email",
                icon: iconMail,
                iconHeight: 18.0,
                errorMessage: kEmailNullError,
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              buildFormField(
                isObscure: true,
                onSaveInput: "Password",
                label: "Password",
                hint: "Enter your password",
                icon: iconLock,
                iconHeight: 25.0,
                errorMessage: kPassNullError,
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Row(
                children: [
                  Checkbox(
                    value: remember,
                    activeColor: kPrimaryColor,
                    onChanged: (value) {
                      setState(() {
                        remember = value!;
                      });
                    },
                  ),
                  Text("Remember me"),
                  Spacer(),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context, ForgotPasswordScreen.routeName),
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
              FormErrors(errors: errors),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              DefaultButton(
                text: "Sing In",
                press: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.of(context)
                        .pushNamed(LoginSuccessScreen.routeName);
                  }
                },
              )
            ],
          ),
        ));
  }

  TextFormField buildFormField({
    TextInputType? type,
    bool isObscure: false,
    required String onSaveInput,
    required String label,
    required String hint,
    required String icon,
    required double iconHeight,
    required String errorMessage,
  }) {
    return TextFormField(
      keyboardType: type,
      obscureText: isObscure,
      onSaved: (newValue) {
        if (identical(onSaveInput, "Email")) {
          email = newValue;
        } else if (identical(onSaveInput, "Password")) {
          password = newValue;
        }
      },
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(errorMessage)) {
          setState(() {
            errors.remove(errorMessage);
          });
        } else if (identical(onSaveInput, "Email") &&
            emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        } else if (identical(onSaveInput, "Password") &&
            (value.length >= 8) &&
            errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(errorMessage)) {
          setState(() {
            errors.add(errorMessage);
          });
          return "";
        } else if (identical(onSaveInput, "Email") &&
            !emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
          return "";
        } else if (identical(onSaveInput, "Password") &&
            (value.length < 8) &&
            !errors.contains(kShortPassError)) {
          setState(() {
            errors.add(kShortPassError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: icon,
          height: iconHeight,
        ),
      ),
    );
  }
}
