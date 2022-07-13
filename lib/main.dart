import 'package:apicalling/datamodel.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'package:intl/intl.dart';



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
  var dt = DateTime.now();
  String realtz = DateFormat("EEEEE , dd , yyyy").format(DateTime.now());
  String day = DateFormat("dd").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(" ${realtz}",
            style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),),

        body: Container(
          child: FutureBuilder(
            future: Apicall(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                print("==========${snapshot.error}");
              } else if (snapshot.hasData) {
                Modalclass l1 = snapshot.data;
                return ListView.builder(
                    itemCount: l1.articles!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.blue.shade100,
                        child: Container(
                          height: 250,
                          child: Expanded(
                            child: Builder(builder: (context) {
                              return Column(
                                children: [
                                  Card(
                                    color: Colors.blue.shade300,
                                    child: Container(
                                      height: 60,
                                      width: double.infinity,
                                      child: Text(
                                        "${l1.articles![index].title}",
                                        style: TextStyle(
                                            fontSize: 20, wordSpacing: 1),
                                      ),
                                    ),
                                  ),
                                  Card(
                                    child: SizedBox(
                                      height: 174,
                                      width: double.infinity,
                                      child: Image.network(
                                        "${l1.articles![index].urlToImage}",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                          ),
                        ),
                      );
                    });
              }
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<Modalclass> Apicall() async {
    Uri uri = Uri.parse(
        "https://newsapi.org/v2/everything?q=tesla&from=2022-06-${day}&sortBy=publishedAt&apiKey=596fef052b374da7b1ebe9f9b13e7829");
    var res = await http.get(uri);
    var Jsn = convert.jsonDecode(res.body);

    return Modalclass.fromJson(Jsn);
  }
}
