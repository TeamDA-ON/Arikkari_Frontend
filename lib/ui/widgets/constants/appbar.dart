import 'package:flutter/material.dart';

AppBar appBar() {
  return AppBar(
    backgroundColor: const Color(0xFFFFFFFF),
    toolbarHeight: 83,
    iconTheme: const IconThemeData(
      color: Colors.black, //change your color here
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 11),
        child: Image.asset(
          'assets/img/logo.png',
          width: 50,
          height: 43,
        ),
      )
    ],
  );
}
