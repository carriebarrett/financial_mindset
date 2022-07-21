import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financial_mindset/widgets/gradient_background.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/app_bar.dart';
import '../widgets/drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> _randomizeAffirmations() {
    int id1 = Random().nextInt(55) + 1;
    int id2 = id1;
    int id3 = id1;
    while (id2 == id1) {
      id2 = Random().nextInt(55) + 1;
    }
    while (id3 == id1 || id3 == id2) {
      id3 = Random().nextInt(55) + 1;
    }
    List<Map<String, dynamic>> affirmationList = [];
    var affirmation1 = FirebaseFirestore.instance
        .collection('affirmations')
        .doc(id1.toString());
    affirmation1.get().then((DocumentSnapshot doc) {
      affirmationList.add(doc.data() as Map<String, dynamic>);
    });

    var affirmation2 = FirebaseFirestore.instance
        .collection('affirmations')
        .doc(id2.toString());
    var affirmation3 = FirebaseFirestore.instance
        .collection('affirmations')
        .doc(id3.toString());
    return affirmationList;
  }

  @override
  Widget build(BuildContext context) {
    var newAffirmations = _randomizeAffirmations();
    return Scaffold(
      appBar: appBar(),
      drawer: drawer(context),
      body: Container(
        width: MediaQuery.of(context).size.width,
        // Add box decoration
        decoration: gradientBackground(),
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Today's Affirmations", 
                style: Theme.of(context).textTheme.headline4,),
              Semantics(
                button: true,
                label: 'Affirmation tile',
                hint:
                    'Click here to add this affirmation to your favorites',
                
                child: Card(
                    child: Container(
                        decoration: const BoxDecoration(color: middleBlueGreen),
                        child: ListTile(
                          title: Text('affirmation text here'),
                          subtitle: Text('category here'),
                          // title: Text(newAffirmations[0]['text']),
                          // subtitle: Text(newAffirmations[0]['category']),
                          trailing: const Icon(Icons.star),
                          onTap: () {},
                        ))),
              ),
              Semantics(
                button: true,
                label: 'Affirmation tile',
                hint:
                    'Click here to add this affirmation to your favorites',
                
                child: Card(
                    child: Container(
                        decoration: const BoxDecoration(color: middleBlueGreen),
                        child: ListTile(
                          title: Text('affirmation text here'),
                          subtitle: Text('category here'),
                          // title: Text(newAffirmations[0]['text']),
                          // subtitle: Text(newAffirmations[0]['category']),
                          trailing: const Icon(Icons.star),
                          onTap: () {},
                        ))),
              ),
              Semantics(
                button: true,
                label: 'Affirmation tile',
                hint:
                    'Click here to add this affirmation to your favorites',
                
                child: Card(
                    child: Container(
                        decoration: const BoxDecoration(color: middleBlueGreen),
                        child: ListTile(
                          title: Text('affirmation text here'),
                          subtitle: Text('category here'),
                          // title: Text(newAffirmations[0]['text']),
                          // subtitle: Text(newAffirmations[0]['category']),
                          trailing: const Icon(Icons.star),
                          onTap: () {},
                        ))),
              )
              // Container(
              //   width: MediaQuery.of(context).size.width * 0.9,
              //   height: MediaQuery.of(context).size.height * 0.1,
              //   // Add box decoration
              //   decoration: const BoxDecoration(
              //     color: middleBlueGreen,
              //   ),
              //   child: Text('Affirmation goes here'),
              // ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.02,
              // ),
              // Container(
              //   width: MediaQuery.of(context).size.width * 0.9,
              //   height: MediaQuery.of(context).size.height * 0.1,
              //   // Add box decoration
              //   decoration: const BoxDecoration(
              //     color: middleBlueGreen,
              //   ),
              //   child: Text('Affirmation goes here'),
              // ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.02,
              // ),
              // Container(
              //   width: MediaQuery.of(context).size.width * 0.9,
              //   height: MediaQuery.of(context).size.height * 0.1,
              //   // Add box decoration
              //   decoration: const BoxDecoration(
              //     color: middleBlueGreen,
              //   ),
              //   child: Text('Affirmation goes here'),
              // ),
              // const Text(
              //   'You have pushed the button this many times:',
              // ),
              // Text(
              //   '$_counter',
              //   style: Theme.of(context).textTheme.headline4,
              // ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _randomizeAffirmations,
        tooltip: 'Increment',
        child: const Icon(
          Icons.add,
          color: darkSlateBlue,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
