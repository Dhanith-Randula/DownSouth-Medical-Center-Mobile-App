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
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(188, 170, 170, 170),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        title: Text('Asiri Laboratories'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Address:  No.10 Wakwella Rd, Galle 80000'),
                            Text('Phone: 0914 640 640'),
                            Text('Email: asirila@gmail.com'),
                            Text('Owner: Asiri'),
                            Text('Rating: 4.5/5.0'),
                            Text('Hours: Open 24 hours')
                          ],
                        ),
                        leading: Image.asset('images/medical_center.jpg'),
                        onTap: () {
                          _launchURL(
                              'https://maps.app.goo.gl/3QK9LpMAcMaWMY6W8');
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
                          'Ruhunu Hospital',
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Address: Galle 80000'),
                            Text('Phone: 0917 694 059'),
                            Text('Email: ruhunuhospital@gmail.com'),
                            Text('Hours: Open 24 hours')
                          ],
                        ),
                        onTap: () {
                          _launchURL(
                              'https://maps.app.goo.gl/3DPKnJNgqQz9ieqw8'); // Change the print statement here
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppointmentPage.id);
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
