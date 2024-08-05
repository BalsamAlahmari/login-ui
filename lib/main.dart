import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 10, 25, 113)),
        useMaterial3: true,
      ),
      home: const myHomePage(),
    );
  }
}

bool isScured = true;

Map<String,user> users = {"Alaa@gmail.com": user(email:'Alaa@gmail.com',pssword: '36869h2'),
  "balsamkhaled@gmail.com":user(email:'balsamkhaled@gmail.com',pssword:'1234567A')};


class myHomePage extends StatefulWidget {
  const myHomePage({super.key});

  @override
  State<myHomePage> createState() => _myHomePageState();
}

class _myHomePageState extends State<myHomePage> {

  TextEditingController emailController= TextEditingController();
  TextEditingController passController= TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 10, 25, 113),
        centerTitle: true,
        title: Text(
          "Login Page",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/login.png',
              width: 350,
              height: 350,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        label: Text('Enter Email'),
                        prefixIcon: Icon(Icons.person, color: Colors.black),
                        border: OutlineInputBorder(borderSide: BorderSide())),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: passController,
                    obscureText: isScured,
                    decoration: InputDecoration(
                      label: Text('Enter Password'),
                      prefixIcon: Icon(Icons.lock, color: Colors.black),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isScured = !isScured;
                          });
                        },
                        icon: Icon(Icons.remove_red_eye),
                      ),
                      border: OutlineInputBorder(borderSide: BorderSide()),
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                       user user1=users[emailController.text]!;

                       if(user1.email==emailController.text&&user1.pssword==passController.text ){
                        print('logged');
                       } else{
                        print('email or password is wrong ');
                       }
                       
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color:Color.fromARGB(255, 10, 25, 113)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Login',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          SizedBox(width: 10),
                          Icon(
                            Icons.login,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

