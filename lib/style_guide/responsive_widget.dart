import 'package:flutter/material.dart';


const int lagreScreenSize = 1366;
const int mediumScreenSize = 768;
const int smallScreenSize = 360;
const int customScreenSize = 1100;


class ResponsiveWidget extends StatelessWidget {
  final Widget lg, sm, ms;
  const ResponsiveWidget({required this.lg, required this.sm, required this.ms});

  static bool isSmallScree(BuildContext context) => MediaQuery.of(context).size.width > smallScreenSize;
  static bool isMediumScree(BuildContext context) => MediaQuery.of(context).size.width >= mediumScreenSize && MediaQuery.of(context).size.width < lagreScreenSize;
  static bool isLargeScree(BuildContext context) => MediaQuery.of(context).size.width >= lagreScreenSize;
  static bool isCustomScree(BuildContext context) => MediaQuery.of(context).size.width < smallScreenSize && MediaQuery.of(context).size.width <= customScreenSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      double _width = constraints.maxWidth;
      if(_width >= lagreScreenSize){
        return lg;
      } else if(_width < lagreScreenSize && _width >= mediumScreenSize){
        return ms;
      }else{
        return sm;
      }
    });
  }
}