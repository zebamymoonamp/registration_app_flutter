import 'package:flutter/material.dart';
import 'package:login_screens/login.dart';
import 'package:login_screens/service.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  TextEditingController emailc = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(key: formkey,
        child: Padding(

          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
    
              //SizedBox(height: 20),
              Text(
                "Forgot Password?",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
              ),

          
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
                  hintText: "Enter your Email",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.mail),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 40),

              SizedBox(
                height: 60,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      forgotp(emailc.text, context);
                    }
                  },
                  child: Text("Submit", style: TextStyle(fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(
                        color: const Color.fromARGB(255, 121, 118, 118),
                      ),
                    ),
                  ),
                ),
              ),
          
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: Text("<-- Back To Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
