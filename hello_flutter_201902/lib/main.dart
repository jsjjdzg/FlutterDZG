import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello Flutter201902"),
          actions: <Widget>[new IconButton(icon: new Icon(Icons.list))],
        ),
        body: HelloFlutterList(),
      ),
    ));

const _rowHeight = 200.0;
const _rowWidth = 400.0;
const _borderRadius = BorderRadius.all(Radius.circular(8.0));

class HelloFlutterList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _rowHeight,
        width: _rowWidth,
        child: InkWell(
          borderRadius: _borderRadius,
          highlightColor: Colors.orange,
          splashColor: Colors.purpleAccent,
          onTap: () {
            print("点击了一下");
          },
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsetsDirectional.only(end: 16.0),
                  child: Icon(Icons.cake),
                ),
                Center(
                  child: Text("法式长棍面包",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.display1.copyWith(
                            color: Colors.grey[700],
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700,
                          )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HelloFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
//      child: Container(
//        padding: EdgeInsets.all(16.0),
//        color: Colors.greenAccent,
//        height: 400.0,
//        width: 300.0,
//        child: Padding(
//          padding: EdgeInsets.all(16.0),
//          child: Text(
//              "HelloDZG!",
//              style: TextStyle(fontSize: 20.0),
//              textAlign: TextAlign.center,
//          ),
//        ),
//      ),
      child: container,
    );
  }

  var container = Container(
    color: Colors.blueAccent,
    height: 400.0,
    width: 300.0,
    padding: EdgeInsets.all(16.0),
    child: Center(
      child: Column(
        children: <Widget>[
          Text(
            "Hello",
            style: TextStyle(color: Colors.red, fontSize: 25.0),
          ),
          Text(
            "Hello",
            style: TextStyle(color: Colors.pink, fontSize: 25.0),
          ),
          Text(
            "Hello",
            style: TextStyle(color: Colors.yellow, fontSize: 25.0),
          ),
          Text(
            "Hello",
            style: TextStyle(color: Colors.orange, fontSize: 25.0),
          ),
          Text(
            "Hello",
            style: TextStyle(color: Colors.purpleAccent, fontSize: 25.0),
          ),
        ],
      ),
    ),
  );
}
