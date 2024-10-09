import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserDetailPage extends StatelessWidget {
  final UserModel user;

  UserDetailPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
        backgroundColor: Color(0xFF006BFF), 
        foregroundColor: Colors.white, // Warna AppBar
      ),
      body: Container(
        color: Color(0xFFBCF2F6), // Warna background penuh
        padding: const EdgeInsets.all(16.0),
        child: Center( // Membungkus Column dengan Center
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Mengatur konten agar berada di tengah
            crossAxisAlignment: CrossAxisAlignment.center, // Rata tengah
            children: [
              Text(
                'Name: ${user.name}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF006BFF), // Warna foreground
                ),
                textAlign: TextAlign.center, // Rata tengah
              ),
              SizedBox(height: 10),
              Text(
                'Username: ${user.username}',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF006BFF), // Warna foreground
                ),
                textAlign: TextAlign.center, // Rata tengah
              ),
              SizedBox(height: 10),
              Text(
                'Email: ${user.email}',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF006BFF), // Warna foreground
                ),
                textAlign: TextAlign.center, // Rata tengah
              ),
              SizedBox(height: 20),
              Text(
                'Address',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF006BFF), // Warna foreground
                ),
                textAlign: TextAlign.center, // Rata tengah
              ),
              SizedBox(height: 10),
              Text(
                'Street: ${user.address.street}',
                style: TextStyle(
                  color: Color(0xFF006BFF), // Warna foreground
                ),
                textAlign: TextAlign.center, // Rata tengah
              ),
              Text(
                'City: ${user.address.city}',
                style: TextStyle(
                  color: Color(0xFF006BFF), // Warna foreground
                ),
                textAlign: TextAlign.center, // Rata tengah
              ),
              Text(
                'State: ${user.address.state}',
                style: TextStyle(
                  color: Color(0xFF006BFF), // Warna foreground
                ),
                textAlign: TextAlign.center, // Rata tengah
              ),
              Text(
                'Zipcode: ${user.address.zipcode}',
                style: TextStyle(
                  color: Color(0xFF006BFF), // Warna foreground
                ),
                textAlign: TextAlign.center, // Rata tengah
              ),
            ],
          ),
        ),
      ),
    );
  }
}
