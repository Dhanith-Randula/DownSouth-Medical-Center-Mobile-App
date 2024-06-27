import 'package:flutter/material.dart';

class RowImageText extends StatelessWidget {
  const RowImageText(
      {required this.title1,
      required this.image1,
      required this.title2,
      required this.image2,
      required this.onPressed1,
      required this.onPressed2});
  final String title1;
  final AssetImage image1;
  final String title2;
  final AssetImage image2;
  final VoidCallback onPressed1;
  final VoidCallback onPressed2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              MaterialButton(
                onPressed: onPressed1,
                mouseCursor: MouseCursor.defer,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.black, width: 3.0),
                    image: DecorationImage(
                      image: image1, 
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(
                title1,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      
        Expanded(
          child: Column(
            children: [
              MaterialButton(
                onPressed: onPressed2,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(131, 2, 53, 53).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.black, width: 3.0),
                    image: DecorationImage(
                      image: image2, 
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(
                title2,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
