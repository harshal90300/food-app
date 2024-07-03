import 'package:flutter/material.dart';
import 'package:food_recepie/view/auth.dart';
import 'package:food_recepie/view/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _username = TextEditingController();
    bool isSignUp= false;
    

    void _login () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String username= _emailController.text;
      String password = _passwordController.text;
       
       if (username.isNotEmpty && password. isNotEmpty) {
        await prefs.setString ('username',username);
        await prefs.setString ('password',password);
       

       }else {
        showDialog(context: context, builder:(BuildContext context){
          return AlertDialog(
            title: Text("Error"),
            content: Text("Please enter your valid credentials"),
            actions: [
              TextButton(onPressed: (){
                Navigator.of (context).pop();
              }, child: Text("OK"))
            ],
          );
        }
        
        );
       }

    }
    void SignUp()async{
      await AuthService().registration (
        email :_emailController.text,password:  _passwordController.text);
        setState(() {
          
        });

      void login ()async{
        await AuthService().login(
          email:_emailController.text,password: _passwordController.text);
          setState(() {
            
          });
        
      }
    }


  @override
  Widget build(BuildContext context) {
    return  Container(
      
      decoration: BoxDecoration(
        
        image: DecorationImage(image: AssetImage("assets/download (1).jpg",
        
        
        
        
        ),fit: BoxFit.fill
        )
      ),
      child: Scaffold(
             backgroundColor: Colors.transparent,
             
             
              bottomNavigationBar: BottomAppBar(
          height: 50,
          color:  Color.fromARGB(141, 255, 255, 255),
          child: GestureDetector(
              onTap: () {
                isSignUp = !isSignUp;
                _emailController.clear();
                _passwordController.clear();
                _username.clear();
                setState(() {});
              },
              child: isSignUp
                  ? const Text(
                      "Already an user ? ",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black54),
                    )
                  : const Text("Create User",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black54))),
        ),
        appBar: AppBar(
          centerTitle: true,
          elevation: 2,
          title: Text(isSignUp ? 'Sing Up' : 'Login Page'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                CircleAvatar(
                  backgroundImage: AssetImage("assets/harshal.png"),
                   radius: 60,
                ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 80,top: 26),
                //   child: CircleAvatar(
                //     radius: 50,
                //    backgroundImage: AssetImage("assets/harshal2.png",
                //      ),
                //   ),
                // ),
                
                 SizedBox(
                  height: 10,
                ),
                isSignUp
                    ? TextField(
                         style: const TextStyle(fontWeight: FontWeight.bold),
                        controller: _username,
                       cursorColor: Colors.black,                      
                         decoration: const InputDecoration(
                          fillColor: Color.fromARGB(255, 245, 248, 245),
                          filled: true,
                            labelText: 'User Name',
                            labelStyle: TextStyle(color: Colors.black),
                            suffixIcon: Icon(Icons.person,color: Colors.black54,)),
                      )
                    : const Offstage(),
                    SizedBox( height: 15,),
                TextField(
                  style: const TextStyle(fontWeight: FontWeight.bold),
                 cursorColor: Colors.black,
                  controller: _emailController,
                  
                  decoration: const InputDecoration(
                       fillColor:Color.fromARGB(255, 245, 248, 245),
                       filled: true,
                      labelText: 'Email', 
                      labelStyle: TextStyle(color: Colors.black),
                      suffixIcon: Icon(Icons.mail,color:Colors.black54,)),
                ),
                   SizedBox(
                    height: 15,
                   ),
                TextField(
                  style: const TextStyle(fontWeight: FontWeight.bold),
                   cursorColor: Colors.black,
                  controller: _passwordController,
                  decoration: InputDecoration(
                  fillColor:Color.fromARGB(255, 229, 250, 230),
                  filled: true,
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.black),
                      suffixIcon: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.password,color: Colors.black54,))),
                  obscureText: true,
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      
                    ),
                    backgroundColor:Color.fromARGB(255, 110, 241, 112),
                    minimumSize: Size(200,40),
                    fixedSize: Size(200, 40)
                  ),
                  onPressed: !isSignUp
                      ? () async {
                          final message = await AuthService().login(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                          if (message!.contains('Success')) {
                            _login();
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>  FlashScreen()));
                          }
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(message),
                            ),
                          );
                        }
                      : () async {
                          final message = await AuthService().registration(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                          if (message!.contains('Success')) {
                            _login();
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const FlashScreen()));
                          }
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(message),
                            ),
                          );
                        },
                  child: Text(
                    isSignUp ? 'Sign Up' : 'Login',
                    style: const TextStyle(color: Color.fromARGB(210, 24, 24, 23),
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      
      ),
    );
  }
}