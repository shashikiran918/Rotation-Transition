import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _RotationTransitionExample(),
    );
  }
}

class _RotationTransitionExample extends StatefulWidget {
  _RotationTransitionExampleState createState() => _RotationTransitionExampleState();
}

class _RotationTransitionExampleState extends State<_RotationTransitionExample> with TickerProviderStateMixin {

 late AnimationController _controller;
 late Animation<double> _animation;

  initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000),
        vsync: this,
        value: 0.25,
        lowerBound: 0.25,
        upperBound: 0.5
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);

    _controller.forward();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ROTATION TRANSITION'),
        centerTitle: true,
      ),
      body: Center(
        child: RotationTransition(
            turns: _animation,
            alignment: Alignment(0.1, 0.1),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text('SHASHI', style: TextStyle(color: Colors.teal, fontSize: 36))
                ]
            )
        ),
      ),
    );
  }
}