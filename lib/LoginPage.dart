import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'Authentication/MobileNO.dart'; // Ensure this is the correct import path
import 'Authentication/RegisterPage.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the padding for the top notch area
    final topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Column(
        children: [
          // Background Image and Overlay Text
          Stack(
            children: [
              ClipRect(
                child: Container(
                  height: 450 + topPadding, // Adjusted height for background image
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/mountain.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: topPadding),
                    child: Container(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: const [
                    SizedBox(height: 200),
                    Text(
                      "Let’s upgrade your learning experience",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Changing the way people learn by providing an interactive, engaging, and personalized learning.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30), // Reduced space
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(_createMobileNoPageRoute());
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Color(0xFFb7e778)), // Border color
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Continue with number",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20), // Increased space
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Or login with",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20), // Increased space
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSocialLoginButton('assets/google.png', 'Google'),
                const SizedBox(width: 20), // Increased space between buttons
                _buildSocialLoginButton('assets/facebook.png', 'Facebook'),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don’t have an account? ",
                  style: TextStyle(color: Colors.grey),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(_createRegisterPageRoute());
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  PageRouteBuilder _createMobileNoPageRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => MobileNo(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const offset = Offset(1.0, 0.0); // Slide from right to left
        var tween = Tween<Offset>(begin: offset, end: Offset.zero);
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
      transitionDuration: const Duration(milliseconds: 300), // Adjust duration as needed
    );
  }

  PageRouteBuilder _createRegisterPageRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => RegisterPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Slide from left to right
        const offset = Offset(-1.0, 0.0); // Start from left (-1.0) to right (0.0)
        var tween = Tween<Offset>(begin: offset, end: Offset.zero);
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
      transitionDuration: const Duration(milliseconds: 300), // Adjust duration as needed
    );
  }


  Widget _buildSocialLoginButton(String imagePath, String label) {
    return OutlinedButton(
      onPressed: () {
        // Handle social login action
      },
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.grey.shade300), // Border color
        minimumSize: const Size(120, 40), // Smaller button size
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.zero, // Remove padding for image alignment
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 20, // Adjusted size of image
            height: 20,
          ),
          const SizedBox(width: 8), // Space between image and label
          Text(
            label,
            style: const TextStyle(
              fontSize: 14, // Adjusted font size
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
