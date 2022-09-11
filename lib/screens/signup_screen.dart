import 'package:flutter/material.dart';

import '../common/constants/colors.dart';
import '../common/widgets/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.08,
            ),
            Center(
              child: Image.asset(
                'assets/google-keep.png',
                height: height * 0.1,
              ),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            SizedBox(
              width: width * 0.7,
              child: Text(
                'Welcome to \nGoogle Keep Clone',
                style: TextStyle(
                  color: white.withOpacity(0.7),
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            CustomTextField(
              inputController: TextEditingController(),
              label: 'Name',
            ),
            SizedBox(
              height: height * 0.02,
            ),
            CustomTextField(
              inputController: TextEditingController(),
              label: 'Email',
            ),
            SizedBox(
              height: height * 0.02,
            ),
            CustomTextField(
              inputController: TextEditingController(),
              label: 'Password',
              isObscureText: true,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromRGBO(248, 190, 40, 1),
                    minimumSize: Size(width * 0.38, height * 0.045)),
                child: Text('Signup'),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
