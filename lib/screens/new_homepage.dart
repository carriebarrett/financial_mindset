import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/affirmation_card.dart';
import '../widgets/app_bar.dart';
import '../widgets/drawer.dart';
import '../widgets/gradient_background.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List affirmationIdList = _randomizeAffirmations();

  List _randomizeAffirmations() {
    List affirmationIdList = [
      Random().nextInt(56),
      Random().nextInt(56),
      Random().nextInt(56)
    ];
    for (var i = 1; i < 3; i++) {
      for (var j = i - 1; j >= 0; j--) {
        if (affirmationIdList[i] == affirmationIdList[j]) {
          affirmationIdList[i] = Random().nextInt(56);
        }
      }
    }
    return affirmationIdList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: _randomizeAffirmations,
          tooltip: 'Increment',
          child: const Icon(
            Icons.add,
            color: darkSlateBlue,
          ),
        ),
        appBar: appBar(),
        drawer: drawer(context),
        body: Container(
            width: MediaQuery.of(context).size.width,
            // Add box decoration
            decoration: gradientBackground(),
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('affirmations')
                    .orderBy('category', descending: true)
                    .snapshots(),
                builder: (content, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.docs.length == 0) {
                      return Expanded(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                            Center(child: CircularProgressIndicator())
                          ]));
                    } else {
                      return Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.05),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Today's Affirmations",
                                  style: Theme.of(context).textTheme.headline4),
                              Center(
                                  child: ListView(
                                shrinkWrap: true,
                                children: [
                                  affirmationCard(
                                      snapshot.data?.docs[affirmationIdList[0]]
                                          ['text'],
                                      snapshot.data?.docs[affirmationIdList[0]]
                                          ['category']),
                                  affirmationCard(
                                      snapshot.data?.docs[affirmationIdList[1]]
                                          ['text'],
                                      snapshot.data?.docs[affirmationIdList[1]]
                                          ['category']),
                                  affirmationCard(
                                      snapshot.data?.docs[affirmationIdList[2]]
                                          ['text'],
                                      snapshot.data?.docs[affirmationIdList[2]]
                                          ['category']),
                                ],
                              ))
                            ]),
                      );
                    }
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                })));
  }
}
