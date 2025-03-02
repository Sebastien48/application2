import 'package:flutter/material.dart';

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
            // Add content for reservations here...
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }
}

Widget _buildBottomNavigationBar(BuildContext context) {
  return BottomNavigationBar(
    backgroundColor: const Color.fromARGB(255, 234, 229, 224),
    selectedItemColor: const Color.fromARGB(246, 68, 137, 255),
    unselectedItemColor: Colors.black,
    currentIndex: 2, // Indice de la page actuelle
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
