import 'package:flutter/material.dart';

import '../constants.dart';
import '../screens/all_affirmations.dart';
import '../screens/new_homepage.dart';

Widget drawer(BuildContext context) {
  return Drawer(
      backgroundColor: middleBlueGreen,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(
                color: darkSlateBlue,
              ),
              child: Text('Navigation')),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              // update state
              // close drawer
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomePage(title: appTitle)));
            },
          ),
          ListTile(
            title: const Text('Favorites'),
            onTap: () {
              // update state
              // close drawer
            },
          ),
          ListTile(
            title: const Text('All Affirmations'),
            onTap: () {
              // update state
              // close drawer
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const AllAffirmationsPage(title: appTitle)));
            },
          ),
          ListTile(
            title: const Text('Preferences'),
            onTap: () {
              // update state
              // close drawer
            },
          )
        ],
      ));
}
