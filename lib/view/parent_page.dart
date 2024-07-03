import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_recepie/modal/parent_modal.dart';
import 'package:food_recepie/view/homePage2.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
    List <Parent>? getParents;
    void getParentHealthy()async{
      try{
        var getParent=await http.get(Uri.parse("https://mapi.trycatchtech.com/v3/healthy_recipes/healthy_recipes_parent_category_list"));
        if (getParent.statusCode==200){
          getParents=Parent.getParent(jsonDecode(getParent.body));
          setState(() {
            
          });
        }
      }catch(e){

      }

    }
       

  @override
  void initState(){
    getParentHealthy();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return  Container(
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
            
            actions: [
              PopupMenuButton(itemBuilder: (context)=>[
                PopupMenuItem(child: 
                Row(
                  children: [
                    IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage2()));
                    }, icon: Icon(Icons.home)),
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
            backgroundColor:Colors.white10,
                    title: Row(
                      
              children: [
                Icon(Icons.restaurant),
                SizedBox(width:10),
            Text("Food Recepie ",style: TextStyle(color: Colors.black
            ),),
            
              ]
           ),
           centerTitle: true
           ,
           ),
           
           body:
           
           
            getParents==null?
           Center(
            child:Lottie.asset("assets/LOADING.json")
           
           ):
           Padding(padding:EdgeInsets.all(15),
           child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
           
           ), 
           itemCount: getParents!.length,
           itemBuilder:(context,index ){
      
            return Container(
            
              decoration: BoxDecoration(
              
                border: Border.all(color: Colors.black,style:BorderStyle.solid),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: NetworkImage(getParents![index].catImage??'',
                
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
                  child: Text(getParents![index].catName!,style:TextStyle(color: Color.fromARGB(123, 1, 1, 8),fontSize: 20,fontWeight: FontWeight.w600)),
                 ),
               ),
            );
           }
            )
      
      )
      ),
    );
  }
}