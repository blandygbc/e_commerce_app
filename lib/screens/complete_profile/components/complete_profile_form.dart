import 'package:e_commerce_app/components/custom_suffix_icon.dart';
import 'package:e_commerce_app/components/default_button.dart';
import 'package:e_commerce_app/components/form_error.dart';
import 'package:e_commerce_app/screens/otp/otp_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  CompleteProfileForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? addres;
  final List<String> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error!);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error!);
      });
    }
  }

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
                onSaveInput: "FristName",
                label: "Frist Name",
                hint: "Enter your Frist Name",
                icon: iconUser,
                iconHeight: 20.0,
                errorMessage: kNamelNullError,
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              buildFormField(
                isObscure: true,
                onSaveInput: "LastName",
                label: "Last Name",
                hint: "Enter your Last Name",
                icon: iconUser,
                iconHeight: 20.0,
                errorMessage: kNamelNullError,
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              buildFormField(
                type: TextInputType.number,
                onSaveInput: "PhoneNumber",
                label: "Phone Number",
                hint: "Enter your phone number",
                icon: iconPhone,
                iconHeight: 25.0,
                errorMessage: kPhoneNumberNullError,
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              buildFormField(
                onSaveInput: "Adress",
                label: "Adress",
                hint: "Enter your adress",
                icon: iconLocationPoint,
                iconHeight: 25.0,
                errorMessage: kPhoneNumberNullError,
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
                    Navigator.of(context)
                        .pushNamed(OtpScreen.routeName, arguments: phoneNumber);
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
        if (identical(onSaveInput, "FirstName")) {
          firstName = newValue;
        } else if (identical(onSaveInput, "LastName")) {
          lastName = newValue;
        } else if (identical(onSaveInput, "PhoneNumber")) {
          phoneNumber = newValue;
        } else if (identical(onSaveInput, "Addres")) {
          addres = newValue;
        }
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            removeError(error: errorMessage);
          });
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          setState(() {
            addError(error: errorMessage);
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
