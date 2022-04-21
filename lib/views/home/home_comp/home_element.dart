import 'package:champian_web/views/common/image_text.dart';
import 'package:champian_web/views/common/text_image.dart';
import 'package:flutter/material.dart';
import 'package:champian_web/style_guide/text.dart';

class HomeElement extends StatelessWidget {
  const HomeElement({
    Key? key,
    required this.queryData,
  }) : super(key: key);

  final MediaQueryData queryData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 10.0,
          right: queryData.size.width * 0.1,
          left: queryData.size.width * 0.1),
      child: Column(
        children: [
          bigTextView(msg: ""),
          TextImageComponent(queryData: queryData, image: "", text: ""),
          ImageTextComponent(queryData: queryData, image: "", text: ""),
        ],
      ),
    );
  }
}
