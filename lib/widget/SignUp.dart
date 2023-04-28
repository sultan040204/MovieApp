import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:text_field_test1/api/api.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _loginController = TextEditingController(text: 'admin');
  final _passwordController = TextEditingController(text: 'admin');
  String? errorText;

  Future<void> httpGet() async {
    const url = Api.API+'/users';
    final uri = Uri.parse(url);
    try{
    var responce = await Dio().get("https://www.google.com/search?q=asd&source=hp&ei=WpaiY8j9OcaRwPAP-6yGqAs&iflsig=AJiK0e8AAAAAY6Kkau7ANSUfPhyISN392KpVpOHw5J_m&ved=0ahUKEwjIkvWV-on8AhXGCBAIHXuWAbUQ4dUDCA0&oq=asd&gs_lcp=Cgdnd3Mtd2l6EAwyCggAELEDEIMBEEMyCgguEMcBENEDEEMyBAgAEEMyBAguEEMyBwgAEIAEEAoyDQguEK8BEMcBEIAEEAoyBwgAEIAEEAoyBwgAEIAEEAoyBwgAEIAEEAoyBwgAEIAEEAo6FAgAEOoCELQCEIoDELcDENQDEOUCOhQILhDqAhC0AhCKAxC3AxDUAxDlAjoFCAAQgAQ6DgguEIAEEMcBENEDENQCOggIABCABBCxAzoLCAAQgAQQsQMQgwE6CwguEIAEELEDEIMBOggILhCxAxCDAToRCC4QgAQQsQMQgwEQxwEQrwE6DgguEIAEELEDEIMBENQCOggIABCxAxCDAToLCC4QgAQQxwEQrwFQZFiJAmDUDmgBcAB4AIABe4gB2gKSAQMwLjOYAQCgAQGwAQc&sclient=gws-wiz");
      print(responce);
      print(responce.statusCode);
    }catch(error){
      print(404);
    };
  }
  Future<void> httpPost() async {
    final body = {
      "name":"sultan",
      "login":"ss",
      "password":"123"
    };
    const url = Api.API+'/product';
    final uri = Uri.parse(url);
    var responce = await http.post(uri,body: jsonEncode(body));
      print(responce);
      print(responce.statusCode);
  }

  void _auth(){
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
    httpGet();
    httpPost();
    // const url = 'https://4.tcp.eu.ngrok.io:10696/product/files/1.jpg';
    // final uri = Uri.parse(url);
    // http.get(uri).then((response) {
    //   print(response);
    //   print(response.statusCode);
    // }).catchError((error) {
    //   print(error);
    //   print(404);
    // });
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
