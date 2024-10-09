import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie_provider.dart';
import '../providers/user_provider.dart';
import '../services/user_service.dart';
import '../view/movie_list.dart';
import '../view/user_list.dart';
import '../view/profile.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MovieProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider(service: UserService())),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Multi Page App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFBCF2F6), // Warna background
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150, // Lebar tombol
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MovieListPage()),
                        );
                      },
                      icon: Icon(Icons.movie, color: Colors.white, size: 40), // Ukuran ikon film
                      label: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Movie List',
                            style: TextStyle(color: Colors.white, fontSize: 18), // Ukuran teks
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF006BFF), // Warna tombol
                        padding: EdgeInsets.symmetric(vertical: 20), // Padding vertikal
                      ),
                    ),
                  ),
                  SizedBox(width: 20), // Spasi antar tombol
                  SizedBox(
                    width: 150, // Lebar tombol
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UserListPage()),
                        );
                      },
                      icon: Icon(Icons.people, color: Colors.white, size: 40), // Ukuran ikon pengguna
                      label: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'User List',
                            style: TextStyle(color: Colors.white, fontSize: 18), // Ukuran teks
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF006BFF), // Warna tombol
                        padding: EdgeInsets.symmetric(vertical: 20), // Padding vertikal
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20), // Spasi di atas tombol profil
              SizedBox(
                width: 150, // Lebar tombol
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                  icon: Icon(Icons.person, color: Colors.white, size: 40), // Ukuran ikon profil
                  label: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Profile',
                        style: TextStyle(color: Colors.white, fontSize: 18), // Ukuran teks
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF006BFF), // Warna tombol
                    padding: EdgeInsets.symmetric(vertical: 20), // Padding vertikal
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
