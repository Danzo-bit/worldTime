import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
   // const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {


  List<WorldTime> locations = [
    WorldTime(rrl: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(rrl: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(rrl: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(rrl: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(rrl: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(rrl: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(rrl: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(rrl: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(rrl: 'Africa/Lagos', location: 'Lagos', flag: 'nigeria.png'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();

    //navigate to home screen
    Navigator.pop(context,{
      'location': instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build state func ran');

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location as String),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }
      ),

    );
  }
}
