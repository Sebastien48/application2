import 'package:flutter/material.dart';

class information extends StatelessWidget {
  const information({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Information"),
        backgroundColor: const Color(0xFF1569AD),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: const [Text("Information")]),
      ),
      //  bottomNavigationBar: _builBottomNavigationBar(context),
    );
  }
}
/*
Widget _builBottomNavigationBar(BuildContext context) {
 // return BottomNavigationBar(

  );
}*/