import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/signin_screen.dart';
import 'package:flash_chat/theme/theme.dart';
import 'package:flash_chat/components/custom_scaffold.dart';
import 'package:flutter/widgets.dart';
import 'dart:developer' as dev;
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:flash_chat/components/uploadImage.dart';

class AccountDetails extends StatefulWidget {
  static const String id = 'Account_details';
  const AccountDetails();

  @override
  State<AccountDetails> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<AccountDetails> {
  final _formSignupKey = GlobalKey<FormState>();
  bool agreePersonalData = true;

  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final countryController = TextEditingController();
  final phoneNumberController = TextEditingController();

  Uint8List? _image;
  final picker = ImagePicker();

  Future selectImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image = await pickedFile.readAsBytes();
      setState(() {});
    }
  }

  void signup() async {
    var uri = Uri.parse("https://ds-central.onrender.com/tourist");
    dev.log("signup");

    var request = http.MultipartRequest('POST', uri)
      ..fields['name'] = nameController.text
      ..fields['username'] = usernameController.text
      ..fields['password'] = passwordController.text
      ..fields['country'] = countryController.text
      ..fields['phone_number'] = phoneNumberController.text;

    if (_image != null) {
      request.files.add(
        http.MultipartFile.fromBytes(
          'image',
          _image!,
          filename: 'image.jpg',
          contentType: MediaType('file', 'jpeg'),
        ),
      );
    }

    dev.log("request" + request.toString());
    dev.log("request" + request.fields.toString());

    var response = await request.send();
    if (response.statusCode == 201) {
      var responseBody = await response.stream.bytesToString();
      dev.log(responseBody);
      // dev.log(response.toString());
    } else {
      dev.log('Failed to upload!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background_image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(199, 255, 255, 255),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formSignupKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 50.0,
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_back,
                                  color: lightColorScheme.primary),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            Center(
                              widthFactor: 1.5,
                              child: Text(
                                'Account Details',
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w900,
                                  color: lightColorScheme.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Stack(
                          children: [
                            _image != null
                                ? CircleAvatar(
                                    radius: 50,
                                    backgroundImage: MemoryImage(_image!),
                                  )
                                : CircleAvatar(
                                    radius: 50,
                                    backgroundImage:
                                        AssetImage('images/backman.jpg'),
                                  ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: IconButton(
                                onPressed: () async {
                                  await selectImage();
                                },
                                icon: const Icon(Icons.add_a_photo),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: TextFormField(
                            controller: nameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Full name';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: const Text('Full Name'),
                              hintText: 'Enter Full Name',
                              hintStyle: const TextStyle(
                                color: Colors.black26,
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: TextFormField(
                            controller: usernameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: const Text('Email'),
                              hintText: 'Enter Email',
                              hintStyle: const TextStyle(
                                color: Colors.black26,
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: TextFormField(
                            controller: countryController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Country';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: const Text('Country'),
                              hintText: 'Enter Your Country',
                              hintStyle: const TextStyle(
                                color: Colors.black26,
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: TextFormField(
                            controller: phoneNumberController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Phone Number';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: const Text('Phone Number'),
                              hintText: 'Enter Your Phone Number',
                              hintStyle: const TextStyle(
                                color: Colors.black26,
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            obscuringCharacter: '*',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Password';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: const Text('Password'),
                              hintText: 'Enter Password',
                              hintStyle: const TextStyle(
                                color: Colors.black26,
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {},
                              child: const Text('Save'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
