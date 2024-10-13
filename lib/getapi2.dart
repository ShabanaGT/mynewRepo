import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class getuser extends StatefulWidget {
  const getuser({super.key});

  @override
  State<getuser> createState() => _getuserState();
}

class _getuserState extends State<getuser> {
  var users=[];
  bool isLoading=false;
  Future<void> getUsername() async {
    setState(() {
      isLoading = true;
    });
    final apiResponse = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if(apiResponse.statusCode==200){
      setState(() {
        isLoading=false;
        users=json.decode(apiResponse.body);
      });
    }
    else{
      isLoading=false;
      throw Exception("No data");
    }
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title:Text("Curio campus_type"),
      ),
      body:Column(
        children: [
          ElevatedButton(onPressed: (){
            getUsername();
          }, child: Text("login")),
          SizedBox(height: 20,),
          Expanded(child:
          ListView.builder(
            itemCount: users.length,
            itemBuilder: (  context,  index){
              var user=users[index];
              return ListTile(
                title: Text(user["id"].toString()),
                subtitle:Text (
                    "Name:${user["name"]}\n"
                    "Email:${user["email"]}\n"
                    "Address:${user["address"]["street"]}\n"
                ),
              );
            }

          ))
        ],
      )
    );
  }
}
