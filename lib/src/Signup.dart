import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:square_mobil/src/login.dart';

// void main() => runApp(const Signup());

class Signup extends StatelessWidget {
  const Signup({super.key});

  static const String _title = 'Inscription';


  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: _title,
  //     home: Scaffold(
  //       appBar: AppBar(title: const Text(_title)),
  //       body: const MyStatefulWidget(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(

        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 0),
              const MyStatefulWidget(),
            ],
          ),
        )
      )
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
      Uri.parse("http://172.22.114.115:8080/api/1/players"),
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
              title: Text("J'ai lu et accepte les conditions d'utilisation")),

          Center(
            // padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
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
        ],
      ),
    );
  }
}
