import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_recepie/modal/food_modal.dart';
import 'package:food_recepie/view/homePage2.dart';

import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class FoodImage extends StatefulWidget {
  const FoodImage({super.key});

  @override
  State<FoodImage> createState() => _FoodImageState();
}

class _FoodImageState extends State<FoodImage> {
  List <Foodimage>?getImages;
  void getImagehealthy()async{
    try{
      var getImage= await http.get(Uri.parse("https://mapi.trycatchtech.com/v3/healthy_recipes/healthy_recipes_post_list?category_id=5"));
      if (getImage.statusCode==200){
        getImages=Foodimage.getImage(jsonDecode(getImage.body));
        setState(() {
          
        });
      }
    }catch(e){

    }
  }
  
  @override
  void initState(){
    getImagehealthy();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
  
    title: Row(
      children: [
         Icon(Icons.restaurant),
         SizedBox(width: 10,),
        Text("Chesse Hotdog"),

      ],
    ),
    
    backgroundColor: Colors.white,
    centerTitle: true,
    elevation: 3,
     
   ),
   body:
           Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
                          colors: [
              Color.fromARGB(255, 113, 234, 236),
              Color.fromARGB(255, 226, 214, 224),
            ],
            ),
        ),
   
   child:  getImages==null
   ?Center(
    child:Lottie.asset("assets/LOADING.json"),
   ):GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 1,
    mainAxisSpacing: 10,
    crossAxisSpacing: 10), 
   itemCount: getImages!.length,
   itemBuilder:(context,i){
   return SingleChildScrollView(
    scrollDirection: Axis.vertical,
     child: Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        title:  Image.network(getImages![i].images ??'',
      fit: BoxFit.cover,
        ),
        
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            SizedBox(height:10),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Center(
                 child: Container(
                      decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Color.fromARGB(255, 138, 89, 15),
                            Color.fromARGB(255, 247, 217, 161)
                 
                 ]),                        borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black)
                        ),
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text(
                        ' Calories: -   ${getImages![i].calories??''}',style: TextStyle(
                      fontWeight: FontWeight.bold
                               ),),
                   ),
                 ),
               ),
             ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(

    decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.blueGrey,
                          const Color.fromARGB(255, 149, 195, 233)

]),                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black)
                      ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                        'Ingredients:-  ${getImages![i].ingredients??''}',style: TextStyle(
                    fontWeight: FontWeight.bold)
                  ),
                ),
              ),
            ),
        
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                              decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.blueGrey,
                          const Color.fromARGB(255, 149, 195, 233)

]),                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black)
                      ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Method:- ${getImages![i].methods??''}',style: TextStyle(
                                        fontWeight: FontWeight.bold
                                      ),),
                          ),
                        ),
                      ),
          ],
        ),
        
      ),
     
     ),
   );

   } )
   )
    );
  
  }
}