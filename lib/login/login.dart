// ignore: unused_import
import 'package:e_katalog/crud/home.dart';
import 'package:flutter/material.dart';
import 'package:e_katalog/login/view.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Image.network(
                ('https://alisatia.000webhostapp.com/assets/login.png'),
                width: 150,
              ),

              const SizedBox(height: 15),
              const Text(
                'LOGIN',
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 35,
                  fontWeight: FontWeight.bold
                ),
              ),

              const SizedBox(height: 75),
              textFieldView(
                controller: usernameController,
                hintText: 'username',
                obscureText: false,
              ),

              const SizedBox(height: 10),
              textFieldView(
                controller: passwordController,
                hintText: 'password',
                obscureText: true,
              ),

              const SizedBox(height: 40),
              buttonView(
                onTap: () {
                  Navigator.pushNamed(context, "/home");
                },
              ),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.lightBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/signin");
                      },
                    ), 
                  ],
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

// void submitLogin() async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
// 	final String? email = prefs.getString('email');
// 	final String? password = prefs.getString('password');
  
//   if (usernameController.text == email && passwordController.txt == password) {
//     prefs.setBool('isLogin', true);
// 	  Navigator.pushReplacement(
//       context,
// 		  MaterialPageRoute(builder: ((context) => HomePage()))
//     );
//   } else {
// 	  const snackBar = SnackBar(
// 	    duration: Duration(seconds: 5),
// 	    content: Text("Username or Password is wrong"),
// 	    backgroundColor: Colors.red,
// 	  );
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
// 	    return;
//     }
// }