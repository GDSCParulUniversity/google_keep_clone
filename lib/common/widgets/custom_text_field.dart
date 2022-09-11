import 'package:flutter/material.dart';
import 'package:google_keep_clone/common/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController inputController;
  final String label;
  final bool isObscureText;
  const CustomTextField(
      {Key? key,
      required this.inputController,
      required this.label,
      this.isObscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: inputController,
      onChanged: (value) {
        //Do something wi
      },
      keyboardType: TextInputType.emailAddress,
      obscureText: isObscureText,
      cursorColor: Color.fromRGBO(248, 190, 40, 0.7),
      style: TextStyle(fontSize: 14, color: white.withOpacity(0.8)),
      decoration: InputDecoration(
        // prefixIcon: Icon(Icons.email),
        filled: true,

        fillColor: Color(0xff040404).withOpacity(0.5),
        hintText: 'Enter your ${label.toLowerCase()}',
        hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(248, 190, 40, 0.7),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(248, 190, 40, 0.7),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
