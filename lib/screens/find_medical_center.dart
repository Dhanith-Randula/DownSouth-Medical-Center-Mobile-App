import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'appointmentPage(Book Now).dart';

Future<void> _launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  } else {
    throw 'Could not launch $url';
  }
}

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
        leading: BackButton(),
        title: Text(
          'Find Medical Center',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
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
                          _launchURL(
                              'https://www.google.com/maps/dir/?api=1&destination=1234+Main+St');
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppointmentPage.id);
                      },
                      child: Text('Book Now'),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(188, 170, 170, 170),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        leading: Image.asset('images/medical_center.jpg'),
                        title: Text(
                          'Medical Center 2',
                        ), // Change the title here
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Address: 5678 Main St'), // Change the address here
                            Text(
                                'Phone: 098-765-4321'), // Change the phone number here
                            Text(
                                'Doctors: Dr. John Doe,Dr. Jane Smith'), // Change the doctors here
                            Text('Owner: Jane Smith'), // Change the owner here
                            Text('Rating: 4.5/5.0'), // Change the rating here
                            Text(
                                'Hours: 8:00 AM - 5:00 PM') // Change the hours here
                          ],
                        ),
                        onTap: () {
                          _launchURL(
                              'https://www.google.com/maps/dir/?api=1&destination=5678+Main+St'); // Change the print statement here
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
