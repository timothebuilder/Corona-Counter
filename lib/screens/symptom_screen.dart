import 'package:corona_counter_app_responsive/constants.dart';
import 'package:corona_counter_app_responsive/services/symptom.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class symptom_screen extends StatefulWidget {
  @override
  _symptom_screenState createState() => _symptom_screenState();
}

class _symptom_screenState extends State<symptom_screen> {
  List<Symptom> symptomList = [
    Symptom("cough", MdiIcons.alertOctagram, cSecondary),
    Symptom("fever", MdiIcons.alertOctagram, cSecondary),
    Symptom("fatigue", MdiIcons.alertOctagram, cSecondary),
    Symptom("body aches", MdiIcons.alertOctagram, cPrimary),
    Symptom("sore throat", MdiIcons.alertOctagram, cPrimary),
    Symptom("diarrhea", MdiIcons.alertOctagram, cPrimary),
    Symptom("headache", MdiIcons.alertOctagram, cPrimary),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: symptomList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 2.0,
              horizontal: 8.0,
            ),
            child: Card(
              child: ListTile(
                onTap: () {},
                title: Center(
                    child: Text(
                  symptomList[index].name,
                  style: TextStyle(
                    fontSize: 30.0,
                    color: symptomList[index].color,
                  ),
                )),
                leading: Icon(symptomList[index].icon,
                    color: symptomList[index].color),
              ),
            ),
          );
        },
      ),
    );
  }
}
