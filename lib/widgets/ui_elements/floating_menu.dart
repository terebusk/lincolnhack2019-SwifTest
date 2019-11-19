import 'package:flutter/material.dart';
import 'dart:math' as math;

class FloatingMenu extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _FloatingMenuState();
  }
}

class _FloatingMenuState extends State<FloatingMenu> with TickerProviderStateMixin {
  static const List<IconData> icons = const [ Icons.add_a_photo ];

  AnimationController _controller;

  @override
  void initState() {
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Theme.of(context).cardColor;
    Color foregroundColor = Theme.of(context).accentColor;
    return new Column(
      mainAxisSize: MainAxisSize.min,
      children: new List.generate(icons.length, (int index) {
        Widget child = new Container(
          height: 70.0,
          width: 56.0,
          alignment: FractionalOffset.topCenter,
          child: new ScaleTransition(
            scale: new CurvedAnimation(
              parent: _controller,
              curve: new Interval(
                  0.0,
                  1.0 - index / icons.length / 2.0,
                  curve: Curves.easeOut
              ),
            ),
            child: new FloatingActionButton(
              heroTag: null,
              backgroundColor: backgroundColor,
              mini: true,
              child: new Icon(icons[index], color: foregroundColor),
              onPressed: () async {
                Navigator.pushNamed(context, '/camera');
              },
            ),
          ),
        );
        return child;
      }).toList()..add(
        new FloatingActionButton (
          heroTag: null,
          child: new AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget child) {
              return new Transform(
                transform: new Matrix4.rotationZ(_controller.value * 0.5 * math.pi),
                alignment: FractionalOffset.center,
                child: new Icon(_controller.isDismissed ? Icons.add : Icons.close),
              );
            },
          ),
          onPressed: () {
            if (_controller.isDismissed) {
              _controller.forward();
            } else {
              _controller.reverse();
            }
          },
        ),
      ),
    );
  }

}