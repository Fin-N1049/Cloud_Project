import 'package:flutter/material.dart';
import 'signup_screen.dart'; // Import the signup screen
import 'home_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  // Controllers to capture email and password input
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, // Ensure the container fills the screen width
        height: double.infinity, // Ensure the container fills the screen height
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 255, 255), // White color
              Color.fromARGB(255, 255, 255, 255),  // White color
            ],
            begin: Alignment.topLeft,   // Start the gradient from the top left
            end: Alignment.bottomRight, // End the gradient at the bottom right
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.3, 20, 0), // Increased padding to shift content downwards
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Signin',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFEC7063),
                  ),
                ),
                const SizedBox(height: 40), // Spacing between heading and input fields
                
                // Email Input Box
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Enter your email",
                    prefixIcon: const Icon(Icons.email),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 176, 84, 31), // Custom border color
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 176, 84, 31), // Border color when focused
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Spacing between input fields

                // Password Input Box
                TextField(
                  controller: passwordController,
                  obscureText: true, // Masking the password input
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    prefixIcon: const Icon(Icons.lock),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 176, 84, 31), // Custom border color
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 176, 84, 31), // Border color when focused
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 40), // Spacing between input fields and button

                // Signin Button
                ElevatedButton(
                  onPressed: () {
                    // Logic to handle signin when button is pressed
                    String email = emailController.text;
                    String password = passwordController.text;
                    // You can add validation or signin logic here
                    print("Email: $email, Password: $password");
                    Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HomeScreen()),
                        );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 176, 84, 31), // Button background color
                    minimumSize: const Size(double.infinity, 50), // Make button stretch across screen width
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Rounded corners
                    ),
                  ),
                  child: const Text(
                    'Signin',
                    style: TextStyle(
                      color: Colors.white, // Text color
                      fontWeight: FontWeight.bold, // Bold text
                      fontSize: 18, // Font size
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Spacing between the signin button and register text

                // Register Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("New to app?"),
                    TextButton(
                      onPressed: () {
                        // Navigate to signup page when pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignupScreen()),
                        );
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          color: Color.fromARGB(255, 176, 84, 31),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
