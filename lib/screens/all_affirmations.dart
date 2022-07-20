import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

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
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        centerTitle: true,
        title: Text(
          widget.title, 
          style: const TextStyle(color: darkSlateBlue))
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
      // Add box decoration
        decoration: const BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.2, 0.8],
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              englishViolet,
              darkSlateBlue
            ],
          ),
        ),
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
                return Column(children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (context, index) {
                            var affirmation = snapshot.data?.docs[index];
                            return Semantics(
                                button: true,
                                label: 'Affirmation tile',
                                hint:
                                    'Click here to add this affirmation to your favorites',
                                child: Card(
                                    child: Container(
                                        decoration: const BoxDecoration(
                                            color: middleBlueGreen),
                                        child: ListTile(
                                          subtitle: Text(affirmation['category']),
                                          title: Text(affirmation['text']),
                                          trailing: const Icon(Icons.star),
                                          onTap: () {},
                                        ))));
                          }))
                ]);
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          })));
  }
}
