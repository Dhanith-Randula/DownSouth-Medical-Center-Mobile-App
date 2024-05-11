import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:flash_chat/components/config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer' as dev;
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:xml/xml.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

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

  void search() async {
    var url = Uri.parse(getItemToCustomer);
    url = url.replace(queryParameters: {
      // Add query parameters here
      "name": _nameController.text,
    });
    dev.log("url ${url.toString()}");

    var response = await http.get(url);
    var document = XmlDocument.parse(response.body);

    var place = document.findAllElements('success').toList();
    var locs = place;

    dev.log("\n\n place ${locs.toString()}");

    List newMarkers = [];

    for (var location in place) {
      var latitude = location.getAttribute('location');
      dev.log("\n\nlatitude ${latitude.toString()}");

      newMarkers.add(latitude);
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
            image: AssetImage(
                'images/background_image.jpg'), // replace with your image
            fit: BoxFit.cover,
          ),
          color: const Color.fromARGB(85, 255, 255, 255)
              .withOpacity(0.5), // this makes the color white with 50% opacity
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15.0), // Add this line
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 50.0, left: 10, right: 10),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Search your Medical Center',
                      textStyle: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
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
                  minimumSize: MaterialStateProperty.all<Size>(
                      Size(100, 50)), // Set the size
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(137, 155, 153, 153)), // Set the color
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
                  markers: Set<Marker>.from(markers.map((e) => Marker(
                        markerId: MarkerId(e.toString()),
                        position: LatLng(e[0], e[1]),
                      ))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
