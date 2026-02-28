import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flurd/Component/Button.dart';
import 'package:flurd/pages/home_page.dart';


class Loginpage extends StatefulWidget {
  final Function()? onTap;
const Loginpage({super.key ,required this.onTap});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {

  // void TaskSign() async{
// await FirebaseAuth.instance.signInWithEmailAndPassword(
//     email: usernameController.text.trim(),
//     password: passwordController.text.trim(),
//   ); 
void TaskSign() async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
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
     Text("Welcome!",style: TextStyle(fontSize: 24),),
    TextField(
      controller: usernameController,
    ),
    TextField(
      controller:passwordController,
    ),
    SizedBox(height: 15,),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: (){},
            child: Text("Forget Password",
            style: TextStyle()),
            ),
        ],
      ),
    ),

MyButton(
  onTap: TaskSign,
  text: "Signin",
),

Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text("If you are new "),
    SizedBox(width: 5,),
    GestureDetector(
      onTap: widget.onTap,
      child: Text("Register now",style: TextStyle(color: Colors.blue[700],fontWeight: FontWeight.bold),),
    ),
  ],
)
      ],
    ),
      ),
    );
  }
}