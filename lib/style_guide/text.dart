import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget bigTextView({msg, color}) {
  return Text(
    msg,
    style: GoogleFonts.lato(
      fontSize: 25,
      fontStyle: FontStyle.normal,
      color: color == null ? Colors.black : color,
    ),
  );
}

Widget bigBlodTextView({msg, color}) {
  return Text(
    msg,
    style: GoogleFonts.lato(
      fontSize: 25,
      fontWeight: FontWeight.w800,
      fontStyle: FontStyle.normal,
      color: color == null ? Colors.black : color,
    ),
  );
}

Widget smallTextView({msg, color, textAlign, textSize}) {
  return Text(
    msg,
    textAlign: textAlign == null ? TextAlign.center : textAlign,
    style: GoogleFonts.lato(
      fontSize: textSize == null ? 18 : textSize,
      fontStyle: FontStyle.normal,
      color: color == null ? Colors.black : color,
    ),
  );
}

Widget imageFromAssetes({path, width, height}) {
  return Image.asset(
    path,
    height: height,
    width: width,
  );
}

Widget imageFromURL({url, width, height}) {
  return Image.network(
    url,
  );
}
