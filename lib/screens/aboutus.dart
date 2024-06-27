import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  static const String id = 'aboutus';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('About Us'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to the Down South Tourist Medical Help Project!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'The Down South Tourist Medical Help Project is dedicated to bridging the critical gap between tourists and healthcare services in the southern region. Our mission is to provide a reliable, comprehensive network of medical facilities and centers to ensure tourists have access to the best possible medical care during their travels.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            SectionTitle(title: 'Our Vision'),
            Text(
              'We envision a southern region where every tourist can enjoy their visit with peace of mind, knowing that top-notch medical assistance is just a click away. By leveraging the latest technologies and adhering to industry best practices, we aim to set new standards in tourist healthcare services.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            SectionTitle(title: 'Our Mission'),
            Text(
              'Our mission is to provide tourists with accurate, up-to-date information on medical facilities, ensuring they can find the care they need when they need it. We strive to make medical assistance easily accessible, improving the overall tourist experience in the southern region.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            SectionTitle(title: 'Our Services'),
            Text(
              '- Comprehensive Medical Directory: We offer a detailed directory of medical facilities, including hospitals, clinics, and specialty centers, tailored to the needs of tourists.\n\n'
              '- User-Friendly Mobile App: Our app is designed to provide quick and easy access to medical information, facility locations, contact details, and emergency services.\n\n'
              '- Emergency Support: We offer 24/7 support to assist tourists in emergencies, ensuring they receive prompt and appropriate medical care.\n\n'
              '- Cultural and Language Assistance: Recognizing the diverse backgrounds of tourists, we provide information and support in multiple languages and offer cultural assistance to navigate local healthcare systems.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            SectionTitle(title: 'Our Team'),
            Text(
              'Our team is composed of healthcare professionals, technology experts, and customer service specialists committed to enhancing tourist healthcare in the southern region. We work tirelessly to ensure that our services meet the highest standards of quality and reliability.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            SectionTitle(title: 'Why Choose Us?'),
            Text(
              '- Expertise: Our team has extensive knowledge and experience in healthcare and tourism, ensuring you receive the best possible guidance and support.\n\n'
              '- Accessibility: With our easy-to-use mobile app and comprehensive network of medical facilities, help is always within reach.\n\n'
              '- Trustworthiness: We are committed to maintaining your privacy and security, with strict protocols to protect your personal information.\n\n'
              '- Dedication: We are passionate about improving tourist healthcare and are continuously working to enhance our services.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            SectionTitle(title: 'Contact Us'),
            Text(
              'If you have any questions or need assistance, please do not hesitate to contact us:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Email: info@downsouthmedicalhelp.com\n'
              'Phone: +1-800-123-4567\n'
              'Address: Down South Tourist Medical Help Project, 123 South Street, Southern City, SC 12345',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Thank you for choosing the Down South Tourist Medical Help Project. We are here to ensure your trip is safe, enjoyable, and worry-free.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
    );
  }
}
