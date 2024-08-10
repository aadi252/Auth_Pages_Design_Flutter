import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'OTPVerification.dart';

class MobileNo extends StatefulWidget {
  const MobileNo({super.key});

  @override
  _MobileNoState createState() => _MobileNoState();
}

class _MobileNoState extends State<MobileNo> {
  String? phoneNumber;
  final FocusNode phoneFieldFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Unfocus the field when returning to the page
    WidgetsBinding.instance.addPostFrameCallback((_) {
      phoneFieldFocusNode.unfocus();
    });
  }

  @override
  void dispose() {
    phoneFieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        backgroundColor: Colors.white, // Ensure the AppBar background is white
        foregroundColor: Colors.black, // Ensure the icon color is black
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
          children: [
            SizedBox(height: 20),
            Image.asset(
              'assets/number.jpg', // Replace with your asset path
              height: 150,
              fit: BoxFit.cover, // Ensure the image covers the given height
            ),
            SizedBox(height: 40),
            Text(
              'Mobile Number',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center, // Center the text
            ),
            SizedBox(height: 10),
            Text(
              'We will send you a One Time Password\non this mobile number',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 40),
            IntlPhoneField(
              focusNode: phoneFieldFocusNode, // Set the focus node
              decoration: InputDecoration(
                labelText: 'Enter your phone number',
                labelStyle: TextStyle(
                  color: Colors.black, // Color of the label
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
              initialCountryCode: 'IN',
              onChanged: (phone) {
                setState(() {
                  phoneNumber = phone.completeNumber;
                });
              },
            ),
            SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (phoneNumber != null) {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return OTPVerificationScreen(phoneNumber: phoneNumber!);
                        },
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1.0, 0.0); // Slide in from right
                          const end = Offset.zero;
                          const curve = Curves.easeInOut;
                          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                          var offsetAnimation = animation.drive(tween);
                          return SlideTransition(position: offsetAnimation, child: child);
                        },
                      ),
                    ).then((_) {
                      // Unfocus the field when coming back from OTP page
                      phoneFieldFocusNode.unfocus();
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6C63FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  'GET OTP',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
