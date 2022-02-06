import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:worldtime/services/world_time.dart';


class Loading extends StatefulWidget {
  // const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'Lagos',flag: 'Nigeria.png', rrl:'Africa/Lagos');

    await instance.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
    });

  }


  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[500],
     body: Center(
       child:  SpinKitCircle(
         color: Colors.white,
         size: 50.0,
       ),
     ),
    );
  }
}
