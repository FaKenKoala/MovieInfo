import 'package:flutter/material.dart';

class MovieErroWidget extends StatelessWidget {
  const MovieErroWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'Error',
      style: TextStyle(color: Colors.red),
    ));
  }
}
