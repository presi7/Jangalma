import 'package:flutter/material.dart';
import 'package:jangalma/pages/liste_maitres.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsMaitre extends StatelessWidget {
  final Maitre maitre;

  const DetailsMaitre({super.key, required this.maitre});

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  Future<void> _sendWhatsAppMessage(String phoneNumber) async {
    final Uri whatsappUri = Uri.parse('https://wa.me/$phoneNumber');
    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(maitre.nom),
        backgroundColor: const Color.fromARGB(255, 233, 154, 247),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(maitre.photoUrl),
              radius: 50,
            ),
            const SizedBox(height: 16),
            Text(
              maitre.nom,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              maitre.specialite,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.call),
                  color: Colors.green,
                  onPressed: () => _makePhoneCall('774801247'), // Remplacez par le numéro de téléphone réel
                ),
                IconButton(
                  icon: const Icon(Icons.message),
                  color: Colors.blue,
                  onPressed: () => _sendWhatsAppMessage('774801247'), // Remplacez par le numéro WhatsApp réel
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
