import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime{

  String? location; //location name for UI
  String? time; //time for location
  String? flag; //url to an asset for flag
  String? rrl; //location url for api
  bool? isDaytime;

  WorldTime({this.location, this.flag, this.rrl});


  Future<void> getTime() async {

    try{
      var url = Uri.parse('http://worldtimeapi.org/api/timezone/$rrl');
      var response = await get(url);

      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      // print(datetime);
      // print(offset);

      //  create date time object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    }catch (e) {
      print('caught error $e');
      time = 'could not get time data';
    }

  }
}