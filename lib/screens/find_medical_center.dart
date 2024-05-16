import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/box.dart';

class FindMedicalCenter extends StatefulWidget {
  static const String id = 'FindMedicalCenter';
  const FindMedicalCenter();

  @override
  _FindMedicalCenterState createState() => _FindMedicalCenterState();
}

class _FindMedicalCenterState extends State<FindMedicalCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(144, 189, 188, 188),
        leading: BackButton(),
        title: Text('Find Medical Center'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background_image.jpg'),
            fit: BoxFit.cover,
          ),
          color: Color.fromARGB(83, 124, 123, 123).withOpacity(0.5),
        ),
        child: Container(
          color: const Color.fromARGB(150, 255, 255, 255).withOpacity(0.4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(110, 170, 170, 170),
                          contentPadding: EdgeInsets.symmetric(vertical: 15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                width: 1,
                                color: const Color.fromARGB(255, 0, 0, 0)),
                          ),
                          hintText: 'Search for medical center',
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 30,
                          ),
                          suffixIcon:
                              Icon(Icons.clear, color: Colors.black, size: 30),
                        ),
                        onTap: () {
                          print('Search');
                        },
                      ),
                    ),
                    // Add more widgets here
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(188, 170, 170, 170),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        title: Text('Medical Center 1'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Address: 1234 Main St'),
                            Text('Phone: 123-456-7890'),
                            Text('Doctors: Dr. John Doe,Dr. Jane Smith'),
                            Text('Owner: John Doe'),
                            Text('Rating: 4.5/5.0'),
                            Text('Hours: 8:00 AM - 5:00 PM')
                          ],
                        ),
                        leading: Image.asset('images/medical_center.jpg'),
                        onTap: () {
                          print('Medical Center 1');
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Handle the "Book Now" button press
                        print('Book Now');
                      },
                      child: Text('Book Now'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
