import 'package:flutter/material.dart';


class MyAppoinment extends StatelessWidget {
  static const String id = 'my_appoinment';
  const MyAppoinment({Key? key}) : super(key: key);

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
            image: AssetImage(
                'images/background_image.jpg'), 
            fit: BoxFit.cover,
          ),
          color: const Color.fromARGB(85, 255, 255, 255)
              .withOpacity(0.5), 
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
                  itemCount: myAppointmentList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.white.withOpacity(0.5),
                      child: ListTile(
                        subtitleTextStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        title: Text(
                          'Appointment ID:' +
                              myAppointmentList[index]['appointment_id']!,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Medical Center: ' +
                                  myAppointmentList[index]
                                      ['medical_center_name']!,
                            ),
                            Text(
                              'Date: ' + myAppointmentList[index]['date']!,
                            ),
                            Text(
                              'Time: ' + myAppointmentList[index]['time']!,
                            ),
                            Text(
                              'Doctor: ' +
                                  myAppointmentList[index]['doctor_name']!,
                            ),
                            Text(
                              'Patient: ' +
                                  myAppointmentList[index]['patient_name']!,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: mySecondAppointmentList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.white.withOpacity(0.5),
                      child: ListTile(
                        subtitleTextStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        title: Text(
                          'Appointment ID:' +
                              mySecondAppointmentList[index]['appointment_id']!,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Medical Center: ' +
                                mySecondAppointmentList[index]
                                    ['medical_center_name']!),
                            Text('Date: ' +
                                mySecondAppointmentList[index]['date']!),
                            Text('Time: ' +
                                mySecondAppointmentList[index]['time']!),
                            Text('Doctor: ' +
                                mySecondAppointmentList[index]['doctor_name']!),
                            Text('Patient: ' +
                                mySecondAppointmentList[index]
                                    ['patient_name']!),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Map<String, String>> myAppointmentList = [
  {
    'appointment_id': '1',
    'date': '2022-01-01',
    'time': '10:00 AM',
    'medical_center_name': 'Medical Center 1',
    'doctor_name': 'Dr. John Doe',
    'patient_name': 'John Smith',
  },
  
];

List<Map<String, String>> mySecondAppointmentList = [
  {
    'appointment_id': '2',
    'date': '2022-01-02',
    'time': '11:00 AM',
    'medical_center_name': 'Medical Center 2',
    'doctor_name': 'Dr. Jane Doe',
    'patient_name': 'Jane Smith',
  },

];
