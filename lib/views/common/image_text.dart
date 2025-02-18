import 'package:champian_web/views/common/slide_transaction.dart';
import 'package:flutter/material.dart';
import 'package:champian_web/style_guide/image.dart';
import 'package:champian_web/style_guide/text.dart';

class ImageTextComponent extends StatelessWidget {
  const ImageTextComponent({
    Key? key,
    required this.queryData,
    required this.image,
    required this.text,
  }) : super(key: key);

  final MediaQueryData queryData;
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SlideRightTransition(
          child: imageFromAssetes(
            path: image == "" ? loginImg : "",
            height: 200,
            width: 200,
          ),
        ),
        SizedBox(
          width: queryData.size.width * 0.2,
        ),
        Expanded(
          child: smallTextView(
            msg:
                text == "" ? "IndiaZakat.com is India's First Zakat Crowdfunding platform floated by the Association of Muslim Professionals (AMP) with a view to bring the Zakat Seekers and Zakat Givers on a unified platform. Its objective is to undertake its operations purely with the intent of bringing socio-economic transformation in the lives of the people, without seeking to generate any commercial surplus" : text,
            textAlign: TextAlign.end,
          ),
        ),
        
      ],
    );
  }
}
