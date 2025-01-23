import 'package:flutter/material.dart';

Widget listTileFunc(String title, String subtitle, Icon leadingIcon) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white, // Background color for the ListTile
      border: Border.all(
          color:
              const Color.fromARGB(255, 253, 106, 0)), // Border color and width
      borderRadius: BorderRadius.circular(8.0), // Rounded corners
      boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(255, 251, 3, 3), // Shadow color
          blurRadius: 5, // Shadow blur radius
          spreadRadius: 1, // Shadow spread radius
          offset: const Offset(0, 2), // Shadow position
        ),
      ],
    ),
    child: ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: leadingIcon,
    ),
  );
}
