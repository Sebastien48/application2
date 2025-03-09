import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Importation des pages
import 'pages/Accueil.dart';
import 'pages/parametre.dart';
import 'pages/login_page.dart';
import 'pages/signup_page.dart';
import 'pages/Annonce.dart';
import 'pages/Reservation.dart';
import 'pages/information.dart';
import 'pages/information3.dart';
import 'pages/information2.dart';
import 'pages/motdepasse.dart';
import 'pages/reset_password.dart';
import 'pages/admin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialisation de Supabase
  await Supabase.initialize(
    url: 'https://yalgynfskqzxuvchbgzx.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlhbGd5bmZza3F6eHV2Y2hiZ3p4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDAyNTkxMzEsImV4cCI6MjA1NTgzNTEzMX0.1YqECoaAeb4KWmunmtdAnFO-Ggc3f5AKEnnVGYpwm9Y',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Artix',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 243, 82, 33),
          brightness: Brightness.light,
          primary: const Color(0xFF1569AD),
          secondary: const Color.fromARGB(217, 1, 170, 182),
          tertiary: const Color.fromARGB(144, 166, 174, 183),
          onSecondary: Colors.white,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/home':(context) =>const Accueil(), // Ajoutez cette ligne pour la route '/home'
        '/parametre':(context) => const ParametresPage(),
             
        '/annonce': (context) => const AnnoncesPage(),
        '/reservation': (context) => const ReservationPage(),
        '/information':(context) => const information(),
           
        '/information2': (context) => const InformationPage(),
        '/information3': (context) => const Information3Page(),
        '/motdepasse': (context) => const MotdepassePage(),
        '/resetpassword': (context) => const ResetPasswordPage(),
        '/admin': (context) => const AdminPage(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Animation de fondu (fade in)
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    // Démarrer l'animation
    _controller.forward();

    // Naviguer vers "/login" une fois l'animation terminée
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            Navigator.pushReplacementNamed(context, '/login');
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/aaa.jpg', height: 100),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ArtixApp extends StatelessWidget {
  const ArtixApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Artix App')),
      body: const Center(child: Text('Welcome to Artix App!')),
    );
  }
}
