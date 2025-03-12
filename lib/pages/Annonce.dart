import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnnoncesPage extends StatefulWidget {
  const AnnoncesPage({super.key});

  @override
  _AnnoncesPageState createState() => _AnnoncesPageState();
}

class _AnnoncesPageState extends State<AnnoncesPage> {
  // Liste des salles disponibles (excluant Noom Hotel)
  List<Map<String, String>> sallesDisponibles = [
    {
      "nom": "Hôtel Ivoire",
      "image":
          "https://m.ahstatic.com/is/image/accorhotels/aja_p_4410-81:8by10?fmt=jpg&op_usm=1.75,0.3,2,0&resMode=sharp2&iccEmbed=true&icc=sRGB&dpr=on,1.5&wid=335&hei=418&qlt=80",
      "description":
          "Salle luxueuse avec une vue magnifique sur la lagune Ébrié.",
      "categorie": "Conférence, Salon, Fête",
      "capacite": "300 personnes"
    },
    {
      "nom": "Palais de la Culture",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjR_Sg5Y5r9gjtSfu3Fh0agrP5IzCe9mNn7g&s",
      "description":
          "Un espace emblématique pour les grands événements artistiques et culturels.",
      "categorie": "Festival, Concert",
      "capacite": "500 personnes"
    },
    {
      "nom": "Mangalis Hotel group",
      "image":
          "https://www.mangalis.com/wp-content/uploads/sites/166/2024/11/5G8A4251-HDR-800x533.jpg",
      "description":
          "Lieu parfait pour les événements professionnels et networking.",
      "categorie": "Réunion, Rencontre",
      "capacite": "250 personnes"
    }
   
  ];

  // Salle réservée
  Map<String, String> salleReservee = {
    "nom": "Noom Hotel",
    "image":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl7wzLxXjRRY2juK2QkIow8qDaa6gygqFCKQ&s",
    "description":
        "Une salle haut de gamme pour vos réunions et conférences privées.",
    "categorie": "Réunion, Mariage",
    "capacite": "150 personnes"
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Annonces"),
        backgroundColor: const Color(0xFF1569AD),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSallesDisponiblesSection(),
            const SizedBox(height: 20),
            _buildSallesReserveesSection(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: (int index) {
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
            default:
              break;
          }
        },
        backgroundColor: const Color.fromARGB(255, 234, 229, 224),
        selectedItemColor: const Color.fromARGB(246, 68, 137, 255),
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Annonces'),
          BottomNavigationBarItem(icon: Icon(Icons.event_available), label: 'Réservation'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Paramètres'),
        ],
      ),
    );
  }

  Widget _buildSallesDisponiblesSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Les salles disponibles",
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1569AD),
            ),
          ),
          const SizedBox(height: 10),
          Column(
            children: sallesDisponibles.map((salle) {
              return _buildSalleCard(salle);
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSallesReserveesSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Les salles réservées",
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color:  const Color(0xFF1569AD),
            ),
          ),
          const SizedBox(height: 10),
          _buildSalleCard(salleReservee, isReserved: true),
        ],
      ),
    );
  }

  Widget _buildSalleCard(Map<String, String> salle, {bool isReserved = false}) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        onTap: isReserved
            ? null
            : () {
                Navigator.pushNamed(context, '/reservation', arguments: salle["nom"]);
              },
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
                        color: isReserved ? Colors.redAccent : Colors.black,
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
                    const SizedBox(height: 5),
                    Text(
                      "Catégorie: ${salle["categorie"]!}",
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Capacité: ${salle["capacite"]!}",
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
      ),
    );
  }
}
