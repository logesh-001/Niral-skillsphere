
import 'package:flutter/material.dart';
import 'package:skillsphere/pages/Bottomnavbar.dart';
import 'package:skillsphere/pages/Login.dart';
import 'package:skillsphere/pages/PhoneNumberScreen.dart';


class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isChecked =false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100,),
                Text(
                  'Sign up',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Enter your details below & free sign up",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 32),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Create Password',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Re-enter Password',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder:(context)=>PhoneNumberScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Color(0xFFFF3D40)
                  ),
                  child: Text('Create Account',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                      Checkbox(value: isChecked, onChanged: (bool?newValue){
                        setState((){
                          isChecked=!isChecked;
                        });
                      }),
                      TextButton(
                  onPressed: () {setState((){
                          isChecked=!isChecked;
                        });
                  },
                  child: Text("By creating an account you have to agree \n with our them & condication."),
                ),
                  ],
                ),
                // SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                  },
                  child: Text("Already Have an account? Login"),
                ),
              ],
            ),
          ),
        ),
      
    );
  }
}