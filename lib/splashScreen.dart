import 'package:animater/Click.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
   Future.delayed(Duration(seconds: 15),(){
     Navigator.of(context).push(MaterialPageRoute(builder: (context) => Click()));
   });
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuVaWPsrGLBWj90VSHCVZIQRvwNhLXwfbyRwfr6XElulpKFZZxe8Xc36DaDdBPHDkIX78&usqp=CAU'),
          fit: BoxFit.fill,),
      )
    );
  }
}
