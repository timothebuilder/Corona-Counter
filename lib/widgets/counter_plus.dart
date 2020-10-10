import 'package:flutter/material.dart';

class CounterPlus extends StatelessWidget {
  final String number;
  final Color color;

  const CounterPlus({
    Key key,
    @required this.number,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.0),
      height: 100.0,
      width: 90.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            number,
            style: TextStyle(
              fontSize: 20.0,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "+",
            style: TextStyle(
              fontSize: 12.0,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
