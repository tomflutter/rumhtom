import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class FlipCardWidget extends StatelessWidget {
  final String frontImage;
  final String frontDescription;
  final String backImage;
  final String backDescription;

  FlipCardWidget({
    required this.frontImage,
    required this.frontDescription,
    required this.backImage,
    required this.backDescription,
  });

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      front: _buildCard(frontImage, frontDescription),
      back: _buildCard(backImage, backDescription),
    );
  }

  Widget _buildCard(String image, String description) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: Container(
        color: Colors.black54,
        child: Center(
          child: Text(
            description,
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
