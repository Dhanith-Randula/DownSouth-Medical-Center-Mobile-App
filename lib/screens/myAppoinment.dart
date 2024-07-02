import 'package:flutter/material.dart';
import 'dart:developer' as dev;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flash_chat/screens/secure_storage.dart';

class MyAppoinment extends StatefulWidget {
  static const String id = 'my_appoinment';
  const MyAppoinment({Key? key}) : super(key: key);

  @override
  _MyAppoinmentState createState() => _MyAppoinmentState();
}

class _MyAppoinmentState extends State<MyAppoinment> {
  @override
  void initState() {
    super.initState();
    fetchAppointments();
  }

  String? id;
  String? username;
  String? user_type;
  String? token;

  List<Map<String, dynamic>> appointments = [
    {
      'appointment_id': 'appointment_id',
      // 'date': 'date',
      // 'time': 'time',
      // 'medical_center_name': 'medical_center',
      // 'doctor_name': 'doctor',
      // 'patient_name': 'patient',
    },
    // {
    //   'appointment_id': '2',
    //   'date': '2022-01-02',
    //   'time': '11:00 AM',
    //   'medical_center_name': 'Medical Center 2',
    //   'doctor_name': 'Dr. Jane Doe',
    //   'patient_name': 'Jane Smith',
    // },
  ];
  final storage = FlutterSecureStorage();

  void fetchAppointments() async {
    var user = await SecureStorage().readSecureData('username');
    dev.log(user);
    dev.log('Fetching appointments...');
    var uri = Uri.parse(
        "http://192.168.43.62:4005/api/v1/appointment/my_appointments?username=${user}");
    var request = http.MultipartRequest('GET', uri);
    var response = await request.send();
    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      dev.log(responseBody);

      var responseBodyJson = jsonDecode(responseBody);
      appointments =
          List<Map<String, dynamic>>.from(responseBodyJson).map((appointment) {
        return {
          'appointment_id': appointment['appointment_id'],
          'date': appointment['date'],
          'time': appointment['time'],
          'medical_center_name': appointment['username'],
          'doctor_name': appointment['doctor'],
          'patient_name': appointment['patient'],
        };
      }).toList();

      //  id = responseBodyJson['_id'];
      //  username = responseBodyJson['username'];
      //  user_type = responseBodyJson['user_type'];
      //  token = responseBodyJson['token'];
    } else {
      dev.log('Failed to fetch appointments');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 214, 214, 214),
        centerTitle: true,
        leading: BackButton(),
        title: Text(
          'MY APPOINMENT',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background_image.jpg'),
            fit: BoxFit.cover,
          ),
          color: const Color.fromARGB(85, 255, 255, 255).withOpacity(0.5),
        ),
        child: Container(
          color: Colors.white.withOpacity(0.4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  itemCount: appointments.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.white.withOpacity(0.5),
                      child: ListTile(
                        subtitleTextStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        title: Text(
                          'Appointment ID: ${appointments[index]['appointment_id']}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Medical Center: ${appointments[index]['medical_center_name']}',
                            ),
                            Text(
                              'Date: ${appointments[index]['date']}',
                            ),
                            Text(
                              'Time: ${appointments[index]['time']}',
                            ),
                            Text(
                              'Doctor: ${appointments[index]['doctor_name']}',
                            ),
                            Text(
                              'Patient: ${appointments[index]['patient_name']}',
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: mySecondAppointmentList.length,
              //     itemBuilder: (context, index) {
              //       return Container(
              //         color: Colors.white.withOpacity(0.5),
              //         child: ListTile(
              //           subtitleTextStyle: TextStyle(
              //             color: Colors.black,
              //             fontSize: 16,
              //           ),
              //           title: Text(
              //             'Appointment ID:' +
              //                 mySecondAppointmentList[index]['appointment_id']!,
              //             style: TextStyle(
              //               color: Colors.black,
              //               fontSize: 18,
              //               fontWeight: FontWeight.bold,
              //             ),
              //           ),
              //           subtitle: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text('Medical Center: ' +
              //                   mySecondAppointmentList[index]
              //                       ['medical_center_name']!),
              //               Text('Date: ' +
              //                   mySecondAppointmentList[index]['date']!),
              //               Text('Time: ' +
              //                   mySecondAppointmentList[index]['time']!),
              //               Text('Doctor: ' +
              //                   mySecondAppointmentList[index]['doctor_name']!),
              //               Text('Patient: ' +
              //                   mySecondAppointmentList[index]
              //                       ['patient_name']!),
              //             ],
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

// List<Map<String, String>> appointments = [
//   {
//     'appointment_id': '1',
//     'date': '2022-01-01',
//     'time': '10:00 AM',
//     'medical_center_name': 'Medical Center 1',
//     'doctor_name': 'Dr. John Doe',
//     'patient_name': 'John Smith',
//   },
//   {
//     'appointment_id': '2',
//     'date': '2022-01-02',
//     'time': '11:00 AM',
//     'medical_center_name': 'Medical Center 2',
//     'doctor_name': 'Dr. Jane Doe',
//     'patient_name': 'Jane Smith',
//   },
// ];

// List<Map<String, String>> mySecondAppointmentList = [
//   {
//     'appointment_id': '2',
//     'date': '2022-01-02',
//     'time': '11:00 AM',
//     'medical_center_name': 'Medical Center 2',
//     'doctor_name': 'Dr. Jane Doe',
//     'patient_name': 'Jane Smith',
//   },
// ];
}
