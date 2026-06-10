import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screens/forgot.dart';
import 'package:login_screens/service.dart';
import 'package:login_screens/signup.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailc = TextEditingController();

  TextEditingController passwordc = TextEditingController();

  bool visible = true;
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    "Login",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Login to your Account",
                    style: GoogleFonts.montserrat(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 60),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Email",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 124, 123, 123),
                      ),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is Required";
                      }
                      if (!(value.contains("@") && value.contains("."))) {
                        return "Enter a valid Mail ";
                      }
                      return null;
                    },
                    controller: emailc,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Password",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 124, 123, 123),
                      ),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is Required";
                      }
                      if (value.length != 8) {
                        return "password must be 8 characters";
                      }
                      return null;
                    },
                    obscureText: visible,
                    controller: passwordc,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            visible = !visible;
                          });
                        },
                        icon: visible
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                    ),
                  ),

                  //SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Forgot()),
                      );
                    },
                    child: Align( alignment: AlignmentGeometry.bottomRight,
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),

                  SizedBox(height: 30,),
                  SizedBox(
                    height: 50,
                    width: 400,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          login(emailc.text, passwordc.text, context);
                        }
                      },

                      child: Text("Login", style: TextStyle(fontSize: 20)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 109, 4, 113),
                        foregroundColor: const Color.fromARGB(
                          255,
                          255,
                          255,
                          255,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: BorderSide(
                            color: const Color.fromARGB(255, 121, 118, 118),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Dont Have an Acoount?"),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Signup()),
                          );
                        },
                        child: Text(
                          " Sign Up",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),

                  Image.asset("assets/images1.jpg"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
