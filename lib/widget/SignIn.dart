import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:text_field_test1/api/api.dart';
import '../entity/user_entity.dart';



class SignInPage extends StatefulWidget {
  const SignInPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  List<User> users = [];
  bool isLoading = false;
  @override
  void initState(){
    super.initState();
  }
  final _loginController = TextEditingController(text: 'admin');
  final _passwordController = TextEditingController(text: 'admin');
  String? errorText;
  Future<void> _auth2() async {
    final login = _loginController.text;
    final password = _passwordController.text;
    final url = Api.API+'/users/sign-in';
    final uri = Uri.parse(url);
    var responce = await http.post(uri,headers: {'Content-Type': 'application/json'},body: jsonEncode({
      "login": login,
      "password": password,
    }));

    if(responce.statusCode==200){
      setState(() {
        var items = jsonDecode(responce.body).cast<Map<String, dynamic>>();
        users= items.map<User>((json) => User.fromJson(json)).toList();
        isLoading=false;
        // users = items;
        Navigator.of(context).pushReplacementNamed('/main_screen');
        errorText = null;
        print(users);
        print(items);
      });

    }else{
      setState(() {
        users = [];
        errorText = 'Не верный логин';
      });
    }
    setState(() {
    });
  }

  // final _loginController = TextEditingController(text: 'admin');
  // final _passwordController = TextEditingController(text: 'admin');
  // String? errorText;

  Future<void> _auth() async {
    final login = _loginController.text;
    final password = _passwordController.text;
    final url = Api.API+'/users/sign-in';
    final uri = Uri.parse(url);
    var responce = await http.post(uri,headers: {'Content-Type': 'application/json'},body: jsonEncode({
      "login": login,
      "password": password,
    }));
    if(responce.statusCode==200){
      Navigator.of(context).pushReplacementNamed('/main_screen');
      errorText = null;
    }else{
      errorText = 'Не верный логин';
    }
    setState(() {
    });
  }

  void _authtwo(){
    final login = _loginController.text;
    final password = _passwordController.text;
    if(login == 'admin' && password == 'admin'){
      Navigator.of(context).pushReplacementNamed('/main_screen');
      errorText = null;
    }else{
      errorText = 'Не верный логин';
    }
    setState(() {
    });
  }
  void _registration(){
    print('Regist');

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.title,),
        shadowColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 40,
            ),
            const Text("Sign in", style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
            ),
            if(errorText != null)
              ...[
                const SizedBox(
                  height: 30,
                ),
                const Text('Не верный пароль или логин',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.red,
                  ),),

              ],
            const SizedBox(
              height: 50,
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: TextField(
              controller: _loginController,
              style: const TextStyle(
                color: Colors.black,
              ),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.account_box,
                    color: Colors.black,),
                  prefixIconColor: Colors.black,
                  border: OutlineInputBorder(),
                  hintText: "User",
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.5,
                    ),
                  )
              ),

            ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              style: const TextStyle(
                color: Colors.black,
              ),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.password,
                    color: Colors.black,),
                  prefixIconColor: Colors.black,
                  border: OutlineInputBorder(),
                  hintText: "Password",
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.5,
                    ),
                  )
              ),

            ),),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue),
                foregroundColor: MaterialStatePropertyAll(Colors.white),
                overlayColor: MaterialStatePropertyAll(Colors.blueGrey),
                padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 35.0))


              ),
                  onPressed: _auth,
                  child: const Text("Вход", style: TextStyle(
                    fontSize: 20,
                  ),),
              ),
            const SizedBox(
              height: 40,
            ),

            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  overlayColor: MaterialStatePropertyAll(Colors.purple),
                  padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 35.0)
                  )


              ),
              onPressed: _registration,
              child: const Text("Регистрация", style: TextStyle(
                fontSize: 15,
              ),),
            ),
          ],
        ),
      )
    );
  }

}
