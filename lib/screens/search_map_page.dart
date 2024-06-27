import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/widgets.dart';

import 'package:http/http.dart' as http;

import 'dart:developer' as dev;

import 'package:xml/xml.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'dart:convert';

String getItemToCustomer = 'https://example.com';

class CustomerDashboardPage extends StatefulWidget {
  static const String id = 'seacrch_map';
  CustomerDashboardPage({Key? key}) : super(key: key);

  @override
  _CustomerDashboardPageState createState() => _CustomerDashboardPageState();
}

class _CustomerDashboardPageState extends State<CustomerDashboardPage> {
  final List markers = [];

  final TextEditingController _nameController = TextEditingController();

  // int distnese_calculation(double lat1, double lon1, double lat2, double lon2) {
  //   return 50;
  // }

  void search() async {
    var url = Uri.parse(
        'https://ds-m-center.onrender.com/api/v1/m_center/search_by_destination');
    url = url.replace(queryParameters: {
      "destination": _nameController.text,
    });
    dev.log("url ${url.toString()}");

    var response = await http.get(url);
    dev.log("response ${response.body}");
    //var document = XmlDocument.parse(response.body);

    List<dynamic> responseBody = jsonDecode(response.body);

    List<Marker> newMarkers = [];

    for (var item in responseBody) {
      var coordinates = item['location']['coordinates'];
      var latitude = coordinates[1];
      var longitude = coordinates[0];
      newMarkers.add(
        Marker(
          markerId: MarkerId(item['_id']),
          position: LatLng(latitude, longitude),
        ),
      );
    }
    dev.log("\n\n new markers  >> ${newMarkers.toString()}");

    setState(() {
      markers.clear();
      markers.addAll(newMarkers);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background_image.jpg'),
            fit: BoxFit.cover,
          ),
          color: const Color.fromARGB(85, 255, 255, 255).withOpacity(0.5),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 50.0, left: 10, right: 10),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back,
                          color: Colors.black, size: 30.0),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Search your Medical Center',
                          textStyle: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    hintText: 'Search...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  search();
                },
                child: const Text('Search',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    )),
                style: ButtonStyle(
                  side: MaterialStateProperty.all<BorderSide>(BorderSide(
                      color: Color.fromARGB(255, 94, 92, 92), width: 2.0)),
                  minimumSize: MaterialStateProperty.all<Size>(Size(100, 50)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(137, 155, 153, 153)),
                ),
              ),
              Expanded(
                child: GoogleMap(
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(
                      7.8731,
                      80.7718,
                    ),
                    zoom: 8,
                  ),
                  // markers: Set<Marker>.from(markers.map((e) => Marker(
                  //       markerId: MarkerId(e.toString()),
                  //       position: LatLng(e[0], e[1]),
                  //     ))),
                  markers: Set<Marker>.from(markers),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
