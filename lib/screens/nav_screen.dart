import 'package:corona_counter_app_responsive/constants.dart';
import 'package:flutter/material.dart';
import 'package:corona_counter_app_responsive/screens/screens.dart';
import 'package:corona_counter_app_responsive/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class nav_screen extends StatefulWidget {
  @override
  _nav_screenState createState() => _nav_screenState();
}

class _nav_screenState extends State<nav_screen> {
  final List<Widget> _screens = [
    home_screen(),
    home_screen(),
    symptom_screen(),
  ];
  final List<IconData> _icons = const [
    MdiIcons.homeVariant,
    MdiIcons.magnify,
    MdiIcons.alertOctagram,
  ];
  final List<String> _titles = const [
    "Home",
    "Search",
    "Symptoms",
  ];
  int _selectedIndex = 0;
  bool _menuActive = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _titles.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _menuActive
            ? PreferredSize(
                preferredSize: Size(double.infinity, 350.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        cPrimary,
                        Colors.blue[800],
                      ],
                    ),
                  ),
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      SizedBox(height: 20.0),
                      Text(
                        "Corona Counter",
                        style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 7.0),
                      Row(
                        children: [
                          Expanded(
                            child: Text(" "),
                          ),
                          IconButton(
                            icon: Icon(
                              MdiIcons.dotsVertical,
                              color: Colors.white,
                            ),
                            iconSize: 25.0,
                            onPressed: () =>
                                setState(() => _menuActive = false),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      MenuCard(
                        icon: _icons[0],
                        title: _titles[0],
                        onTap: () => setState(() {
                          _menuActive = false;
                          _selectedIndex = 0;
                        }),
                      ),
                      SizedBox(height: 20.0),
                      MenuCard(
                        icon: _icons[1],
                        title: _titles[1],
                        onTap: () => setState(() {
                          _menuActive = false;
                          _selectedIndex = 0;
                        }),
                      ),
                      SizedBox(height: 20.0),
                      MenuCard(
                        icon: _icons[2],
                        title: _titles[2],
                        onTap: () => setState(() {
                          _menuActive = false;
                          _selectedIndex = 2;
                        }),
                      ),
                    ],
                  ),
                ),
              )
            : PreferredSize(
                preferredSize: Size(double.infinity, 135.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        cPrimary,
                        Colors.blue[800],
                      ],
                    ),
                  ),
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      SizedBox(height: 20.0),
                      Text(
                        "Corona Counter",
                        style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 7.0),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              _icons[0],
                              color: Colors.white,
                            ),
                            iconSize: 25.0,
                            onPressed: () => setState(() => _selectedIndex = 0),
                          ),
                          IconButton(
                            icon: Icon(
                              _icons[1],
                              color: Colors.white,
                            ),
                            iconSize: 25.0,
                            onPressed: () => setState(() => _selectedIndex = 1),
                          ),
                          Expanded(
                            child: Text(" "),
                          ),
                          IconButton(
                            icon: Icon(
                              MdiIcons.dotsHorizontal,
                              color: Colors.white,
                            ),
                            iconSize: 25.0,
                            onPressed: () => setState(() => _menuActive = true),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
      ),
    );
  }
}
