import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _imageIndex = 0;
  double _sigmaX = 0.0;
  double _sigmaY = 0.0;
  double _opacity = 0.0;
  final images = ["background1.jpg", "background2.jpg", "background3.jpg"];

  @override
  Widget build(BuildContext context) {
    print('rebuild with sigmaX=$_sigmaX, sigmaY=$_sigmaY, opacity=$_opacity');
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter blur demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(
                  'assets/images/${images[_imageIndex]}',
                  width: 300,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
                  child: Container(
                    width: 300,
                    height: 250,
                    color: Colors.black.withOpacity(_opacity),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            RaisedButton(
              child: Text('Next image'),
              onPressed: () {
                setState(() {
                  _imageIndex = (_imageIndex + 1) % images.length;
                });
              },
            ),
            SizedBox(height: 20),
            Text('Change blur sigmaX: ${_sigmaX.toStringAsFixed(2)}'),
            Slider(
              min: 0,
              max: 10,
              value: _sigmaX,
              label: '$_sigmaX',
              onChanged: (value) {
                setState(() {
                  _sigmaX = value;
                });
              },
            ),
            SizedBox(height: 10),
            Text('Change blur sigmaY: ${_sigmaY.toStringAsFixed(2)}'),
            Slider(
              min: 0,
              max: 10,
              value: _sigmaY,
              onChanged: (value) {
                setState(() {
                  _sigmaY = value;
                });
              },
            ),
            SizedBox(height: 10),
            Text('Change blur opacity: ${_opacity.toStringAsFixed(2)}'),
            Slider(
              min: 0,
              max: 1,
              value: _opacity,
              onChanged: (value) {
                setState(() {
                  _opacity = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
