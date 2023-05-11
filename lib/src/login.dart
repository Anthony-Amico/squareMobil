
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:square_mobil/src/component/my_button.dart';
import 'package:square_mobil/src/component/my_textfield.dart';
import 'package:square_mobil/src/constants.dart';
import 'package:http/http.dart';

  class LoginPage extends StatelessWidget{
    LoginPage({super.key});
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();




  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const SizedBox(height: 0),
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.grey.shade200, Colors.grey.shade500],
                  ).createShader(bounds);
                },
                child: Icon(
                  Icons.cloud,
                  color: Colors.white,
                  size: 100.0,
                ),

              ),
              Text(
                'Square Games',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Connexion',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Une jolie phrase de bienvenue',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
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

              const SizedBox(height: 25),
              MyButton(
                onTap:() {
                  signUserIn(usernameController.text,
                      passwordController.text);
                },),
              const SizedBox(height: 100),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Mot de passe oublié ?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 100),
                  Container(
                    child: ElevatedButton(
                      child: const Text('inscription',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/constants');

                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



void signUserIn(String login , String password) async {
    try{

      Response response = await post(
          Uri.parse(ApiConstants.baseUrl+ApiConstants.connectionUrl),
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
