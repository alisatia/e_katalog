import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: const EdgeInsets.only(top: 50),
          padding: const EdgeInsets.all(40),
          child: Center(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                const CircleAvatar(
                  radius: 70.0,
                  backgroundImage:
                      NetworkImage("http://alisatia.000webhostapp.com/assets/profil.png"),
                  backgroundColor: Colors.transparent,
                ),
                const SizedBox(height: 25),
                const Text(
                  "Ahmad Ali Satia",
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.lightBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 50,
                  width: 300,
                  child: Divider(
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "20552011200",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.lightGreen,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                  width: 190,
                  child: Divider(
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "TIF K 20 CID",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.lightGreen,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                  width: 180,
                  child: Divider(
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Teknik Informatika",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.lightGreen,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                  width: 240,
                  child: Divider(
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "(STT) Bandung",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.lightGreen,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                  width: 200,
                  child: Divider(
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          side: const BorderSide(width: 1.0, color: Colors.lightBlue )
                        ),
                        child: const Text(
                          'Logout',
                          style: TextStyle(
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, "/login");
                        },
                      ), 
                    ],
                  ),
                ),
              ],
            ),
          )
        )
      );
  }
}