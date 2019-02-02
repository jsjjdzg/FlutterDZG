import 'package:flutter/material.dart';

const _rowHeight = 200.0;
const _borderRadius = BorderRadius.all(Radius.circular(8.0));

class Catagory extends StatelessWidget {
  final String name;
  final ColorSwatch colora;
  final ColorSwatch colorb;
  final Icon icon;

  // 生成对象
  const Catagory(
      {Key key,
      @required this.name,
      @required this.colora,
      @required this.colorb,
      @required this.icon})
      : assert(name != null),
        assert(colora != null),
        assert(colorb != null),
        assert(icon != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _rowHeight,
        child: InkWell(
          borderRadius: _borderRadius,
          highlightColor: colora,
          splashColor: colorb,
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(padding: EdgeInsets.all(16.0), child: icon),
                Center(
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.display1.copyWith(
                          color: Colors.grey[700],
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
