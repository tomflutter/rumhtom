import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SkillPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20),
      children: <Widget>[
         AppBar(
        title: Text('Skill'),
        centerTitle: true,
        elevation: 4,
        backgroundColor: Colors.indigo,
      ),
        SizedBox(height: 20),
        _buildSkillList(),
        SizedBox(height: 40),

        // Konten Baru: Proyek Terbaru
        Text(
          'Proyek Terbaru',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.indigo),
        ),
        SizedBox(height: 10),
        _buildProjectCard('Aplikasi Warung Makan', 'Sebuah aplikasi untuk Memudahkan Warung Makan.'),
        _buildProjectCard('Aplikasi Rsku || Mobile & Web', 'Aplikasi untuk membantu proses RSKU.'),
        SizedBox(height: 40),

        // Konten Baru: Testimoni dengan Carousel
        Text(
          'Testimoni',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.indigo),
        ),
        SizedBox(height: 10),
        _buildTestimonialCarousel(),
        SizedBox(height: 40),
      ],
    );
  }

  // Widget untuk daftar skill
  Widget _buildSkillList() {
    final skills = [
      '• Flutter Development',
      '• Web Development (HTML, CSS, JS, laravel, Golang, flutter, react)',
      '• Backend Development (Node.js, Express, PHP, Laravel, Golang, Ruby on Rails)',
      '• Database Management (MySQL, MongoDB, Firebase, PostgreSQL)',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: skills.map((skill) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Text(
          skill,
          style: TextStyle(fontSize: 16, color: const Color.fromARGB(221, 73, 3, 238)),
        ),
      )).toList(),
    );
  }

  // Widget untuk Proyek
  Widget _buildProjectCard(String title, String description) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              description,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk Carousel Testimoni
  Widget _buildTestimonialCarousel() {
    final List<Map<String, String>> testimonials = [
      {
        'clientName': 'Client Vigenesia',
        'testimonial': '“Kerja sama yang sangat baik dan hasil yang memuaskan”',
        'imageUrl': 'https://picsum.photos/100/100?random=1',
      },
      {
        'clientName': 'Client Checkpoint Warung',
        'testimonial': '“Sangat profesional dan responsif”',
        'imageUrl': 'https://picsum.photos/100/100?random=2',
      },
      {
        'clientName': 'Client Warung Makan',
        'testimonial': '“Sangat memahami kebutuhan klien”',
        'imageUrl': 'https://picsum.photos/100/100?random=3',
      },
    ];

    return CarouselSlider.builder(
      itemCount: testimonials.length,
      itemBuilder: (context, index, realIndex) {
        return _buildTestimonialCard(
          testimonials[index]['clientName']!,
          testimonials[index]['testimonial']!,
          testimonials[index]['imageUrl']!,
        );
      },
      options: CarouselOptions(
        height: 150,
        viewportFraction: 0.8,
        initialPage: 0,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
    );
  }

  // Widget untuk Card Testimoni
  Widget _buildTestimonialCard(String clientName, String testimonial, String imageUrl) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            ClipOval(
              child: Image.network(
                imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    clientName,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    testimonial,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
