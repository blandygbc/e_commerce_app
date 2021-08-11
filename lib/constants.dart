import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/material.dart';
//import 'package:shop_app/size_config.dart';

//Text Constants
const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);
const kFadedColor = Color(0xDDD8D8D8);
const kTextHeading = Color(0xFF8B8B8B);
const kSocialIconBackground = Color(0xFFF5F6F9);
const kAlertColor = Color(0xFFDD4848);

//Config Constants
const kAnimationDuration = Duration(milliseconds: 200);

//Image Constants
const kImageSplash1 = "assets/images/splash_1.png";
const kImageSplash2 = "assets/images/splash_2.png";
const kImageSplash3 = "assets/images/splash_3.png";
const kImageLoginSuccess = "assets/images/success.png";

//Icons Constants
const iconMail = "assets/icons/Mail.svg";
const iconLock = "assets/icons/Lock.svg";
const iconError = "assets/icons/Error.svg";
const iconFacebook = "assets/icons/facebook-2.svg";
const iconGoole = "assets/icons/google-icon.svg";
const iconTwitter = "assets/icons/twitter.svg";
const iconUser = "assets/icons/User.svg";
const iconPhone = "assets/icons/Phone.svg";
const iconLocationPoint = "assets/icons/Location point.svg";
const iconBell = "assets/icons/Bell.svg";
const iconCart = "assets/icons/Cart Icon.svg";

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}
