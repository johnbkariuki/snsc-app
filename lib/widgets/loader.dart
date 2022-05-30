import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[300],
        width: 70,
        height: 70,
        child: const Center(
          child: CircularProgressIndicator(),
        ));
  }
}
