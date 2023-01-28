import 'package:flutter/material.dart';
import 'package:e_katalog/login/view.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final emailnameController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

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
                ('https://alisatia.000webhostapp.com/assets/signin.png'),
                width: 150,
              ),

              const SizedBox(height: 15),
              const Text(
                'SIGNIN',
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 35,
                  fontWeight: FontWeight.bold
                ),
              ),

              const SizedBox(height: 75),
              textFieldView(
                controller: emailnameController,
                hintText: 'email',
                obscureText: false,
              ),

              const SizedBox(height: 10),
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
              buttonViewSign(
                onTap: () {
                  Navigator.pushNamed(context, "/login");
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
                        'Login',
                        style: TextStyle(
                          color: Colors.lightBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/login");
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
