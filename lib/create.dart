import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;


class Create extends StatefulWidget {

  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  TextEditingController _user = TextEditingController();
  TextEditingController _job = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                controller: _user,
                decoration: InputDecoration(
                  hintText: "User"
                ),
              ),
              TextField(
                controller: _job,
                decoration: InputDecoration(
                  hintText: "Job"
                ),
              ),
              ElevatedButton(onPressed: (){
                postData(_user.text, _job.text);
              }, child: Text("submit"))
            ],
          ),
        ),
      ),
    );
  }

  Future postData(user,job)async{
    String api = "https://reqres.in/api/users";
    http.Response responseData = await http.post(Uri.parse(api),body: {
      "name" : user,
      "job" : job,
    });
    print(responseData.body);
    if(responseData.statusCode == 201){
      return Fluttertoast.showToast(msg: "success");
    }

    else{
      Fluttertoast.showToast(msg: "Failed");
    }
  }
}
