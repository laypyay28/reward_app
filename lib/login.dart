import 'package:flutter/material.dart';
import 'package:royalty/home.dart';
import 'package:royalty/signup.dart';
import 'database_helper.dart';

class loginpage extends StatefulWidget {
  const loginpage({Key? key});
  

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<loginpage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Welcome Back"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Login',
              style: TextStyle(
                fontSize: 35,
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Login to your account",
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 100),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "Enter Email",
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                       if (value!.isEmpty) {
      return "Please enter Email";
    }
    // Regular expression for email validation
    String emailPattern =
        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regex = RegExp(emailPattern);
    if (!regex.hasMatch(value)) {
      return 'Enter valid email address';
    }
    return null;  // Return null if the input is valid
  },
                  ),
                  SizedBox(height: 20),
                  
                  TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _obscureText, 
                    decoration: InputDecoration(
    labelText: "Password",
    hintText: "Enter Password",
    prefixIcon: Icon(Icons.lock),
    suffixIcon: IconButton(
      icon: Icon(
        _obscureText ? Icons.visibility : Icons.visibility_off,
        color: Colors.grey,
      ),
      onPressed: () {
        setState(() {
          _obscureText = !_obscureText; // Toggle the boolean variable
        });
      },
    ),
    border: OutlineInputBorder(),
  ),
                    
                    validator: (value) {
                      return value!.isEmpty ? "Please enter Password" : null;
                    },
                  ),
                  SizedBox(height: 20),
                  MaterialButton(
                    minWidth: 300,
                    height: 60,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        String email = _emailController.text;
                        String password = _passwordController.text;

                        var user = await DatabaseHelper.instance.getUser(email, password);
                        if (user != null) {
                          String userName = user['name'] ?? ''; // Ensure 'name' is not null
                          String userEmail = user['email'] ?? ''; // Ensure 'email' is not null

                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainPage(
                                userName: userName,
                                userEmail: userEmail,
                              ),
                            ),
                            (Route<dynamic> route) => false, // Clear all routes on stack
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Invalid email or password')),
                          );
                        }
                      }
                    },
                    color: Colors.amber,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account."),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignupPage()),
                          );
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
