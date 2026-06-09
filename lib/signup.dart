import 'package:flutter/material.dart';
import 'package:login_screens/login.dart';

class Signup extends StatefulWidget {
 

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
 TextEditingController unamec=TextEditingController();

 TextEditingController emailc=TextEditingController();

 TextEditingController Passwordc=TextEditingController();

 TextEditingController Conpassc=TextEditingController();

 bool visible = true;

 final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formkey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                SizedBox(height: 35),
                Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  "Create an Account, It's Free",
                  style: TextStyle(color: Colors.grey),
                ),
        
                SizedBox(height: 40),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Username",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 124, 123, 123),
                    ),
                  ),
                ),
                TextFormField( validator: (value) {
                  if(value == null || value.isEmpty){
                    return "Username is Required";
                };
                },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Email",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 124, 123, 123),
                    ),
                  ),
                ),
                TextFormField(validator: (value) {
                  if(value == null || value.isEmpty){
                    return "Email is Required";
                  }
                  if(!(value.contains("@") && value.contains("."))){
                    return "Enter a valid Mail ";
                  }
                  return null;
                },
                  controller:  emailc,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Password",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 124, 123, 123),
                    ),
                  ),
                ),
                TextFormField(validator: (value) {
                   if(value == null || value.isEmpty){
                    return "Password is Required";
                }
                if(value.length!=8){
                  return "password must be 8 characters";
                }



                },
                  obscureText: visible,
                  controller: Passwordc,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: IconButton(onPressed: (){
                      setState(() {
                        visible =! visible;       
                      });
                    }
                    , icon: visible?
                          Icon(Icons.visibility_off):Icon(Icons.visibility))
                  ),
                ),
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Confirm Password",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 124, 123, 123),
                    ),
                  ),
                ),
                TextFormField(validator: (value) {
                  if(value == null || value.isEmpty){
                    return "Password is Required";
                }
                 if(value.length!=8){
                  return "password must be 8 characters";
                }
                if(value!=  Passwordc.text){
                  return "Password is not matched";
                }
  
                },
                  obscureText: visible,
                  controller: Conpassc,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: IconButton(onPressed:(){
                    setState((   
                    ) {
                      visible =! visible;
                    }
        
                      
                    ); }, icon: visible? Icon(Icons.visibility_off):Icon(Icons.visibility),
                  ),
                ),
                ),
        
                SizedBox(height: 30),
                SizedBox(
                  height: 60,
                  width: 400,
                  child: ElevatedButton(
                    onPressed: () {
                      if(formkey.currentState!.validate()){
                        print("save");
                      }
                    },
                    child: Text("Sign Up", style: TextStyle(fontSize: 20)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 109, 4, 113),
                      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: BorderSide(
                          color: const Color.fromARGB(255, 121, 118, 118),
                        ),
                      ),
                    ),
                  ),
                ),
        
        
                SizedBox(height: 20,),
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already Have an Account?"),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: Text(" Login",style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
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
