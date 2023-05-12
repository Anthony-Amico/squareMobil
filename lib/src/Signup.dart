import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:square_mobil/src/constants.dart';
import 'dart:convert';

import 'package:square_mobil/src/login.dart';

import 'BottomNavBar.dart';

// void main() => runApp(const Signup());

class Signup extends StatelessWidget {
  const Signup({super.key});

  static const String _title = 'Inscription';
  final bool connected = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
          appBar: AppBar(
            elevation: 3,
            backgroundColor: Colors.grey[200],
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              color: Colors.red,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
            title: const Text(_title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            )
          ),
          backgroundColor: Colors.grey[200],
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    const MyStatefulWidget(),
                  ],
                ),
              )
          ),
        bottomNavigationBar: !connected ?null: BottomNavBar(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool checked = false;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController loginController = new TextEditingController();
  String login = "";
  // TextEditingController emailController = new TextEditingController();
  postData() async{
    var jsonEncode2 = jsonEncode(<String, String>{
        "email": emailController.text,
        "login":loginController.text,
        "password": passwordController.text
      });
    print(jsonEncode2);
    var response = await http
        .post(
      Uri.parse(ApiConstants.baseUrl+ApiConstants.connectionUrl),
      headers: <String, String>{
        'Content-Type' : 'application/json; charset=UTF-8'
      },
      body:jsonEncode2
    );
    print(response.body);
  }
  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              hintText: 'achille@example.com'
            ),

            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Entre quelque chose au moins!';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          TextFormField(
            controller: loginController,
           // initialValue: login,
            decoration: const InputDecoration(
              labelText: 'Identifiant',
              hintText: 'Achille'
            ),
            validator: (String? value){
              if (value == null || value.isEmpty){
                return 'On est pas anonymous ici';
              }
            },
            onChanged: (value)=>login=value,
          ),
          const SizedBox(height: 24),
          TextFormField(
            obscureText: true,
            controller: passwordController,
            decoration: const InputDecoration(
              labelText: 'Mot de passe',
              hintText: 'azertyuiop'
            ),
            validator: (String? value){
              if (value == null || value.isEmpty){
                return 'fais un effort ...';
              }
            },
          ),
          CheckboxListTile(
            value: checked,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (bool? value){
              setState(() {
                checked = value??false;
              });
          },
              title: const Text("J'ai lu et accepte les conditions d'utilisation")),

          Center(
            // padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                primary: Colors.red,
                onPrimary: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              onPressed: !checked?null: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  if(checked == true){
                    postData();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  } else {
                    print('CGU non acceptées');
                  }
                }
              },
              child: const Text('Continuer'),
            ),
          ),
          const SizedBox(height: 50),
          Row(
            children: [
              Expanded(child: Text('Déjà un compte?',
                style: TextStyle(
                  color: Colors.grey.shade600)
                ),
              ),
              Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: const Text('Connexion',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                }
               ),
                    ],
                  )
              ),
            ],
          ),
        ],
      ),
    );
  }
}
