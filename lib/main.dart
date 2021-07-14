import 'package:flutter/material.dart';
import 'package:placefinder/view_model/place_list_view_model.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (context) => PlaceListViewModel(),
        child: HomePage(),
      ),
    );
  }
}
