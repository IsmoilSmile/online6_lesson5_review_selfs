import 'package:flutter/material.dart';

import '../model/post_model.dart';
import '../service/network_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  String data = "";

  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _loadPostList() {
    Network.GET(Network.API_LIST).then((response) =>
    {data = response!,_showResponse(data),
print(data)
    });
  }
  void _showResponse(String response){
    setState(() {
      print(data);
      data=response;
    });
  }
  void _post(){
    Network.PUT(Network.API_CREATE, {
      "id":"2",
      "userId": "10",
      "title": "Hellok world",
      "body": "This is note's body"
    }).then((value) => _showResponse(value!),);
  }

  @override
  Widget build(BuildContext context) {
    _post();
    return Scaffold(
      appBar: AppBar(
        title: Text("notes"),
      ),
      body: Container(
        height: 100,
        width: 400,
        color: Colors.red,
        child: Text(data,style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
