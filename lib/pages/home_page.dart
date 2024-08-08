import 'package:flutter/material.dart';
import 'package:jangalma/pages/cours_page.dart';
import 'package:jangalma/pages/liste_maitres.dart';
import 'package:jangalma/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Liste des pages
  final List<Widget> _pages = [
    // Page d'accueil valide
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 50),
        const Text(
          "Jangalma",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 233, 154, 247),
          ),
        ),
        const SizedBox(height: 100),
        Image.asset(
          'assets/images/mengaji.avif', 
          width: double.infinity,
          height: 200, 
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 50),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Une application qui permet d'apprendre l'Arabe Coranique",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
    const ListeMaitres(),
    const CoursPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Recherche',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Cours',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 233, 154, 247),
        onTap: _onItemTapped,
        unselectedItemColor: Colors.purple.withOpacity(0.3),
      ),
    );
  }
}
