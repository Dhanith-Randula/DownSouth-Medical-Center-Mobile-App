import 'package:flutter/material.dart';
import 'dart:developer' as dev;

class book_appointment_text extends StatelessWidget {
  const book_appointment_text({
    required this.returnedValue,
    required this.lable,
    required this.hinttext,
    required this.controllerA,
  });
  final String returnedValue;
  final String lable;
  final String hinttext;
  final TextEditingController controllerA;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllerA,
      validator: (value) {
        dev.log('value: $value');
        if (value == null || value.isEmpty) {
          return returnedValue;
        }
        return null;
      },
      decoration: InputDecoration(
        label: Text(lable),
        hintText: hinttext,
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
    );
  }
}

class Text_part extends StatelessWidget {
  const Text_part({
    required this.text1,
  });
  final String text1;

  @override
  Widget build(BuildContext context) {
    return Text(
      text1,
      style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontFamily: 'times new roman'),
    );
  }
}
