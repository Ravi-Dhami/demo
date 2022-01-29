import 'dart:convert';

import 'package:apicrud/create.dart';
import 'package:apicrud/model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
fetchData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Crud"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Create()));
          }, icon: Icon(Icons.add)),
        ],
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder: (BuildContext context,AsyncSnapshot snapshot){
          if(snapshot.hasData){
            User data = snapshot.data;
            return ListView.builder(
                itemBuilder: (context,i){
                  return ListTile(
                    title: Text(data.total.toString()),
                    subtitle: Text(data.page.toString()),
                  );
                }
            );
          }
          else{
          return  CircularProgressIndicator();
          }
        }
      ),
    );
  }

  Future fetchData()async{
    String api = "https://reqres.in/api/users?page=2";
    http.Response responseData = await http.get(Uri.parse(api));
    if(responseData.statusCode == 200){
      User user = userFromJson(responseData.body);

      return user;
    }
    else{
      throw Exception("Failed");
    }
  }

}
