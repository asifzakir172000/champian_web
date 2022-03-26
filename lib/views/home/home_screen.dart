import 'dart:js';

import 'package:champian_web/style_guide/colors.dart';
import 'package:champian_web/style_guide/image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        color: whiteColor,
        child: Center(
          child: Stack(
            children: [
              ListView(
                children: [
                  CarouselSlider.builder(
                    itemCount: caruselImage.length,
                    itemBuilder: (BuildContext context, int index, int img) {
                      return Container(
                        width: queryData.size.width,
                        decoration: BoxDecoration(
                          color: blackColor,
                          image: DecorationImage(
                            image: NetworkImage(
                              caruselImage[index],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: queryData.size.height * 0.70,
                      autoPlay: true,
                      aspectRatio: 2.0,
                      initialPage: 0,
                      enlargeCenterPage: false,
                      viewportFraction: 1,
                      autoPlayAnimationDuration: Duration(seconds: 4),
                    ),
                  ),
                ],
              ),
              CustomAppBar(
                queryData: queryData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.queryData,
  }) : super(key: key);

  final MediaQueryData queryData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: queryData.size.width,
      margin: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            height: 50,
            child: InkWell(
              onTap: () {},
              child: FlutterLogo(),
            ),
          ),
          Container(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClickableText(
                    press: () {},
                    txt: "Home",
                  ),
                  SizedBox(width: 10,),
                  ClickableText(
                    press: () {},
                    txt: "About Us",
                  ),
                  SizedBox(width: 10,),
                  ClickableText(
                    press: () {},
                    txt: "Contact Us",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ClickableText extends StatelessWidget {
  const ClickableText({Key? key, required this.press, required this.txt})
      : super(key: key);
  final VoidCallback press;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          InkWell(
            onTap: press,
            child: Text(
              txt,
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                color: primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
