import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin"),
        backgroundColor: const Color(0xFF1569AD),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            // Add content for admin here...
          ],
        ),
      ),
     // bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }
}