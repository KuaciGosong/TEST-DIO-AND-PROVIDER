import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Ganti dengan nomor WhatsApp yang ingin Anda hubungi
    final Uri whatsappUrl = Uri.parse("https://wa.me/6287742345680");

    return Scaffold(
      backgroundColor: Color(0xFFBCF2F6),
      appBar: AppBar(
        backgroundColor: Color(0xFF006BFF),
        foregroundColor: Colors.white,
        title: Text('Tentang Saya'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Foto Profil di atas nama
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/profile.jpg'), // Foto profil dari data lokal
              ),
              SizedBox(height: 20),
              // Nama dan Deskripsi
              Text(
                'Marino Hermawan',
                style: TextStyle(
                  color: Color(0xFF006BFF),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Saya merupakan mahasiswa program studi Pendidikan Teknik Informatika Universitas Pendidikan Ganesha Tahun 2022. Saya menyukai beberapa hal yang berkaitan dengan teknologi dan engineering.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
              // Tombol WhatsApp
              ElevatedButton(
                onPressed: () async {
                  if (await canLaunchUrl(whatsappUrl)) {
                    await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
                  } else {
                    throw 'Could not launch WhatsApp';
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF006BFF),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Kontak Saya',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
