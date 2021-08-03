import 'package:e_commerce_app/components/custom_suffix_icon.dart';
import 'package:e_commerce_app/components/default_button.dart';
import 'package:e_commerce_app/components/form_error.dart';
import 'package:e_commerce_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  SignUpForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? confirmPassword;
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
                height: getProportionateScreenHeight(30),
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
                height: getProportionateScreenHeight(30),
              ),
              buildFormField(
                isObscure: true,
                onSaveInput: "ConfirmPassword",
                label: "Confirm Password",
                hint: "Re-enter your password",
                icon: iconLock,
                iconHeight: 25.0,
                errorMessage: kPassNullError,
              ),
              FormErrors(errors: errors),
              SizedBox(
                height: getProportionateScreenHeight(40),
              ),
              DefaultButton(
                text: "Continue",
                press: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.pushNamed(
                        context, CompleteProfileScreen.routeName);
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
        } else if (identical(onSaveInput, "ConfirmPassword")) {
          confirmPassword = newValue;
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
        } else if (identical(onSaveInput, "ConfirmPassword") &&
            (identical(password, value)) &&
            errors.contains(kMatchPassError)) {
          setState(() {
            errors.remove(kMatchPassError);
          });
        }
        if (identical(onSaveInput, "Password")) password = value;
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
        } else if (identical(onSaveInput, "ConfirmPassword") &&
            (!identical(password, value)) &&
            !errors.contains(kMatchPassError)) {
          setState(() {
            errors.add(kMatchPassError);
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
