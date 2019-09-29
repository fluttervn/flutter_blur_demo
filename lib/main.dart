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

import 'package:flutter/material.dart';

import 'blur_multiple_widgets.dart';
import 'blur_multiple_with_dynamic_region.dart';
import 'blur_single_image.dart';

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

/// List of <screen name, widget name>
final Map<String, Widget> mapScreens = {
  'Blur single image or decoration': BlurSingleImagePage(),
  'Blur multiple widgets': BlurMultipleWidgetsPage(),
  'Blur multiple widgets with dynamic region': BlurMultipleDynamicRegionPage(),
};

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter blur demo'),
      ),
      body: ListView.builder(
        itemCount: mapScreens.length,
        itemBuilder: (BuildContext context, int index) {
          final title = mapScreens.keys.elementAt(index);
          return ListTile(
            title: Text(title, style: TextStyle(fontSize: 16)),
            trailing: Icon(Icons.navigate_next),
            onTap: () {
              _gotoScreen(context, mapScreens[title]);
            },
          );
        },
        padding: EdgeInsets.all(10),
      ),
    );
  }

  /// Go to destination screen (widget)
  _gotoScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute<Widget>(builder: (context) => screen),
    );
  }
}
