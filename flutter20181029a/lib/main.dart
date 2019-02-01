import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return MaterialApp(
      title: '第一次使用Flutter',
      theme: new ThemeData(
        primaryColor: Colors.pink,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('欢迎使用Flutter'),
        ),
        body: new Center(
          //child: new Text('Hello World'),
          //child: new Text(wordPair.asPascalCase),
          child: RandomWords(),
        ),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State createState() {
    return new RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords> {
  final _wps = <WordPair>[];
  final _fontSize = const TextStyle(fontSize: 18.0);
  final _loves = new Set<WordPair>();

  Widget _buildWps() {
    return new ListView.builder(itemBuilder: (context, i) {
      if (i.isOdd) return new Divider();
      final index = i ~/ 2;
      if (index >= _wps.length) {
        _wps.addAll(generateWordPairs().take(5));
        //_wps.add(new WordPair('DZG', 'GDH'));
      }
      return _buildRow(_wps[index]);
    });
  }

  Widget _buildRow(WordPair pair) {
    final alreadyLoved = _loves.contains(pair);

    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _fontSize,
      ),
      trailing: new Icon(
        alreadyLoved ? Icons.favorite : Icons.favorite_border,
        color: alreadyLoved ? Colors.red : Colors.black12,
      ),
      onTap: () {
        setState(() {
          if (alreadyLoved) {
            _loves.remove(pair);
          } else {
            _loves.add(pair);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //final wordPair = new WordPair.random();
    //return new Text(wordPair.asPascalCase);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('开始生成随机名称'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildWps(),
    );
  }

  void _pushSaved(){
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _loves.map(
                (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _fontSize,
                ),
              );
            },
          );
          final divided = ListTile
              .divideTiles(
            context: context,
            tiles: tiles,
          )
              .toList();

          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }
}
