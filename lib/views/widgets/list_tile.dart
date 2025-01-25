import 'package:flutter/material.dart';

Widget listTileFunc(String title, String subtitle, Icon leadingIcon) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white, // Background color for the ListTile
      borderRadius: BorderRadius.circular(10.0), // Rounded corners
      border: Border.all(
        color: const Color.fromARGB(255, 253, 106, 0), // Border color
        width: 2, // Border width
      ),
      boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(
              255, 200, 200, 200), // Adjusted shadow color for a softer look
          blurRadius: 5, // Shadow blur radius
          spreadRadius: 1, // Shadow spread radius
          offset: const Offset(0, 2), // Shadow position
        ),
      ],
    ),
    child: ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: const Color.fromARGB(
              255, 56, 71, 93), // Example: A nice blue color
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: const Color.fromARGB(255, 0, 0, 0), // Optional: A lighter gray
        ),
      ),
      leading: leadingIcon,
      contentPadding: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 10.0, // Optionally add padding for better spacing
      ),
    ),
  );
}
