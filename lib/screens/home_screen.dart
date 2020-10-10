import 'package:corona_counter_app_responsive/constants.dart';
import 'package:flutter/material.dart';
import 'package:corona_counter_app_responsive/widgets/widgets.dart';
import 'package:corona_counter_app_responsive/services/location.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class home_screen extends StatefulWidget {
  @override
  _home_screenState createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  Map data = {};
  int active = 0;
  @override
  Widget build(BuildContext context) {
    if (data == {}) {
      data['location'] = 'worldwide';
      Location instance = Location(data['location']);
      instance.getStatsRound();
      data['cases'] = instance.cases;
      data['deaths'] = instance.deaths;
      data['recovers'] = instance.recovers;
      data['casesPlus'] = instance.casesPlus;
      data['deathsPlus'] = instance.deathsPlus;
      data['recoversPlus'] = instance.recoversPlus;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    active == 0
                        ? Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              Container(
                                padding: EdgeInsets.all(6.0),
                                width: 270.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(6.0),
                                width: 230.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              Container(
                                width: 270.0,
                                height: 40.0,
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        MdiIcons.mapSearchOutline,
                                        color: Colors.black,
                                      ),
                                      iconSize: 30.0,
                                      onPressed: () {
                                        setState(() {
                                          active = 1;
                                        });
                                      },
                                    ),
                                    Expanded(
                                      child: DropdownButton(
                                        isExpanded: true,
                                        underline: SizedBox(),
                                        icon: Icon(
                                          Icons.keyboard_arrow_down,
                                          color: cText,
                                        ),
                                        iconSize: 30,
                                        value: data['location'],
                                        items: [
                                          'worldwide',
                                          'Europe',
                                          'Germany',
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                value,
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                  color: cText,
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (value) async {
                                          Location instance2 = Location(value);
                                          await instance2.getStatsRound();
                                          setState(() {
                                            data['location'] = value;
                                            data['cases'] = instance2.cases;
                                            data['deaths'] = instance2.deaths;
                                            data['recovers'] =
                                                instance2.recovers;
                                            data['casesPlus'] =
                                                instance2.casesPlus;
                                            data['deathsPlus'] =
                                                instance2.deathsPlus;
                                            data['recoversPlus'] =
                                                instance2.recoversPlus;
                                          });
                                        },
                                        dropdownColor: cBackground,
                                        focusColor: cPrimary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              Container(
                                padding: EdgeInsets.all(6.0),
                                width: 270.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(6.0),
                                width: 230.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              Container(
                                width: 270.0,
                                height: 40.0,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        width: 20.0,
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: cText,
                                      ),
                                      iconSize: 30.0,
                                      onPressed: () {
                                        setState(() {
                                          active = 0;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                    SizedBox(height: 70),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Counter(
                            number: data['cases'],
                            color: cInfected,
                            title: "infected"),
                        Counter(
                          number: data['deaths'],
                          color: cDead,
                          title: "deaths",
                        ),
                        Counter(
                            number: data['recovers'],
                            color: cRecovered,
                            title: "recovered"),
                      ],
                    ),
                    SizedBox(height: 70),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CounterPlus(
                          number: data['casesPlus'],
                          color: cInfected,
                        ),
                        CounterPlus(
                          number: data['deathsPlus'],
                          color: cDead,
                        ),
                        CounterPlus(
                          number: data['recoversPlus'],
                          color: cRecovered,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
