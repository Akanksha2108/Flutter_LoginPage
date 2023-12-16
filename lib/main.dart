import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:akfirst/pages/loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyRoutes {
  static String Homeroute = "/home";
  static String login = "/";
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.login,
      routes: {
        MyRoutes.Homeroute: (context) => Home(),
        MyRoutes.login: (context) => Login(),
      },
    );
  }
}

// ignore: must_be_immutable
class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
 
  bool isloading = false;
  final _form = GlobalKey<FormState>();

  MoveToHome(BuildContext context) async {
    if (_form.currentState?.validate() == true) {
      setState(() {
        isloading = true;
      });
      await Future.delayed(Duration(seconds: 2));
      Navigator.pushNamed(context, MyRoutes.Homeroute);
      setState(() {
        isloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
          child: Form(
            
              key: _form,
              child: Column(children: [
                Image.asset("assets/images/login.png").h48(context).p8(),
                "Welcome To Ak"
                    .text
                    .xl5
                    .fontFamily("mainfont")
                    .bold
                    .color(Colors.deepPurple)
                    .make(),

                Padding(padding: EdgeInsets.all(15)),

                Column(

                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text(" Username", style: TextStyle(fontFamily: "mainfont"),),
                        hintText: "Username", hintStyle: TextStyle(fontFamily: "mainfont"),
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Username cannot be empty";
                        }
                        return null;
                      },
                    ).px32(),

                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        label: Text("Password", style: TextStyle(fontFamily: "mainfont")),
                        hintText: "Password", hintStyle: TextStyle(fontFamily: "mainfont"),
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Password cannot be empty ";
                        } else if ((value?.length ?? 0) < 8||(value?.length ?? 0) > 8) {
                          return "Password should be 8 digits ";
                        }
                        return null;
                      },
                    ).px32(),

                  ],

                ),
                InkWell(
                  onTap: () =>MoveToHome(context),
                  child: AnimatedContainer(
                    curve: Curves.bounceIn,
                   
                    duration: Duration(seconds: 10),
                    child: Container(
                      color: Colors.deepPurple,
                      width:200, height: 50,
                      child: 
                      isloading ? 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircularProgressIndicator(color: Colors.white,),
                          " Please wait .. ".text.bold. xl.fontFamily("mainfont"). color(Colors.white).
                           makeCentered(),
                        ],
                      )
                      : " Login ". text. bold. xl. fontFamily("mainfont").color(Colors.white).
                      makeCentered()
                    
                      ),
                    ),
                ).p24() 
              ]
           )
        )
      ),
    );
  }
}

