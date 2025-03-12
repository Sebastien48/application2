import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  _AccueilState createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

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
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Accueil"),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/aaa.jpg',
            width: 40,
            height: 40,
            fit: BoxFit.contain,
          ),
        ),
        backgroundColor: const Color(0xFF1569AD),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            _buildWelcomeText(),
            const SizedBox(height: 20),
            _buildSalleReservationSection(context),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 234, 229, 224),
        selectedItemColor: const Color.fromARGB(246, 68, 137, 255),
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Annonces'),
          BottomNavigationBarItem(icon: Icon(Icons.event_available), label: 'Réservation'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Paramètres'),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      children: [
        Container(
          height: 220,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/atrix.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Centre Culturel Artix",
                style: GoogleFonts.playfairDisplay(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWelcomeText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Text(
            "Bienvenue sur Artix !",
            style: GoogleFonts.montserrat(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1569AD),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            "L'application qui vous facilite la réservation de vos salles d'évènement",
            style: GoogleFonts.montserrat(
              fontSize: 16,
              color: Colors.black87,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSalleReservationSection(BuildContext context) {
    List<Map<String, String>> salles = [
      {
        "nom": "Hôtel Ivoire",
        "image":
            "https://m.ahstatic.com/is/image/accorhotels/aja_p_4410-81:8by10?fmt=jpg&op_usm=1.75,0.3,2,0&resMode=sharp2&iccEmbed=true&icc=sRGB&dpr=on,1.5&wid=335&hei=418&qlt=80",
        "description":
            "Salle luxueuse avec une vue magnifique sur la lagune Ébrié."
      },
      {
        "nom": "Mangalis Hotel group",
        "image":
            "https://www.mangalis.com/wp-content/uploads/sites/166/2024/11/5G8A4251-HDR-800x533.jpg",
        "description":
            "Lieu parfait pour les événements professionnels et networking."
      },
      {
        "nom": "Palais de la Culture",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjR_Sg5Y5r9gjtSfu3Fh0agrP5IzCe9mNn7g&s",
        "description":
            "Un espace emblématique pour les grands événements artistiques et culturels."
      },
      {
        "nom": "Noom Hotel",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl7wzLxXjRRY2juK2QkIow8qDaa6gygqFCKQ&s",
        "description":
            "Une salle haut de gamme pour vos réunions et conférences privées."
      }
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Nos différentes salles",
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1569AD),
            ),
          ),
          const SizedBox(height: 10),
          Column(
            children: salles.map((salle) {
              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      child: Image.network(
                        salle["image"]!,
                        width: 120,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              salle["nom"]!,
                              style: GoogleFonts.montserrat(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              salle["description"]!,
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

}