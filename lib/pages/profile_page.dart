import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController usernameController =
      TextEditingController(text: 'Moussa Ndoye');
  final TextEditingController emailController =
      TextEditingController(text: 'ndoye.moussa@gmail.com');
  final TextEditingController phoneController =
      TextEditingController(text: '770000000');
  final TextEditingController addressController =
      TextEditingController(text: 'Guediawaye, Dakar, Dakar');

  bool isModified = false;

  @override
  void initState() {
    super.initState();
    usernameController.addListener(_checkIfModified);
    emailController.addListener(_checkIfModified);
    phoneController.addListener(_checkIfModified);
    addressController.addListener(_checkIfModified);
  }

  void _checkIfModified() {
    setState(() {
      isModified = usernameController.text != 'Moussa Ndoye' ||
          emailController.text != 'ndoye.moussa@gmail.com' ||
          phoneController.text != '770000000' ||
          addressController.text != 'Guediawaye, Dakar, Dakar';
    });
  }

  void _saveChanges() {
    // Logique pour enregistrer les modifications
    // Par exemple, envoyer les nouvelles données à un serveur ou les enregistrer localement
    // ignore: avoid_print
    print('Nom d\'utilisateur: ${usernameController.text}');
    // ignore: avoid_print
    print('Email: ${emailController.text}');
    // ignore: avoid_print
    print('Téléphone: ${phoneController.text}');
    // ignore: avoid_print
    print('Adresse: ${addressController.text}');

    setState(() {
      isModified = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Modifications enregistrées')),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon Profil'),
        backgroundColor: const Color.fromARGB(255, 233, 154, 247),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Informations du Profil',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              _buildProfileField('Nom d\'utilisateur', usernameController, Icons.person),
              const SizedBox(height: 20),
              _buildProfileField('Email', emailController, Icons.email),
              const SizedBox(height: 20),
              _buildProfileField('Téléphone', phoneController, Icons.phone),
              const SizedBox(height: 20),
              _buildProfileField('Adresse', addressController, Icons.home),
              const SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  onPressed: isModified ? _saveChanges : null,
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
                    backgroundColor: const Color.fromARGB(255, 233, 154, 247),
                  ),
                  child: const Text(
                    'Enregistrer les modifications',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileField(String hint, TextEditingController controller, IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        fillColor: Colors.purple.withOpacity(0.1),
        filled: true,
        prefixIcon: Icon(icon),
      ),
    );
  }
}