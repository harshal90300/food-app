import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: 
      AppBar(
        title: Text("Help",style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),  
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12)
          ),
          
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("A food is something that provides nutrients. Nutrients are substances that provide: energy for activity, growth, and all functions of the body such as breathing, digesting food, and keeping warm; materials for the growth and repair of the body, and for keeping the immune system healthy."),
              )
            ],
          ),
        ),
      ),
    );
  }
}