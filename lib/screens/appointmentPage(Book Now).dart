import 'package:flutter/material.dart';
import 'package:flash_chat/components/book_appointment_text.dart';
import 'package:intl/intl.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flash_chat/screens/secure_storage.dart';
import 'dart:developer' as dev;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flash_chat/screens/myAppoinment.dart';

class AppointmentPage extends StatefulWidget {
  static const String id = 'appintment_book_now';
  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

final TextEditingController dateController = TextEditingController();
final TextEditingController timeController = TextEditingController();
final TextEditingController patient_nameController = TextEditingController();
final TextEditingController medical_center_nameController =
    TextEditingController();
final TextEditingController doctor_nameController = TextEditingController();
final TextEditingController descriptionController = TextEditingController();

void book(BuildContext context) async {
  var uri = Uri.parse("http://192.168.43.62:4005/api/v1/appointment");
  var user = await SecureStorage().readSecureData('username');
  dev.log(timeController.text);
  // dev.log("signup");
  // Navigator.pushNamed(context, HomePage.id);

  var request = http.MultipartRequest('POST', uri)
    ..fields['date'] = dateController.text
    ..fields['time'] = timeController.text
    ..fields['patient'] = patient_nameController.text
    ..fields['medical_center'] = medical_center_nameController.text
    ..fields['doctor'] = doctor_nameController.text
    ..fields['description'] = descriptionController.text
    ..fields['username'] = user;

  dev.log("request ${request.toString()}");
  dev.log("request ${request.fields.toString()}");
// we were aneble to connec to the back end ... but i will show what we have done now
  var response = await request.send();
  if (response.statusCode == 201) {
    // var response = await request.send();
    var responseBody = await response.stream.bytesToString();
    dev.log('Response body: $responseBody');

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MyAppoinment(),
      ),
    );

    // String? tokend = await storage.read(key: 'jwt');
    // dev.log('Token from storage: ${tokend}');
  }
}

class _AppointmentPageState extends State<AppointmentPage> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? selectedPatient;
  String? selectedMedicalCenter;
  String? selectedDoctor;
  String? description;
  String? formattedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (picked != null && (selectedDate == null || picked != selectedDate)) {
      setState(() {
        selectedDate = picked;
        formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && (selectedTime == null || picked != selectedTime)) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(146, 99, 99, 99).withOpacity(0.5),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text('Book Appointment',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'times new roman',
            )),
      ),
      body: Expanded(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text_part(
                  text1: 'Date',
                ),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text(formattedDate ?? 'Select Date'),
                ),
                SizedBox(height: 16.0),
                Text_part(
                  text1: 'Time',
                ),
                ElevatedButton(
                  onPressed: () => _selectTime(context),
                  child: Text(selectedTime?.format(context) ?? 'Select Time'),
                ),
                SizedBox(height: 16.0),
                Text_part(
                  text1: 'Patient Name',
                ),
                book_appointment_text(
                  controllerA: patient_nameController,
                  returnedValue: 'Please enter patient name',
                  lable: 'Patient Name',
                  hinttext: 'Enter Patient Name',
                ),
                SizedBox(height: 16.0),
                Text_part(
                  text1: 'Medical Center Name',
                ),
                book_appointment_text(
                  controllerA: medical_center_nameController,
                  returnedValue: 'Please enter Medical Center Name',
                  lable: 'Medical Center Name',
                  hinttext: 'Enter Medical Center Name',
                ),
                SizedBox(height: 16.0),
                Text_part(
                  text1: 'Doctor Name',
                ),
                book_appointment_text(
                  controllerA: doctor_nameController,
                  returnedValue: 'Please enter Doctor Name',
                  lable: 'Doctor Name',
                  hinttext: 'Enter Doctor Name',
                ),
                SizedBox(height: 16.0),
                Text_part(
                  text1: 'Description',
                ),
                book_appointment_text(
                  controllerA: descriptionController,
                  returnedValue: 'Please enter Description',
                  lable: 'Description',
                  hinttext: 'Enter Description',
                ),
                SizedBox(
                  height: 16.0,
                ),
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
                      ),
                    ),
                    onPressed: () {
                      book(context);
                    },
                    child: Text('Book Now'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
