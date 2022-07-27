import 'package:flutter/material.dart';

import '../constants.dart';

Widget affirmationCard(text, category) {
  return Semantics(
      button: true,
      label: 'Affirmation tile',
      hint: 'Click here to add this affirmation to your favorites',
      child: Card(
          child: Container(
              decoration: const BoxDecoration(color: middleBlueGreen),
              child: ListTile(
                title: Text(text),
                subtitle: Text(category),
                trailing: const Icon(Icons.star),
                onTap: () {},
              ))));
}
