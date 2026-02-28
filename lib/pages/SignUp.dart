import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flurd/Component/Button.dart';
import 'package:flurd/pages/home_page.dart';


class Signup extends StatefulWidget {
  final Function()? onTap;
const Signup({super.key,required this.onTap});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  // void TaskSign() async{
// await FirebaseAuth.instance.signInWithEmailAndPassword(
//     email: usernameController.text.trim(),
//     password: passwordController.text.trim(),
//   ); 
void TaskSignup() async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: usernameController.text.trim(),
      password: passwordController.text.trim(),
    );

    // If login succeeds, go to HomePage
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(builder: (context) => Homepage()),
    // );

  } on FirebaseAuthException catch (e) {
    print("Firebase Error: ${e.code}");
  }
}
  // }

final TextEditingController usernameController =TextEditingController();
final TextEditingController passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // SizedBox(height: 50,),
  
     Icon(Icons.book,size: 100,),
     Text("Task Manager",style: TextStyle(fontSize: 16),),
     SizedBox(height: 25,),
     Text("Welcome Create an Account!",style: TextStyle(fontSize: 24),),
    TextField(
      controller: usernameController,
    ),
    TextField(
      controller:passwordController,
    ),
    SizedBox(height: 25,),
MyButton(
  onTap: TaskSignup,
  text: "Signup",
),
GestureDetector(
  onTap: widget.onTap,
  child: Text("Already have an account!",style: TextStyle(color: Colors.blue[700],fontWeight: FontWeight.bold),),
)
      ],
    ),
      ),
    );
  }
}