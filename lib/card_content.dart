import 'package:flutter/material.dart';

class CardContent extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  CardContent({
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(imagePath, width: 100, height: 100, fit: BoxFit.cover),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(subtitle, style: TextStyle(fontSize: 10)),
            ],
          ),
        ),
      ],
    );
  }
}
