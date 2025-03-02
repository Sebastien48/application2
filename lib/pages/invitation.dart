import 'package:flutter/material.dart';

class ArtixApp extends StatefulWidget {
  const ArtixApp({super.key});

  @override
  _ArtixAppState createState() => _ArtixAppState();
}

class _ArtixAppState extends State<ArtixApp> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Accueil(),
    const AnnoncesPage(),
    const ReservationPage(),
    const ParametresPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Artix"),
        backgroundColor: const Color(0xFF1569AD),
        actions: [
          // Icône Accueil
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              setState(() {
                _currentIndex = 0;
              });
            },
          ),
          // Icône Annonces
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              setState(() {
                _currentIndex = 1;
              });
            },
          ),
          // Icône Réservation
          IconButton(
            icon: const Icon(Icons.event_available),
            onPressed: () {
              setState(() {
                _currentIndex = 2;
              });
            },
          ),
          // Icône Paramètres
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              setState(() {
                _currentIndex = 3;
              });
            },
          ),
        ],
      ),
      body: _pages[_currentIndex],
    );
  }
}

class Accueil extends StatelessWidget {
  const Accueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Artix - Accueil"),
        backgroundColor: const Color(0xFF1569AD),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            Text("Bienvenue sur Artix !"),
            // Contenu de la page d'accueil ici...
          ],
        ),
      ),
    );
  }
}

class AnnoncesPage extends StatelessWidget {
  const AnnoncesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Annonces"),
        backgroundColor: const Color(0xFF1569AD),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            // Contenu de la page des annonces...
          ],
        ),
      ),
    );
  }
}

class ReservationPage extends StatelessWidget {
  const ReservationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Réservation"),
        backgroundColor: const Color(0xFF1569AD),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            // Contenu de la page des réservations...
          ],
        ),
      ),
    );
  }
}

class ParametresPage extends StatelessWidget {
  const ParametresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Paramètres"),
        backgroundColor: const Color(0xFF1569AD),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            // Contenu de la page des paramètres...
          ],
        ),
      ),
    );
  }
}
