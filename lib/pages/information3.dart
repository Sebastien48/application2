// @dart=2.17
import 'package:flutter/material.dart';

class Information3Page extends StatelessWidget {
  const Information3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Information 3"),
        backgroundColor: const Color(0xFF1569AD),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            Text("Information 3"),
          ],
        ),
      ),
      //bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }
}
