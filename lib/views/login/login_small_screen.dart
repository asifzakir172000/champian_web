import 'package:champian_web/style_guide/colors.dart';
import 'package:champian_web/style_guide/const_data.dart';
import 'package:champian_web/views/login/login_comp/login_body.dart';
import 'package:champian_web/views/login/login_comp/login_section_one.dart';
import 'package:flutter/material.dart';

class LoginSmallScreen extends StatelessWidget {
  const LoginSmallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginSectionOne(
              queryData: queryData,
              cameFrom: StorageKey.SMALL,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28, right: 28, bottom: 28, top: 10),
              child: LoginBody(
                queryData: queryData,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
