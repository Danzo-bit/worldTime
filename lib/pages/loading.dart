import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';


class Loading extends StatefulWidget {
  // const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



  void getTime() async {
    var url = Uri.parse("http://worldtimeapi.org/api/timezone/Africa/Lagos");
    var response = await get(url);

    print(response.body);
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Loading screen'),
    );
  }
}
