import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_recepie/modal/home_modal.dart';
import 'package:food_recepie/view/child_page.dart';
import 'package:food_recepie/view/foodImage.dart';
import 'package:food_recepie/view/help.dart';
import 'package:food_recepie/view/homepage.dart';
import 'package:food_recepie/view/login.dart';
import 'package:food_recepie/view/parent_page.dart';
import 'package:food_recepie/view/setting.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  



    @override
  Widget build(BuildContext context) {
        List<HomeModal> homeModal = [
  HomeModal(
    image: "assets/kisspng_chicken_tikka.png",
    title: "Cheese Bun Healthy Recipe",
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => FoodImage()));
    }
  ),
  HomeModal(
    image: "assets/image_2.png",
    title: "All Healthy Recipes",
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  ),
  HomeModal(
    image: "assets/image_1.png",
    title: "Child Healthy Recipes",
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));
    }
  ),
  HomeModal(
    image: "assets/chef_3.png",
    title: "Main Course Food Recipes",
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ThirdPage()));
    }
  ),
];
    List<Color> cardColors = [
      const Color.fromARGB(255, 153, 203, 243),
      const Color.fromARGB(255, 245, 175, 175),
      const Color.fromARGB(255, 190, 241, 192),
      const Color.fromARGB(255, 241, 209, 160),
      const Color.fromARGB(255, 231, 182, 240),
    ];


    return Scaffold(
      appBar: AppBar(
        actions:[ IconButton(
            onPressed: () async {
              SharedPreferences clear = await SharedPreferences.getInstance();

              clear.clear();
              setState(() {});

              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            icon: Icon(Icons.logout_outlined,color:Colors.black,
            )),
        ],
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 244, 180, 180)),
        backgroundColor: Color.fromARGB(255, 240, 170, 114),
        
        title: Text(
          'Home Page',
          style: TextStyle(
            
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),  
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: Container(
            decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade100,
              Colors.blueGrey.shade100,
            ],
          ),
        ),
          
          child: Column(
            children: [
            Container(
              color: Colors.transparent,
              child: DrawerHeader(
                
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                child: Padding(padding: 
                EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(padding: 
                    EdgeInsets.all(8.0),
                    // child: CircleAvatar(
                    //   radius:40 ,
                    //   backgroundImage: AssetImage("assets\chef_3.png"),
                    // ),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage("assets/chef3.jpg"))

                        
                      ),
                    ),
                    ),
                    Padding(padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text("Harshal ",style: TextStyle(color: Colors.black,fontSize: 20),),
                                                      SizedBox(
                                height: 10,
                              ),
                              Text(
                                "hj90300@gmail.com",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "9545276793",
                                style: TextStyle(color: Colors.black),
                              )

                      ],
                    )
                    )
                  ],
                ),
                ),
              ),
            ),

       SizedBox(
        height: 10,
       ),

                     Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.settings),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SettingPage()));
                        },
                        child: Text(
                          "App Settings",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.account_balance),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SettingPage()));
                        },
                        child: Text(
                          "Account",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.settings),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => HelpPage()));
                        },
                        child: Text(
                          "Help",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ))
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text(
                    "Log Out",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 226, 42, 42),
                    ),
                  )),



            ],

            
          ),
        ),
      ),
      body:
      
        
       Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade100,
              Colors.blueGrey.shade100,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.8,
            ),
            itemCount: homeModal.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  homeModal[index].onTap();
                },
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: cardColors[index % cardColors.length],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        homeModal[index].image,
                        width: double.infinity,
                        height: 150,
                      ),
                      SizedBox(height: 10),
                      Text(
                        homeModal[index].title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}