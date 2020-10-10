import 'package:corona_counter_app_responsive/constants.dart';
import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;

  const MenuCard({
    Key key,
    @required this.icon,
    @required this.title,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: cBackground,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 30.0,
              color: cSecondary,
            ),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 30.0,
                  color: cSecondary,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
