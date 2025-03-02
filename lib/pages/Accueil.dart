import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart' as carousel_slider;
import 'package:carousel_slider/carousel_options.dart'; // Ajoutez cette ligne

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
          children: [
            const Text("Bienvenue sur Artix !"),
            const SizedBox(height: 20),
            _buildCarousel(),
            // Add more content here...
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildCarousel() {
    final List<String> imgList = [
      'https://example.com/images/salle1.jpg',
      'https://example.com/images/salle2.jpg',
      'https://example.com/images/salle3.jpg',
    ];

    // Contrôleur pour gérer les changements manuels
    final carousel_slider.CarouselController _controller =
        carousel_slider.CarouselController();

    return Column(
      children: [
        carousel_slider.CarouselSlider(
         // carouselController: _controller, // Ajout du contrôleur
          options: carousel_slider.CarouselOptions(
            height: 200.0,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.9, // Ajuste la taille des images visibles
            aspectRatio: 2.0,
            initialPage: 0,
          ),
          items:
              imgList
                  .map(
                    (item) => Container(
                      child: Center(
                        child: Image.network(
                          item,
                          fit: BoxFit.cover,
                          width: 1000,
                        ),
                      ),
                    ),
                  )
                  .toList(),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_left, size: 40),
              onPressed: () {
                _controller.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
            const SizedBox(width: 20),
            IconButton(
              icon: const Icon(Icons.arrow_right, size: 40),
              onPressed: () {
                _controller.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color.fromARGB(255, 234, 229, 224),
      selectedItemColor: const Color.fromARGB(246, 68, 137, 255),
      unselectedItemColor: Colors.black,
      currentIndex: 0, // Indice de la page actuelle
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
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Paramètres',
        ),
      ],
    );
  }
}
