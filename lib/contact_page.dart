import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart'; // Pastikan jalur ini benar

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _message = '';

  void _sendEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'your_email@example.com', // Ganti dengan email Anda
      query: 'subject=Pesan dari $_name&body=$_message%0A%0A Dari: $_email',
    );

    if (await canLaunch(emailLaunchUri.toString())) {
      await launch(emailLaunchUri.toString());
    } else {
      throw 'Could not launch ${emailLaunchUri.toString()}';
    }
  }

  void _openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Kontak'),
        centerTitle: true,
        elevation: 4,
        backgroundColor: themeProvider.themeData.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: themeProvider.themeData.cardColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Hubungi Saya',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: themeProvider.themeData.primaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  _buildTextField('Nama', (value) {
                    setState(() {
                      _name = value;
                    });
                  }, (value) {
                    if (value == null || value.isEmpty) {
                      return 'Silakan masukkan nama Anda';
                    }
                    return null;
                  }),
                  SizedBox(height: 15),
                  _buildTextField('Email', (value) {
                    setState(() {
                      _email = value;
                    });
                  }, (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Silakan masukkan email yang valid';
                    }
                    return null;
                  }),
                  SizedBox(height: 15),
                  _buildTextField('Pesan', (value) {
                    setState(() {
                      _message = value;
                    });
                  }, (value) {
                    if (value == null || value.isEmpty) {
                      return 'Silakan masukkan pesan Anda';
                    }
                    return null;
                  }, maxLines: 5),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _sendEmail();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: themeProvider.themeData.primaryColor,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Kirim Pesan',
                      style: TextStyle(
                        fontSize: 18,
                        color: themeProvider
                                .themeData.textTheme.labelLarge?.color ??
                            Colors.white, // Menyesuaikan warna teks
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.store,
                            color: themeProvider.themeData.brightness ==
                                    Brightness.light
                                ? Colors.black // Warna untuk mode terang
                                : Colors.white // Warna untuk mode gelap
                            ),
                        onPressed: () {
                          _openUrl(
                              'https://sociabuzz.com/tomflutter'); // Ganti dengan URL GitHub Anda
                        },
                      ),
                      SizedBox(width: 20),
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.youtube,
                            color: themeProvider.themeData.brightness ==
                                    Brightness.light
                                ? Colors.black // Warna untuk mode terang
                                : Colors.white // Warna untuk mode gelap
                            ),
                        onPressed: () {
                          _openUrl(
                              'https://youtube.com/@tomflutter'); // Ganti dengan URL YouTube Anda
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, Function(String) onChanged,
      String? Function(String?) validator,
      {int maxLines = 1}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blueAccent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blueAccent, width: 2),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      ),
      onChanged: onChanged,
      validator: validator,
      maxLines: maxLines,
    );
  }
}
