import 'package:flutter/material.dart';
import 'package:flash_chat/components/book_appointment_text.dart';
import 'package:intl/intl.dart';

class AppointmentPage extends StatefulWidget {
  static const String id = 'appintment_book_now';
  @override
  _AppointmentPageState createState() => _AppointmentPageState();
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
                  returnedValue: 'Please enter patient name',
                  lable: 'Patient Name',
                  hinttext: 'Enter Patient Name',
                ),

                SizedBox(height: 16.0),
                Text_part(
                  text1: 'Medical Center Name',
                ),
                book_appointment_text(
                  returnedValue: 'Please enter Medical Center Name',
                  lable: 'Medical Center Name',
                  hinttext: 'Enter Medical Center Name',
                ),

              
                SizedBox(height: 16.0),
                Text_part(
                  text1: 'Doctor Name',
                ),
                book_appointment_text(
                  returnedValue: 'Please enter Doctor Name',
                  lable: 'Doctor Name',
                  hinttext: 'Enter Doctor Name',
                ),

                SizedBox(height: 16.0),
                Text_part(
                  text1: 'Description',
                ),
                book_appointment_text(
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
