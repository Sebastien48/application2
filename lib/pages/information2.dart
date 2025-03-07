import 'package:flutter/material.dart';
class InformationPage extends StatelessWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Information 2"),
        backgroundColor: const Color(0xFF1569AD),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            Text("Information 2"),
          ],
        ),
      ),
      //bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }
}