import 'package:champian_web/views/common/short_divider.dart';
import 'package:flutter/material.dart';
import 'package:champian_web/style_guide/image.dart';
import 'package:champian_web/style_guide/text.dart';

class HomeL1 extends StatelessWidget {
  const HomeL1({
    Key? key,
    required this.queryData,
  }) : super(key: key);

  final MediaQueryData queryData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 30.0,
          right: queryData.size.width * 0.1,
          left: queryData.size.width * 0.1),
      child: Column(
        children: [
          bigTextView(msg: "Registration for Exam (Student Registration)"),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: ShortDividerComponent(color: Colors.black,),
          ),
          smallTextView(
            msg:
                "IndiaZakat.com is India's First Zakat Crowdfunding platform floated by the Association of Muslim Professionals (AMP) with a view to bring the Zakat Seekers and Zakat Givers on a unified platform. Its objective is to undertake its operations purely with the intent of bringing socio-economic transformation in the lives of the people, without seeking to generate any commercial surplus",
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 30.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      smallTextView(
                        msg:
                            "IndiaZakat.com is India's First Zakat Crowdfunding platform floated by the Association of Muslim Professionals (AMP) with a view to bring the Zakat Seekers and Zakat Givers on a unified platform. Its objective is to undertake its operations purely with the intent of bringing socio-economic transformation in the lives of the people, without seeking to generate any commercial surplus",
                        textAlign: TextAlign.start,
                      ),
                      Container(
                        height: 50,
                        width: 150,
                        margin: EdgeInsets.only(
                          top: 30.0,
                        ),
                        child: ElevatedButton(
                          onPressed: () => {},
                          child: Text('Register'),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: queryData.size.width * 0.2,
                ),
                imageFromAssetes(
                  path: loginImg,
                  height: 200,
                  width: 200,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
