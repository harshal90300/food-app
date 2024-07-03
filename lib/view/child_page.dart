import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_recepie/modal/child_modal.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
    List<Food1>? _getFood;
    Future<void> _getFoodHealthy() async {
    try {
      var response = await http.get(Uri.parse(
          "https://mapi.trycatchtech.com/v3/healthy_recipes/healthy_recipes_child_category_list?parent_id=1"));
      if (response.statusCode == 200) {
        setState(() {
          _getFood = Food1.getImage(jsonDecode(response.body));
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
    }
      @override
  void initState() {
    _getFoodHealthy();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(


            appBar: AppBar(
        title: Text('Healthy Recipes'),
      ),
      body:

            _getFood==null?
           Center(
            child:Lottie.asset("assets/LOADING.json",
            fit:BoxFit.fill)
           
           ):
           Padding(padding:EdgeInsets.all(15),
           child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
           
           ), 
           itemCount: _getFood!.length,
           itemBuilder:(context,index ){
      
            return Container(
            
              decoration: BoxDecoration(
              
                border: Border.all(color: Colors.black,style:BorderStyle.solid),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: NetworkImage(_getFood![index].catImg??'',
                
                ),
                              fit: BoxFit.fill)
              ),
      
               child: Container(
                alignment: Alignment.bottomCenter,
                 child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 45,
                               color: Color.fromARGB(255, 241, 205, 42),
                  child: Text(_getFood![index].catName!,style:TextStyle(color: Color.fromARGB(123, 1, 1, 8),fontSize: 20,fontWeight: FontWeight.w600)),
                 ),
               ),
            );
           }
            )
      
      )
    );
  }
}