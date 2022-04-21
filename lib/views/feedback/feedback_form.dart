import 'package:champian_web/style_guide/colors.dart';
import 'package:champian_web/views/common/short_divider.dart';
import 'package:flutter/material.dart';
import 'package:champian_web/style_guide/text.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FeedbackForm extends StatelessWidget {
  const FeedbackForm({
    Key? key,
    required this.queryData,
  }) : super(key: key);

  final MediaQueryData queryData;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: blackColor,
      padding: EdgeInsets.only(
          top: 60.0,
          bottom: 60.0,
          right: queryData.size.width * 0.1,
          left: queryData.size.width * 0.1),
      child: Column(
        children: [
          bigTextView(msg: "FEEDBACK", color: whiteColor),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: ShortDividerComponent(
              color: whiteColor,
            ),
          ),
          smallTextView(
            msg: "We would like your feedback to improve are website.",
            textAlign: TextAlign.justify,
            color: whiteColor,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: smallTextView(
              msg: "What is your openion of this Website?",
              textAlign: TextAlign.justify,
              color: whiteColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RatingBar.builder(
              unratedColor: Colors.grey,
              itemCount: 5,
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return Icon(
                      Icons.sentiment_very_dissatisfied,
                      color: primaryColor,
                    );
                  case 1:
                    return Icon(
                      Icons.sentiment_dissatisfied,
                      color: secondryColor,
                    );
                  case 2:
                    return Icon(
                      Icons.sentiment_neutral,
                      color: Colors.amber,
                    );
                  case 3:
                    return Icon(
                      Icons.sentiment_satisfied,
                      color: Colors.lightGreen,
                    );
                  case 4:
                    return Icon(
                      Icons.sentiment_very_satisfied,
                      color: Colors.green,
                    );
                  default:
                    return Container();
                }
              },
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ),
          Divider(
            color: whiteColor,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: smallTextView(
              msg: "What is your openion of this Website?",
              textAlign: TextAlign.justify,
              color: whiteColor,
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 80,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: smallTextView(msg: "Suggestion"),
                  ),
                  Container(
                    height: 80,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: smallTextView(msg: "Somethig is not quit right"),
                  ),
                  Container(
                    height: 80,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: smallTextView(msg: "Complent"),
                  ),
                ],
              )),
          Divider(
            color: whiteColor,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                //full name
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      child:
                          smallTextView(msg: "Full Name:", color: whiteColor),
                      width: 150,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 20, left: 20),
                        child: TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          right: 20,
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                //Email Id
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        child:
                            smallTextView(msg: "Email ID:", color: whiteColor),
                        width: 150,
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 20, left: 20),
                          child: TextFormField(
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //suggestion
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        child: smallTextView(
                            msg: "Suggestion:", color: whiteColor),
                        width: 150,
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 20, left: 20),
                          child: TextFormField(
                            maxLines: 10,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //button
                Container(
                  height: 50,
                  width: queryData.size.width * 0.2,
                  margin: EdgeInsets.only(
                    top: 30.0,
                  ),
                  child: ElevatedButton(
                    onPressed: () => {},
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
