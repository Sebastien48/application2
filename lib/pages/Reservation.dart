import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart'; // Importation pour la gestion du format de la date

class ReservationPage extends StatefulWidget {
  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  int _selectedIndex = 2; // L'index de la page de réservation
  DateTime? selectedDate; // Variable pour stocker la date sélectionnée
  TimeOfDay? selectedTime; // Variable pour stocker l'heure sélectionnée

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

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

  // Méthode pour ouvrir le sélecteur de date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  // Méthode pour ouvrir le sélecteur d'heure
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );

    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
      });
  }

  // Fonction pour formater la date sélectionnée
  String _getFormattedDate() {
    if (selectedDate == null) {
      return 'Sélectionner la date';
    }
    final DateFormat formatter = DateFormat('d MMMM yyyy');
    return 'Évènement pour le ${formatter.format(selectedDate!)}';
  }

  // Fonction pour formater l'heure sélectionnée
  String _getFormattedTime() {
    if (selectedTime == null) {
      return 'Sélectionner l\'heure';
    }
    return 'À partir de ${selectedTime!.hour}h${selectedTime!.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final String salle = ModalRoute.of(context)?.settings.arguments as String? ?? "Salle inconnue";

    return Scaffold(
      appBar: AppBar(
        title: Text("Réservation - $salle"),
        backgroundColor: const Color(0xFF1569AD),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Réservez la salle : $salle",
              style: GoogleFonts.montserrat(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1569AD),
              ),
            ),
            const SizedBox(height: 20),
            // Champ pour email
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            // Champ pour le numéro de téléphone
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: "Numéro de téléphone",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 15),
            // Bouton pour sélectionner la date
            TextButton(
              onPressed: () => _selectDate(context),
              child: Text(
                _getFormattedDate(),
                style: TextStyle(
                  color: Colors.black, 
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 234, 229, 224), 
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
            ),
            const SizedBox(height: 15),
            // Bouton pour sélectionner l'heure
            TextButton(
              onPressed: () => _selectTime(context),
              child: Text(
                _getFormattedTime(),
                style: TextStyle(
                  color: Colors.black, 
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor:const Color.fromARGB(255, 234, 229, 224), 
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
            ),
            const SizedBox(height: 30),
            // Bouton de réservation
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (salle == "Salle inconnue") {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Sélection de salle requise"),
                          content: const Text("Veuillez sélectionner une salle avant de procéder à la réservation."),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); 
                              },
                              child: const Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                    return;
                  }

                  if (nameController.text.isEmpty || phoneController.text.isEmpty || selectedDate == null || selectedTime == null) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Champs manquants"),
                          content: const Text("Veuillez remplir tous les champs avant de confirmer la réservation."),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Réservation effectuée avec succès !")),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1569AD),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text("Réserver", style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
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
}
