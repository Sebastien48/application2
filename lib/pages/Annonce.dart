import 'package:flutter/material.dart';

class AnnoncesPage extends StatelessWidget {
  const AnnoncesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Annonces')),
      body: Center(child: const Text('Liste des annonces')),
    );
  }
}
