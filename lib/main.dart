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
