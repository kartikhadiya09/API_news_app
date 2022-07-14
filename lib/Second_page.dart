import 'package:flutter/material.dart';

class Second_page extends StatefulWidget {
  const Second_page({Key? key}) : super(key: key);

  @override
  State<Second_page> createState() => _Second_pageState();
}

class _Second_pageState extends State<Second_page> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("${args[0]}",style: TextStyle(fontSize: 15),),
        ),
        body: Column(
          children: [
            Card(
              child: SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  "${args[1]}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "description:- ${args[0]}",
                  style: TextStyle(
                      fontSize: 20, wordSpacing: 1),
                ),
              ),
            ),
            Container(

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "content:- ${args[3]}",
                  style: TextStyle(
                      fontSize: 18, wordSpacing: 1),
                ),
              ),
            ),
            Container(

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "source namne:- ${args[4]}",
                  style: TextStyle(
                      fontSize: 18, wordSpacing: 1),
                ),
              ),
            ),
            Container(

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "URL:- ${args[5]}",
                  style: TextStyle(
                      fontSize: 18, wordSpacing: 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
