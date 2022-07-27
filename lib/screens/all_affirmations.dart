import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/affirmation_card.dart';
import '../widgets/app_bar.dart';
import '../widgets/drawer.dart';
import '../widgets/gradient_background.dart';

class AllAffirmationsPage extends StatefulWidget {
  const AllAffirmationsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AllAffirmationsPage> createState() => _AllAffirmationsPageState();
}

class _AllAffirmationsPageState extends State<AllAffirmationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        child: Column(children: [
                          Text("All Affirmations",
                              style: Theme.of(context).textTheme.headline4),
                          Expanded(
                              child: ListView.builder(
                                  itemCount: snapshot.data?.docs.length,
                                  itemBuilder: (context, index) {
                                    var affirmation =
                                        snapshot.data?.docs[index];
                                    return affirmationCard(affirmation['text'],
                                        affirmation['category']);
                                  }))
                        ]),
                      );
                    }
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                })));
  }
}
