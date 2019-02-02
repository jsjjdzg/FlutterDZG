import 'package:flutter/material.dart';
import 'catagory.dart';

/**
 * route出 一个CatagoryList
 */
class CatagoryRoute extends StatelessWidget {
  const CatagoryRoute();

  static const _catagoryNames = <String>[
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
  ];

  static const _colors = <Color>[
    Colors.orange,
    Colors.purpleAccent,
    Colors.grey,
    Colors.greenAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.pink,
    Colors.redAccent,
  ];

  static List<Catagory> _cataGories =
      new List.generate(_catagoryNames.length, (index) {
    return new Catagory(
        name: _catagoryNames[index],
        colora: _colors[index],
        colorb: _colors[index],
        icon: Icon(Icons.cake));
  });

  @override
  Widget build(BuildContext context) {
    return _buildCatagoryRoute(false);

    final listView = Container();

    final appBar = AppBar();

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }

  Widget _buildCatagoryRoute(bool portrait) {
    if (portrait) {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) => _cataGories[index],
        itemCount: _cataGories.length,
      );
    } else {
      return GridView.count(
          crossAxisCount: 2, childAspectRatio: 3.0, children: _cataGories);
    }
  }
}
