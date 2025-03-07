import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ParametresPage extends StatefulWidget {
  const ParametresPage({super.key});

  @override
  _ParametresPageState createState() => _ParametresPageState();
}

class _ParametresPageState extends State<ParametresPage> {
  bool isDarkMode = false;

  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
        194,
        73,
        99,
        193,
      ), // Fond violet clair
      appBar: AppBar(
        title: const Text("Paramètres"),
        backgroundColor: const Color(0xFF1569AD),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSettingItem(
              icon: Icons.person,
              title: "Profil",
              onTap: () {
                // Navigate to profile page
              },
            ),
            _buildSwitchSettingItem(
              title: isDarkMode ? "Mode sombre" : "Mode clair",
              value: isDarkMode,
              onChanged: (bool value) {
                setState(() {
                  isDarkMode = value;
                  if (isDarkMode) {
                    SystemChrome.setSystemUIOverlayStyle(
                      const SystemUiOverlayStyle(
                        statusBarColor: Color.fromARGB(255, 8, 8, 8),
                        statusBarIconBrightness: Brightness.dark,
                      ),
                    );
                  } else {
                    SystemChrome.setSystemUIOverlayStyle(
                      const SystemUiOverlayStyle(
                        statusBarColor: Colors.white,
                        statusBarIconBrightness: Brightness.light,
                      ),
                    );
                  }
                });
              },
              icon: isDarkMode ? Icons.dark_mode : Icons.light_mode,
            ),
            _buildSettingItem(
              icon: Icons.history,
              title: "Historique des événements",
              onTap: () {
                // Navigate to event history page
              },
            ),
            _buildSettingItem(
              icon: Icons.campaign,
              title: "Promotion d'événement",
              onTap: () {
                // Navigate to event promotion page
              },
            ),
            _buildSettingItem(
              icon: Icons.person_add,
              title: "Ajouter un autre compte",
              onTap: () {
                Navigator.pushNamed(context, '/signup');
              },
            ),
            _buildSettingItem(
              icon: Icons.logout,
              title: "Déconnexion",
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            _buildSettingItem(
              icon: Icons.delete,
              title: "Supprimer le compte",
              onTap: () {
                // Navigate to delete account page
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 6,
            spreadRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF1569AD)),
        title: Text(title),
        onTap: onTap,
      ),
    );
  }

  Widget _buildSwitchSettingItem({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
    required IconData icon,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 6,
            spreadRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: SwitchListTile(
        title: Row(
          children: [
            Icon(icon, color: const Color(0xFF1569AD)),
            const SizedBox(width: 10),
            Text(title),
          ],
        ),
        value: value,
        onChanged: onChanged,
        activeColor: const Color(0xFF1569AD),
      ),
    );
  }
}

Widget _buildBottomNavigationBar(BuildContext context) {
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
