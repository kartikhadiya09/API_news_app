import 'package:apicalling/datamodel.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Myapp(),
  ));
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: Apicall(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              print("==========${snapshot.error}");
            } else if (snapshot.hasData) {
              List<dynamic> l1=snapshot.data;
              return Card();
            }
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<List<dynamic>> Apicall() async {
    Uri uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var res = await http.get(uri);
    var Jsn = convert.jsonDecode(res.body);

    return Jsn.map((e) => Modalcalss.fromJson(e)).toList;
  }
}
