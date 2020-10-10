import 'dart:convert';
import 'package:http/http.dart';

class Location {
  String location;
  String cases = "0";
  String deaths = "0";
  String recovers = "0";
  String casesPlus = "0";
  String deathsPlus = "0";
  String recoversPlus = "0";

  Location(String location) {
    this.location = location;
  }

  Future<void> getStatsRound() async {
    try {
      Map data = {};
      if (location == "worldwide") {
        Response response =
            await get("https://corona.lmao.ninja/v3/covid-19/all");
        data = jsonDecode(response.body);
      } else if (location == "Europe") {
        Response response = await get(
            "https://corona.lmao.ninja/v3/covid-19/continents/Europe");
        data = jsonDecode(response.body);
      } else if (location == "Germany") {
        Response response = await get(
            "https://corona.lmao.ninja/v3/covid-19/countries/Germany");
        data = jsonDecode(response.body);
      } else {}

      casesPlus = roundCount(data['todayCases']);
      deathsPlus = roundCount(data['todayDeaths']);
      recoversPlus = roundCount(data['todayRecovered']);
      cases = roundCount(data['cases']);
      deaths = roundCount(data['deaths']);
      recovers = roundCount(data['recovered']);
    } catch (e) {
      print("caught error: $e");
    }
  }

  String roundCount(int number) {
    int length = number.toString().length;
    if (length >= 5 && length < 7) {
      double num = number.toDouble() / 1000;
      return num.toStringAsFixed(1) + " k";
    } else if (length >= 7 && length < 10) {
      double num = number.toDouble() / 1000000;
      return num.toStringAsFixed(1) + " m";
    } else if (length >= 10) {
      double num = number.toDouble() / 1000000000;
      return num.toStringAsFixed(1) + " b";
    } else {
      return number.toString();
    }
  }
}
