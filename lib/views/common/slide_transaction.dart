import 'dart:async';

import 'package:flutter/material.dart';

class SlideLeftRoute extends StatefulWidget {
  SlideLeftRoute({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<SlideLeftRoute> createState() => _SlideLeftRouteState();
}

class _SlideLeftRouteState extends State<SlideLeftRoute>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 150));
    Timer(Duration(milliseconds: 500), () => _animationController.forward());

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset(-1, 0),
        end: Offset.zero,
      ).animate(_animationController),
      child: widget.child,
    );
  }
}

class SlideRightTransition extends StatefulWidget {
  SlideRightTransition({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<SlideRightTransition> createState() => _SlideRightTransitionState();
}

class _SlideRightTransitionState extends State<SlideRightTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 150));
    Timer(Duration(milliseconds: 500), () => _animationController.forward());

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset(1, 0),
        end: Offset.zero,
      ).animate(_animationController),
      child: widget.child,
    );
  }
}
