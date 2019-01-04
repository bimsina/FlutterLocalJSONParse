import 'dart:convert';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Heroes'),
        ),
        body: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('json_data/people.json'),
            builder: (context, snapshot) {
              //decode JSON
              var mydata = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemCount: mydata == null ? 0 : mydata.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.all(8.0),
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('Name : ' + mydata[index]['name'],style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('Universe : ' + mydata[index]['universe'],style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('Alias : ' + mydata[index]['alias'],style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('Occupation : ' + mydata[index]['occupation'],style: TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ));
  }
}
