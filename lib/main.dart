import 'package:champian_web/views/student_register/student_register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ChAMPian',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme: GoogleFonts.muliTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.black),
      ),
      // home: ResponsiveWidget(lg: LoginScreen(), ms: LoginScreen(), sm: LoginSmallScreen(),),
      // home: HomeScreen(),
      home: StudentRegistration(),
    );
  }
}
