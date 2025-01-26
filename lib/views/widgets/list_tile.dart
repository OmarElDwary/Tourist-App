import 'package:flutter/material.dart';

Widget listTileFunc(String title, String subtitle, Icon leadingIcon) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(
        color: const Color.fromARGB(255, 253, 106, 0),
        width: 2,
      ),
      boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(255, 200, 200, 200),
          blurRadius: 5,
          spreadRadius: 1,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: const Color.fromARGB(255, 56, 71, 93),
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
      ),
      leading: leadingIcon,
      contentPadding: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 10.0,
      ),
    ),
  );
}
