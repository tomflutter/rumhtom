import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue, // Ubah latar belakang menjadi biru
        child: Center(
          child: Lottie.asset(
            'assets/images/loading_animation.json', // Ganti dengan path Lottie Anda
            width: 350, // Atur lebar animasi sesuai kebutuhan
            height: 350, // Atur tinggi animasi sesuai kebutuhan
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
