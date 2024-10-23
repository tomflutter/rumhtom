import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        'title': 'Aplikasi Rsku || Mobile & Web',
        'description': 'Aplikasi mobile dan web rumah sakit.',
        'color': Colors.blue,
        'image': 'assets/images/dajjal.png',
        'url': 'https://www.amazon.com/gp/product/B0DDYB8D7S', // URL for Aplikasi Rsku
      },
      {
        'title': 'Aplikasi Kencan 2024',
        'description': 'Aplikasi kencan menggunakan teknologi flutter.',
        'color': Colors.red,
        'image': 'assets/images/kencan.png',
        'url': 'https://sociabuzz.com/tomflutter/shop', // URL for Aplikasi Kencan
      },
      {
        'title': 'Aplikasi Catatan Tomnote',
        'description': 'Aplikasi catatan to-do list untuk menyelesaikan tugas.',
        'color': Colors.green,
        'image': 'assets/images/mock.png',
        'url': 'https://www.amazon.com/gp/product/B0CRGH5LG9', // URL for Aplikasi Tomnote
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Proyek Saya'),
        centerTitle: true,
        elevation: 4,
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = (constraints.maxWidth / 200).floor();
                  crossAxisCount = crossAxisCount < 1 ? 1 : crossAxisCount;

                  return _buildProjectGrid(projects, crossAxisCount);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectGrid(List<Map<String, dynamic>> projects, int crossAxisCount) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 0.7,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return _buildProjectCard(
          projects[index]['title']!,
          projects[index]['description']!,
          projects[index]['color'],
          projects[index]['image']!,
          projects[index]['url']!,
        );
      },
    );
  }

  Widget _buildProjectCard(String title, String description, Color color, String imagePath, String url) {
  return Card(
    elevation: 6,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover, // Ensure the image covers the entire area
            height: double.infinity, // Fill the height of the card
            width: double.infinity, // Fill the width of the card
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black54, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => _launchURL(url),
                child: Text('Lihat Proyek'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: color, // Use the project's color for the button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}


  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
