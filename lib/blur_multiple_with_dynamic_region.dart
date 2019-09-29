/*
 * Copyright (c) 2019 - Bui Minh Triet - x3cafe@gmail.com
 * Website: http://fluttervn.com
 * Facebook: https://www.facebook.com/fluttervndev
 * Github: https://github.com/fluttervn
 * Medium: https://medium.com/fluttervn
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class BlurMultipleDynamicRegionPage extends StatefulWidget {
  BlurMultipleDynamicRegionPage({Key key}) : super(key: key);

  @override
  _BlurMultipleDynamicRegionPageState createState() =>
      _BlurMultipleDynamicRegionPageState();
}

class _BlurMultipleDynamicRegionPageState
    extends State<BlurMultipleDynamicRegionPage> {
  final double _width = 350;
  final double _height = 300;
  int _imageIndex = 0;
  double _sigmaX = 0.0;
  double _sigmaY = 0.0;
  double _opacity = 0.0;
  double _blurWidth;
  double _blurHeight;

  final images = ["background1.jpg", "background2.jpg", "background3.jpg"];

  _BlurMultipleDynamicRegionPageState() {
    _blurWidth = _width;
    _blurHeight = _height;
  }

  @override
  Widget build(BuildContext context) {
    print('rebuild with sigmaX=${_sigmaX.toStringAsFixed(2)}, '
        'sigmaY=${_sigmaY.toStringAsFixed(2)}, '
        'opacity=${_opacity.toStringAsFixed(2)}, '
        'blur W=${_blurWidth.toInt()}, '
        'blur H=${_blurHeight.toInt()}');
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter blur demo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            _buildImageContainer(),
            SizedBox(height: 5),
            RaisedButton(
              child: Text('Next image'),
              onPressed: () {
                setState(() {
                  _imageIndex = (_imageIndex + 1) % images.length;
                });
              },
            ),
            SizedBox(height: 5),
            _buildBlurContainerSizeAction(),
            SizedBox(height: 5),
            ..._buildBlurSigmaAndOpacity(),
          ],
        ),
      ),
    );
  }

  Widget _buildImageContainer() {
    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/images/${images[_imageIndex]}',
          width: _width,
          height: _height,
          fit: BoxFit.cover,
        ),
        FlutterLogo(size: 80, colors: Colors.red),
        Positioned(
          top: 0,
          left: 0,
          width: _blurWidth,
          height: _blurHeight,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
              child: Container(
                color: Colors.black.withOpacity(_opacity),
              ),
            ),
          ),
        )
      ],
    );
  }

  List<Widget> _buildBlurSigmaAndOpacity() {
    return [
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
      SizedBox(height: 5),
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
      SizedBox(height: 5),
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
    ];
  }

  Row _buildBlurContainerSizeAction() {
    return Row(
      children: <Widget>[
        Text('Blur size: Width: '),
        SizedBox(
          width: 30,
          height: 30,
          child: RaisedButton(
            child: Text('-'),
            onPressed: () {
              setState(() {
                _blurWidth = math.max(_blurWidth - 10, 0);
              });
            },
          ),
        ),
        Text(' ${_blurWidth.toInt()} '),
        SizedBox(
          width: 30,
          height: 30,
          child: RaisedButton(
            child: Text('+'),
            onPressed: () {
              setState(() {
                _blurWidth = math.min(_blurWidth + 10, _width);
              });
            },
          ),
        ),
        Text(' Height:'),
        SizedBox(
          width: 30,
          height: 30,
          child: RaisedButton(
            child: Text('-'),
            onPressed: () {
              setState(() {
                _blurHeight = math.max(_blurHeight - 10, 0);
              });
            },
          ),
        ),
        Text(' ${_blurHeight.toInt()} '),
        SizedBox(
          width: 30,
          height: 30,
          child: RaisedButton(
            child: Text('+'),
            onPressed: () {
              setState(() {
                _blurHeight = math.min(_blurHeight + 10, _height);
              });
            },
          ),
        ),
      ],
    );
  }
}
