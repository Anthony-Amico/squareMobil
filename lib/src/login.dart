
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:square_mobil/src/component/my_button.dart';
import 'package:square_mobil/src/component/my_textfield.dart';
import 'package:square_mobil/src/constants.dart';
import 'package:http/http.dart';

  class LoginPage extends StatelessWidget{
    LoginPage({super.key});
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    void login(String login , String password) async {

    try{

      Response response = await post(
        Uri.parse(ApiConstants.baseUrl+ApiConstants.connectionUrl),
        body: {
          'login' : login,
          'password' : password
        }
      );

      if(response.statusCode == 200){

        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('Login successfully');

      }else {
        print('failed');
      }
    }catch(e){
      print(e.toString());
    }
  }

  void signUserIn(String login , String password) async {
    try{

      Response response = await post(
          Uri.parse('http://172.22.114.101:8080/api/1/sessions'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body:  jsonEncode(<String, String>{
            "login" : login,
            "password" : password
          })
      );

      if(response.statusCode == 200){

        var data = jsonDecode(response.body.toString());
        print(data['playerId']);
        print('Login successfully');

      }else {
        print("erreur");
        print(response.statusCode);
      }
    }catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const SizedBox(height: 100),
              Text(
                'Connectez vous',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 25),
              MyTextField(
                controller: usernameController,
                hintText: "nom d'utilisateur",
                obscureText: false,
              ),

              const SizedBox(height: 25),
              MyTextField(
                controller: passwordController,
                hintText: 'Mot de passe',
                obscureText: true,
              ),

              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Mot de Passe oublié ?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              MyButton(
                onTap:() {
                  signUserIn(usernameController.text,
                      passwordController.text);
                },),
              const SizedBox(height: 50),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Pas Inscrit ?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  const Text('enregistrez vous',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ],
          ),
        )

      ),
    );
  }
}