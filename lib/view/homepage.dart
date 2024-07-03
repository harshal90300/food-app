import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_recepie/modal/recipie_modal.dart';
import 'package:food_recepie/view/homePage2.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<AllCategories>? _getKhana;
BabaKaDhaba ?dhaba ;
  Future<void> _getKhanaHealthy() async {
    try {
      var response = await http.get(Uri.parse(
          "https://mapi.trycatchtech.com/v3/healthy_recipes/healthy_recipes_all_data"));
      if (response.statusCode == 200) {
        
        dhaba = BabaKaDhaba.fromJson(jsonDecode(response.body));

_getKhana = List<AllCategories>.from(dhaba!.allCategories!);
        
        setState(() {
       
        });
      } else {
        throw Exception('Failed0 to load data');
      }
    } catch (
      e) {
      print('Error: $e');
    
    }
  }

  @override
  void initState() {
    _getKhanaHealthy();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
                    decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 245, 192, 194),
              Color.fromARGB(255, 150, 202, 206),
            ],
            stops: [0.5, 0.7],
          ),
        ),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar( 
               title: Row(
                 children: [
                  Icon(Icons.restaurant,color:Color.fromARGB(255, 250, 49, 49) ),
                   Text(' Menu List',style:TextStyle(fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 250, 49, 49)) ,),
                 ],
               ),
               actions: [
                              PopupMenuButton(itemBuilder: (context)=>[
                            
                      
                PopupMenuItem(child: 
                Row(
                  children: [
                    IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage2()));
                    }, icon: Icon(Icons.home,size: 22,),
                  
                    ),
                    
                    Text("Home",style: TextStyle(color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),),

                  ],
                )
                ),
                                            PopupMenuItem(child: 
                            Row(
                              children: [
                                IconButton(onPressed: (){}, icon: Icon(Icons.help,)),
                                Text("Help",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w500),)
                              ],
                            )
                            )
              ],
              )
               ],
          backgroundColor: Colors.white,
        ),
      
        
      
        body: _getKhana==null
            ? Center(
                child:Lottie.asset("assets/LOADING.json"),
              )
      
            : Padding(
              padding: const EdgeInsets.all(16.0),
              
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemCount: _getKhana!.length,
                  itemBuilder: (context, index) {
                  
                    return Container(
              
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12,),
                      
                        borderRadius: BorderRadius.circular(12),
                         image: DecorationImage(
                                fit: BoxFit.fill,
                                image:NetworkImage(_getKhana![index].catImage??'') )
                      ),
              
                      child:  Container(
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black54
                          , ),
                          
                        ),
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 48,
                          color: const Color.fromARGB(255, 250, 120, 111),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(_getKhana![index].catName!,style:const  TextStyle(
                              color:Colors.white,
                              fontSize: 19
                            ),
                                                ),
                          ),
                        ),
                      ),
                    );
                      
                        
                      
                }),
            )
            ),
    );
             
  }}