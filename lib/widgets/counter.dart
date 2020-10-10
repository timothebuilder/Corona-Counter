import 'package:corona_counter_app_responsive/constants.dart';
import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final String number;
  final Color color;
  final String title;

  const Counter({
    Key key,
    @required this.number,
    @required this.color,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.0),
      height: 100.0,
      width: 80.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: color,
            width: 2.0,
          ),
          boxShadow: [
            BoxShadow(
              color: color,
              offset: Offset(
                20.0,
                20.0,
              ),
            ),
          ]),
      child: Column(
        children: [
          Text(
            number,
            style: TextStyle(
              fontSize: 30.0,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 11.0,
              color: cText,
            ),
          )
        ],
      ),
    );
  }
}
