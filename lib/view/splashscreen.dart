import 'package:flutter/material.dart';
import 'package:food_recepie/view/foodImage.dart';
import 'package:food_recepie/view/homePage2.dart';
import 'package:food_recepie/view/login.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FlashScreen extends StatefulWidget {
  const FlashScreen({super.key});

  @override
  State<FlashScreen> createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {
  String? userName;
  void getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    userName = prefs.getString("username");

    setState(() {});
  }

  @override
  void initState() {
    getUserName();
    Future.delayed(const Duration(seconds: 6), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  HomePage2()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        color: Colors.black,
        child: Center(
          child:Lottie.asset("assets/food2.json"),
          
      
      
        ),
      ),
        // body: Column(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        
        //   Image.asset("assets/hardik.jpg"),
        //   const Text("recepies",
        //       style: TextStyle(
        //         fontSize: 25,
        //         fontWeight: FontWeight.bold,
        //       )),
        //   const Padding(
        //       padding: EdgeInsets.all(8.0),
        //       child: Text(
        //         "Food Recepies",
        //         style: TextStyle(
        //           fontSize: 25,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       )),
        // ])
        );
  }
}


