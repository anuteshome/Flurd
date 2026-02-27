import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final String text;
  final Function()? onTap;
  const MyButton({super.key,required this.onTap,required this.text});

  @override
  State<MyButton> createState() => _ButtonState();
}

class _ButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.all(25),
        margin:EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20)
        ),
       child: Text(widget.text,style: TextStyle(
color: Colors.white
       ),),
      ),
    );
  }
}