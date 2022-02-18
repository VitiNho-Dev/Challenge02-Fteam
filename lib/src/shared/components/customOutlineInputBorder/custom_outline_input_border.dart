import 'package:flutter/material.dart';

class CustomOutlineInputBorder extends OutlineInputBorder {
  const CustomOutlineInputBorder({
    required this.color,
  });

  final Color color;

  @override
  BorderRadius get borderRadius => BorderRadius.circular(10);
  @override
  BorderSide get borderSide => BorderSide(color: color);
}
