import 'package:champian_web/views/common/short_divider.dart';
import 'package:flutter/material.dart';
import 'package:champian_web/style_guide/text.dart';

class HomeInstruction extends StatelessWidget {
  const HomeInstruction({
    Key? key,
    required this.queryData,
  }) : super(key: key);

  final MediaQueryData queryData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 60.0,
          right: queryData.size.width * 0.1,
          left: queryData.size.width * 0.1),
      child: Column(
        children: [
          bigTextView(msg: "Improtant Instruction"),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: ShortDividerComponent(
              color: Colors.black,
            ),
          ),
          smallTextView(
            msg:
                "1. IndiaZakat.com is India's First Zakat Crowdfunding platform floated by the Association of Muslim Professionals (AMP) with a view to bring the Zakat Seekers and Zakat Givers on a unified platform. Its objective is to undertake its operations purely with the intent of bringing socio-economic transformation in the lives of the people, without seeking to generate any commercial surplus",
            textAlign: TextAlign.justify,
          ),
          smallTextView(
            msg:
                "\n2. IndiaZakat.com is India's First Zakat Crowdfunding platform floated by the Association of Muslim Professionals (AMP) with a view to bring the Zakat Seekers and Zakat Givers on a unified platform. Its objective is to undertake its operations purely with the intent of bringing socio-economic transformation in the lives of the people, without seeking to generate any commercial surplus",
            textAlign: TextAlign.justify,
          ),
          smallTextView(
            msg:
                "\n3. IndiaZakat.com is India's First Zakat Crowdfunding platform floated by the Association of Muslim Professionals (AMP) with a view to bring the Zakat Seekers and Zakat Givers on a unified platform. Its objective is to undertake its operations purely with the intent of bringing socio-economic transformation in the lives of the people, without seeking to generate any commercial surplus",
            textAlign: TextAlign.justify,
          ),
          smallTextView(
            msg:
                "\n4. IndiaZakat.com is India's First Zakat Crowdfunding platform floated by the Association of Muslim Professionals (AMP) with a view to bring the Zakat Seekers and Zakat Givers on a unified platform. Its objective is to undertake its operations purely with the intent of bringing socio-economic transformation in the lives of the people, without seeking to generate any commercial surplus",
            textAlign: TextAlign.justify,
          ),
          smallTextView(
            msg:
                "\n5. IndiaZakat.com is India's First Zakat Crowdfunding platform floated by the Association of Muslim Professionals (AMP) with a view to bring the Zakat Seekers and Zakat Givers on a unified platform. Its objective is to undertake its operations purely with the intent of bringing socio-economic transformation in the lives of the people, without seeking to generate any commercial surplus",
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
