import 'package:champian_web/style_guide/colors.dart';
import 'package:champian_web/style_guide/const_data.dart';
import 'package:champian_web/views/login/login_comp/login_body.dart';
import 'package:champian_web/views/login/login_comp/login_section_one.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Row(
        children: [
          Container(
            height: queryData.size.height,
            width: queryData.size.width / 2,
            decoration: BoxDecoration(
              gradient: linearGradient,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: LoginSectionOne(queryData: queryData, cameFrom: StorageKey.BIG,),
            ),
          ),
          Container(
            height: queryData.size.height,
            width: queryData.size.width / 2,
            color: whiteColor,
            padding: EdgeInsets.all(28),
            child: LoginBody(
              queryData: queryData,
            ),
          ),
        ],
      ),
    );
  }
}


