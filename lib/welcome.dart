import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screens/login.dart';
import 'package:login_screens/signup.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            Text(
              "Welcome",
              style: GoogleFonts.carroisGothic(
                color: Colors.black,
                fontSize: 50,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 20,),
            Image.asset("assets/images2.png",
            ),
            SizedBox(height: 80,
            ),

            SizedBox(
              height: 60,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                },
                child: Text("Login",style: TextStyle(fontSize: 20),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: const Color.fromARGB(255, 121, 118, 118)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: 60,
              width: 300,
              
              child: ElevatedButton(
                onPressed: () {
                  
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Signup(),),
                      );
                },
                child: Text("Sign Up",style: TextStyle(fontSize: 20),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                   shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
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
