import 'package:flutter/material.dart';

class ShortDividerComponent extends StatelessWidget {
  const ShortDividerComponent({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(90)),
        color: color,
      ),
    );
  }
}
