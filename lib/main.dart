import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rumahtom/home_page.dart';
import 'theme_provider.dart'; // Pastikan jalur ini benar
import 'LoadingScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<void> _initializeApp() async {
    await Future.delayed(Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(ThemeData.light()), // Pastikan ini
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Tomflutter',
            theme: themeProvider.themeData,
            home: FutureBuilder(
              future: _initializeApp(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return LoadingScreen();
                } else if (snapshot.hasError) {
                  return Scaffold(
                    body: Center(
                      child: Text('An error occurred!'),
                    ),
                  );
                } else {
                  return TomflutterHomePage();
                }
              },
            ),
          );
        },
      ),
    );
  }
}
