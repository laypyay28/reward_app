import 'package:flutter/material.dart';
import 'package:royalty/home.dart';
import 'package:royalty/login.dart';
import 'database_helper.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Welcome"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Sign up',
              style: TextStyle(
                fontSize: 35,
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Create an account. It's free",
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
                  SizedBox(height: 17),
                  TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _obscureText, // Toggle based on the variable
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
                  SizedBox(height: 17),
                  TextFormField(
                    controller: _confirmPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _obscureText, // Toggle based on the variable
  decoration: InputDecoration(
    labelText: "Confirm your Password",
    hintText: "Confirm your Password",
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
                      return value!.isEmpty ? "Please Confirm your password" : null;
                    },
                  ),
                  SizedBox(height: 17),
                  MaterialButton(
                    minWidth: 300,
                    height: 60,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        if (_passwordController.text == _confirmPasswordController.text) {
                          String email = _emailController.text;
                          String password = _passwordController.text;

                          int id = await DatabaseHelper.instance.insertUser({
                            'email': email,
                            'password': password,
                          });

                          if (id != 0) {
                            // Navigate to MainPage with user info
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainPage(
                                  userName: email, // You can pass email or name here
                                  userEmail: email,
                                ),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Error creating account')),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Passwords do not match')),
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
                      "Sign up",
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
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => loginpage()),
                          );
                        },
                        child: Text(
                          "Already have an account",
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
