import 'package:champian_web/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';
import 'package:champian_web/style_guide/colors.dart';
// import 'dart:html' as html;

class LoginBody extends StatelessWidget {
  final MediaQueryData queryData;

  LoginBody({
    Key? key,
    required this.queryData,
  }) : super(key: key);
  // static final appContainer =
  //     html.window.document.getElementById('app-container');

  final LoginController mController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Get's started.",
          style: GoogleFonts.lato(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 28,
            fontWeight: FontWeight.w800,
            fontStyle: FontStyle.normal,
            color: blackColor,
          ),
        ),
        RichText(
          text: TextSpan(
            text: 'Don\'t have an account?',
            children: [
              TextSpan(
                text: ' Sign up',
                style: TextStyle(color: primaryColor, fontSize: 16),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print("Signup");
                  },
              ),
            ],
          ),
        ),
        SizedBox(
          height: queryData.size.height / 8,
        ),
        GetBuilder<LoginController>(builder: (value) {
          return AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            transitionBuilder: (Widget child, Animation<double> animation) =>
                ScaleTransition(
              child: child,
              scale: animation,
            ),
            child: mController.switchContainer
                ? HeadingText(
                    txt: "Enter OTP",
                  )
                : HeadingText(
                    txt: "Enter your Phone number",
                  ),
          );
        }),
        GetBuilder<LoginController>(builder: (value) {
          return AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            transitionBuilder: (Widget child, Animation<double> animation) =>
                SlideTransition(
              child: child,
              position: new Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
            ),
            child: mController.switchContainer
                ? EnterOTPContainer(
                    mController: mController, queryData: queryData)
                : EnterPhoneNumberContainer(
                    mController: mController,
                    queryData: queryData,
                  ),
          );
        }),
      ],
    );
  }
}

class HeadingText extends StatelessWidget {
  const HeadingText({
    Key? key,
    required this.txt,
  }) : super(key: key);

  final String txt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        txt,
        style: GoogleFonts.lato(
          textStyle: Theme.of(context).textTheme.headline4,
          fontSize: 14,
          color: grey,
        ),
      ),
    );
  }
}

class EnterPhoneNumberContainer extends StatelessWidget {
  EnterPhoneNumberContainer({
    Key? key,
    required this.mController,
    required this.queryData,
  }) : super(key: key);

  final LoginController mController;
  final MediaQueryData queryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: queryData.size.width / 2,
          child: TextFormField(
            controller: mController.mobileNumber,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor)),
              labelStyle: TextStyle(
                color: primaryColor,
              ),
              errorText:
                  mController.errorMsg != "" ? mController.errorMsg : null,
              prefix: Icon(
                Icons.phone,
                color: primaryColor,
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CheckboxListTile(
              title: RichText(
                text: TextSpan(
                  text: 'I agree to Platfrom\'s',
                  children: [
                    TextSpan(
                      text: ' Terms and Service',
                      style: TextStyle(color: primaryColor, fontSize: 16),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print("Terms and Service");
                        },
                    ),
                    TextSpan(
                      text: ' and',
                      style: TextStyle(fontSize: 16),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print("Signup");
                        },
                    ),
                    TextSpan(
                      text: ' Privacy and Policy',
                      style: TextStyle(color: primaryColor, fontSize: 16),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print("Privacy and Policy");
                        },
                    ),
                  ],
                ),
              ),
              value: mController.checkBox,
              onChanged: (newValue) {
                mController.setCheckBox();
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            Visibility(
              visible: !mController.checkBox,
              child: Text(
                'Please select the checkbox',
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 14,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
        InkWell(
          onTap: () {
            print("click");
            // mController.setSwitchContainer();
            if (!mController.isvalide(mController.mobileNumber.text)) {
              mController.setLoading(cameFrom: "sendOtp");
            }
          },
          // onHover: (event) {
          //   appContainer?.style.cursor = 'pointer';
          // },
          child: Container(
            width: queryData.size.width * 0.2,
            height: queryData.size.height * 0.06,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              gradient: linearGradient,
            ),
            child: mController.isLoading
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: whiteColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'PLease wait...',
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.headline4,
                          fontSize: 14,
                          color: whiteColor,
                        ),
                      ),
                    ],
                  )
                : Text(
                    'Send OTP',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 14,
                      color: whiteColor,
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}

class EnterOTPContainer extends StatelessWidget {
  const EnterOTPContainer({
    Key? key,
    required this.mController,
    required this.queryData,
  }) : super(key: key);

  final LoginController mController;
  final MediaQueryData queryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textFieldOTP(
                first: true,
                last: false,
                context: context,
                otp: mController.opt1Controller),
            textFieldOTP(
                first: false,
                last: false,
                context: context,
                otp: mController.opt2Controller),
            textFieldOTP(
                first: false,
                last: false,
                context: context,
                otp: mController.opt3Controller),
            textFieldOTP(
                first: false,
                last: true,
                context: context,
                otp: mController.opt4Controller),
          ],
        ),
        Visibility(
          visible: mController.errorMsg != ""? true : false,
          child: Text(
            mController.errorMsg,
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.headline4,
              fontSize: 14,
              color: Colors.red,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            var otp = mController.opt1Controller.text +
                mController.opt2Controller.text +
                mController.opt3Controller.text +
                mController.opt4Controller.text;
            print("click $otp");
            if (!mController.verifyOtp(otp)) {
              mController.setLoading(cameFrom: "verifyOtp");
            }
          },
          // onHover: (event) {
          //   appContainer?.style.cursor = 'pointer';
          // },
          child: Container(
            width: queryData.size.width * 0.2,
            height: queryData.size.height * 0.06,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              gradient: linearGradient,
            ),
            child: mController.isLoading
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: whiteColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'PLease wait...',
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.headline4,
                          fontSize: 14,
                          color: whiteColor,
                        ),
                      ),
                    ],
                  )
                : Text(
              'Verify OTP',
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 14,
                color: whiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget textFieldOTP({first, last, context, otp}) {
    return Container(
      height: 85,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          controller: otp,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: primaryColor),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
