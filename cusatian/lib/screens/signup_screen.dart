import 'package:flutter/material.dart';
import 'signin_screen.dart'; // Import the signin screen

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // Controllers to capture email, username, and password input
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController(); // New controller for username
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
              20, MediaQuery.of(context).size.height * 0.25, 20, 0), // Adjusted top padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Signup',
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

                // Username Input Box
                TextField(
                  controller: usernameController, // Added username controller
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Enter your username",
                    prefixIcon: const Icon(Icons.person),
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

                // Signup Button
                ElevatedButton(
                  onPressed: () {
                    // Logic to handle signup when button is pressed
                    String email = emailController.text;
                    String username = usernameController.text; // Capture username
                    String password = passwordController.text;
                    // You can add validation or signup logic here
                    print("Email: $email, Username: $username, Password: $password");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 176, 84, 31), // Button background color
                    minimumSize: const Size(double.infinity, 50), // Make button stretch across screen width
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Rounded corners
                    ),
                  ),
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      color: Colors.white, // Text color
                      fontWeight: FontWeight.bold, // Bold text
                      fontSize: 18, // Font size
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Spacing between the signup button and signin text

                // Signin Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        // Navigate to signin page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SigninScreen()),
                        );
                      },
                      child: const Text(
                        "Sign in",
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
