import 'package:flutter/material.dart';

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: Colors.white,
  backgroundColor: Colors.black,
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
);

final ButtonStyle homeIconButtonStyle = ElevatedButton.styleFrom(
  side: const BorderSide(width: 1.0, color: Colors.black),
  shape: const CircleBorder(),
  padding: const EdgeInsets.all(24),
);
