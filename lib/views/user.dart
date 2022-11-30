import 'package:flutter/material.dart';
import 'package:news_app/views/home.dart';
import 'package:news_app/views/login.dart';

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  String email = "dam@gmail.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('User'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ))
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(30),
        child: Column(children: <Widget>[
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 149, 155, 152),
                shape: BoxShape.circle),
            child: const Center(
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            email,
            style: const TextStyle(fontSize: 15),
          ),
          const SizedBox(
            height: 20,
          ),
          Card(
            color: Colors.blueGrey,
            elevation: 5,
            child: SizedBox(
              height: 50,
              child: InkWell(
                splashColor: Colors.white,
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Login()));
                },
                child: const Center(
                  child: Text(
                    "Logout",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
