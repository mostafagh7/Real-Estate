import 'package:flutter/material.dart';

class CardDetails extends StatelessWidget {
  final String text;
  final String text2;
  final IconData? icon;
  const CardDetails({
    super.key,
    required this.text,
    required this.text2,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(screenWidth * 0.01),
        height: screenHeight * 0.06,
        child: Card(
          color: Colors.grey[300],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                icon,
                size: screenWidth * 0.1,
              ),
              Row(
                children: [
                  Text(
                    text,
                    style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: screenWidth * 0.01,
                  ),
                  Text(
                    text2,
                    style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
