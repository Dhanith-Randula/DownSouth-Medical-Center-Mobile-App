import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

class EmergencyDetailsPage extends StatelessWidget {
  static const String id = 'EmergencyDetailsPage';

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
        title: Text('Emergency Details',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background_image.jpg'),
            fit: BoxFit.cover,
          ),
          color: Color.fromARGB(157, 255, 255, 255).withOpacity(0.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(188, 170, 170, 170),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  title: Text(
                    'POLICE STATION',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Address: 26M8+5VR, Wakwella Rd, Galle 80000'),
                      Text('Phone: 091-2234962'),
                      Text('Hours: Open 24 hours'),
                      Text('Web : http://www.police.lk/'),
                      Text(
                        'Direction ',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    _launchURL('https://maps.app.goo.gl/7e91cEP8U31Hg5F89');
                  },
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(188, 170, 170, 170),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  title: Text(
                    'HOSPITAL - Karapitiya',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Address: Karapitiya Junction, Galle 80000'),
                      Text('Phone: 0912232267'),
                      Text('Hours: Open 24 hours'),
                      Text('Plus code : 368G+RC Galle'),
                      Text(
                        'Direction ',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    _launchURL('https://maps.app.goo.gl/VyEzxbNTq73Cgn4E7');
                  },
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(188, 170, 170, 170),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  title: Text(
                    'HOSPITAL - Mahamodara',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Address: Galle 80000'),
                      Text('Phone: 0912222261'),
                      Text('Hours: Open 24 hours'),
                      Text('Plus code : 26Q3+JX Galle'),
                      Text(
                        'Direction ',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    _launchURL('https://maps.app.goo.gl/M8XHwDyBXsSM9sSAA');
                  },
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(188, 170, 170, 170),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  title: Text(
                    'Co-Operative PRIVATE HOSPITAL',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Address: 24 Gamini Mawatha, Galle 80000'),
                      Text('Phone: 0912234270'),
                      Text('Hours: Open 24 hours'),
                      Text('Plus code : 26P8+MC Galle'),
                      Text(
                        'Direction ',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    _launchURL('https://maps.app.goo.gl/CUYCwgWa1VCWG38U7');
                  },
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(188, 170, 170, 170),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  title: Text(
                    'RUHUNU PRIVATE HOSPITAL',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Address: Galle 80000'),
                      Text('Phone: 0917694059'),
                      Text('Hours: Open 24 hours'),
                      Text('Plus code : 369G+QV Galle'),
                      Text('Web : http://www.ruhunuhospital.lk/'),
                      Text(
                        'Direction ',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    _launchURL('https://maps.app.goo.gl/uS8iMmbN3kZExj4F8');
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
