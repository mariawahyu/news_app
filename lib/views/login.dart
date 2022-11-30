import 'package:flutter/material.dart';
import 'package:news_app/views/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = "dam@gmail.com";
  String password = "123456";
  String alert = "";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();

  // ignore: non_constant_identifier_names
  void ProsesLogin() {
    if (_formKey.currentState!.validate()) {
      if (emailInput.text == email && passwordInput.text == password) {
        toHomePage();
      }
    } else {
      setState(() {
        alert = "email/password salah";
      });
    }
    super.initState();
  }

  toHomePage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                  color: Colors.blueGrey, shape: BoxShape.circle),
              child: const Center(
                child: Icon(
                  Icons.newspaper,
                  size: 100,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "NEWS APP",
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: emailInput,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Masukkan email anda";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      hintText: "Masukkan Email",
                      hintStyle: TextStyle(color: Colors.black38),
                      labelText: "Email",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwordInput,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Masukkan password anda";
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      hintText: "Masukkan Password",
                      hintStyle: TextStyle(color: Colors.black38),
                      labelText: "Password",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    alert,
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    color: Colors.blueGrey,
                    elevation: 3,
                    child: SizedBox(
                      height: 50,
                      child: InkWell(
                        splashColor: Colors.white,
                        onTap: () => ProsesLogin(),
                        child: const Center(
                          child: Text(
                            "Sign In",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
