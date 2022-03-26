import 'package:champian_web/style_guide/colors.dart';
import 'package:champian_web/style_guide/const_data.dart';
import 'package:champian_web/style_guide/image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginSectionOne extends StatelessWidget {
  const LoginSectionOne({
    Key? key,
    required this.queryData,
    required this.cameFrom,
  }) : super(key: key);

  final MediaQueryData queryData;
  final String cameFrom;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(loginImg),
          height: queryData.size.height / 1.5,
          width: queryData.size.width / 2,
        ),
        Text(
          "Noting is more expensive than a \nmissed opportunity.",
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 28,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            color: cameFrom == StorageKey.BIG ? whiteColor : blackColor,
          ),
        ),
      ],
    );
  }
}