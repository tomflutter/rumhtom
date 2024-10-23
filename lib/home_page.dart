import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Untuk tema
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:rumahtom/contact_page.dart';
import 'package:rumahtom/project_page.dart';
import 'package:rumahtom/skill_page.dart.dart';
import 'package:rumahtom/theme_provider.dart';

class TomflutterHomePage extends StatefulWidget {
  @override
  _TomflutterHomePageState createState() => _TomflutterHomePageState();
}

class _TomflutterHomePageState extends State<TomflutterHomePage> {
  int _selectedIndex = 0; // Untuk melacak halaman yang dipilih

  final List<Widget> _pages = [
    HomePage(),
    SkillPage(),
    ProjectPage(),
    ContactPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
    'assets/images/logo2.png', // Ganti dengan path ke logo kamu
    fit: BoxFit.contain, // Atur agar logo sesuai dengan ukuran
    height: 40, // Atur tinggi logo sesuai kebutuhan
  ),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () {
              final isDarkMode =
                  Theme.of(context).brightness == Brightness.dark;
              final newTheme =
                  isDarkMode ? ThemeData.light() : ThemeData.dark();
              // Ubah tema
              Provider.of<ThemeProvider>(context, listen: false)
                  .setTheme(newTheme);
            },
          ),
        ],
      ),
      drawer: kIsWeb ? null : _buildDrawer(context),
      body: Row(
        children: [
          if (kIsWeb) _buildWebMenu(context), // Menu untuk web
          Expanded(child: _pages[_selectedIndex]), // Konten utama
        ],
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          _buildDrawerItem('Home', () {
            setState(() => _selectedIndex = 0);
            Navigator.pop(context);
          }),
          _buildDrawerItem('Skill', () {
            setState(() => _selectedIndex = 1);
            Navigator.pop(context);
          }),
          _buildDrawerItem('Project', () {
            setState(() => _selectedIndex = 2);
            Navigator.pop(context);
          }),
          _buildDrawerItem('Contact', () {
            setState(() => _selectedIndex = 3);
            Navigator.pop(context);
          }),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(String title, VoidCallback onTap) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
    );
  }

  Widget _buildWebMenu(BuildContext context) {
    return NavigationRail(
      destinations: [
        NavigationRailDestination(
          icon: Icon(Icons.home),
          label: Text('Home'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.star),
          label: Text('Skill'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.work),
          label: Text('Project'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.contact_mail),
          label: Text('Contact'),
        ),
      ],
      selectedIndex: _selectedIndex,
      onDestinationSelected: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }
}




class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              AnimatedContainer(
                duration: Duration(seconds: 1),
                curve: Curves.easeInOut,
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'), // Ganti dengan path gambar Anda
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Tomflutter',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Fullstack Developer',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Tambahkan aksi di sini jika perlu
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Kontak Saya',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Saya adalah seorang Fullstack Developer yang berpengalaman dalam membangun aplikasi web dan mobile. '
                  'Saya suka belajar teknologi baru dan berkolaborasi dengan tim.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}