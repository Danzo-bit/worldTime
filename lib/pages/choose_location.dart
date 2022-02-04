import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
   const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  void getData() {
    //simulate network request for username
    String username = Future.delayed(Duration(seconds: 3),() {})
  }

  @override
  void initState() {
    super.initState();
    print('init state func ran');
  }

  @override
  Widget build(BuildContext context) {
    print('build state func ran');

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        elevation: 0,
      ),
      body: RaisedButton(
        onPressed: (){
          setState(() {
            counter += 1;
          });
        },
        child: Text('counter is $counter'),
      ),
    );
  }
}
