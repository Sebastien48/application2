import 'package:flutter/material.dart';

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
            // Add content for settings here...
          ],
        ),
      ),
      bottomNavigationBar: _builBottomNavigationBar(context),
    );
  }
}

Widget _builBottomNavigationBar(BuildContext context) {
  return BottomNavigationBar(
    backgroundColor: const Color.fromARGB(255, 234, 229, 224),
    selectedItemColor: const Color.fromARGB(246, 68, 137, 255),
    unselectedItemColor: Colors.black,
    currentIndex: 3, // Indice de la page actuelle
    onTap: (index) {
      switch (index) {
        case 0:
          Navigator.pushNamed(context, '/home');
          break;
        case 1:
          Navigator.pushNamed(context, '/annonce');
          break;
        case 2:
          Navigator.pushNamed(context, '/reservation');
          break;
        case 3:
          Navigator.pushNamed(context, '/parametre');
          break;
      }
    },
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
      BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Annonces'),
      BottomNavigationBarItem(
        icon: Icon(Icons.event_available),
        label: 'Réservation',
      ),
      BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Paramètres'),
    ],
  );
}

/*
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
          children: [
            ListTile(
              title: const Text("Nom"),
              subtitle: const Text("John Doe"),
              onTap: () {
                // Permet de modifier le nom
              },
            ),
            ListTile(
              title: const Text("Email"),
              subtitle: const Text("johndoe@example.com"),
              onTap: () {
                // Permet de modifier l'email
              },
            ),
            const Divider(),
            ListTile(
              title: const Text("Se déconnecter"),
              onTap: () {
                // Ajouter la logique de déconnexion
              },
            ),
          ],
        ),
      ),
    );
  }
}*/
