import 'package:flutter/material.dart';
import 'package:jangalma/pages/details_maitre.dart';

// Definition des donnees
class Maitre {
  final String photoUrl;
  final String nom;
  final String specialite;
  final String disponibilite;
  final String description;

  Maitre({required this.photoUrl, required this.nom, required this.specialite, required this.disponibilite, required this.description});
}

final List<Maitre> maitres = [
  Maitre(
      photoUrl: 'assets/images/maitre1.webp',
      nom: 'Mass Kane',
      specialite:
          'Lire et Écriture Arabe, Mémoriser le Coran,Apprendre Xam-Xam',
      disponibilite:
      'lundi soir, Mercredi soir et Samedi matin', 
      description:
      ' Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia'
      '  molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum'
      'numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium' 
       'optio, eaque rerum!'),
  Maitre(
      photoUrl: 'assets/images/maitre2.webp',
      nom: 'Alioune Wane',
      specialite:
          'Lire et Écriture Arabe, Mémoriser le Coran,Apprendre Xam-Xam', 
      disponibilite:
      'lundi soir, Mercredi soir et Samedi matin', 
      description:
      ' Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia'
      '  molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum'
      'numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium' 
       'optio, eaque rerum!'),
  Maitre(
      photoUrl: 'assets/images/maitre1.webp',
      nom: 'Mohamed Mbao',
      specialite:
          'Lire et Écriture Arabe, Mémoriser le Coran,Apprendre Xam-Xam', 
      disponibilite:
      'lundi soir, Mercredi soir et Samedi matin', 
      description:
      ' Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia'
      '  molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum'
      'numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium' 
       'optio, eaque rerum!'),
  Maitre(
      photoUrl: 'assets/images/maitre2.webp',
      nom: 'Diabel Seck',
      specialite:
          'Lire et Écriture Arabe, Mémoriser le Coran,Apprendre Xam-Xam', 
      disponibilite:
      'lundi soir, Mercredi soir et Samedi matin', 
      description:
      ' Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia'
      '  molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum'
      'numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium' 
       'optio, eaque rerum!'),
  Maitre(
      photoUrl: 'assets/images/maitre1.webp',
      nom: 'Mbaye Thiandoum',
      specialite:
          'Lire et Écriture Arabe, Mémoriser le Coran,Apprendre Xam-Xam', 
      disponibilite:
      'lundi soir, Mercredi soir et Samedi matin', 
      description:
      ' Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia'
      '  molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum'
      'numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium' 
       'optio, eaque rerum!'),
  Maitre(
      photoUrl: 'assets/images/maitre2.webp',
      nom: 'Mohamed Dia',
      specialite:
          'Lire et Écriture Arabe, Mémoriser le Coran,Apprendre Xam-Xam', 
      disponibilite:
      'lundi soir, Mercredi soir et Samedi matin', 
      description:
      ' Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia'
      '  molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum'
      'numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium' 
       'optio, eaque rerum!' ),
  // Ajoutez d'autres maitres ici
];

class ListeMaitres extends StatefulWidget {
  const ListeMaitres({super.key});

  @override
  State<ListeMaitres> createState() => _ListeMaitresState();
}

class _ListeMaitresState extends State<ListeMaitres> {
  String _searchQuery = '';
  List<Maitre> _filteredMaitres = maitres;

  @override
  void initState() {
    super.initState();
    _filterMaitres();
  }

  void _filterMaitres() {
    setState(() {
      _filteredMaitres = maitres.where((maitre) {
        final lowerCaseQuery = _searchQuery.toLowerCase();
        return maitre.nom.toLowerCase().contains(lowerCaseQuery) ||
            maitre.specialite.toLowerCase().contains(lowerCaseQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text('Liste des Maitres'),
            SizedBox(height: 13.0),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 233, 154, 247),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                TextField(
                  onChanged: (query) {
                    setState(() {
                      _searchQuery = query;
                      _filterMaitres();
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Rechercher par nom ou specialite...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 13.0),
              ],
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _filteredMaitres.length,
        itemBuilder: (context, index) {
          final maitre = _filteredMaitres[index];
          return ListTile(
            contentPadding: const EdgeInsets.all(8.0),
            leading: CircleAvatar(
              backgroundImage: AssetImage(maitre.photoUrl),
              radius: 30,
            ),
            title: Text(maitre.nom,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(maitre.specialite),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsMaitre(maitre: maitre),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
