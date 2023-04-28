import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:text_field_test1/api/api.dart';

class FavoriteList extends StatefulWidget {
  const FavoriteList({Key? key}) : super(key: key);

  @override
  State<FavoriteList> createState() => _FavoriteListState();
}


class _FavoriteListState extends State<FavoriteList> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _dataController = TextEditingController();
  final _imageController = TextEditingController(text: Api.API+'/product/image/');



  Future<void> _post() async {
    final name = _nameController.text;
    final description = _descriptionController.text;
    final price = _priceController.text;
    final data = _dataController.text;
    final image = _imageController.text;
    final url = Api.API+'/product';
    final uri = Uri.parse(url);
    var responce = await http.post(uri,headers: {'Content-Type': 'application/json'},body: jsonEncode({
      "name": name,
      "description": description,
      "userId": "3",
      "price": price,
      "imageOne": image,
      "data": data


    }));
    if(responce.statusCode==200){
      Navigator.of(context).pushReplacementNamed('/main_screen');
    }else{
    }
    setState(() {
    });
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          TextField(
            controller: _nameController,
            style: const TextStyle(
              color: Colors.black,
            ),
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.account_box,
                  color: Colors.black,),
                prefixIconColor: Colors.black,
                border: OutlineInputBorder(),
                hintText: "Название",
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
          const SizedBox(
            height: 40,
          ),
          TextField(
            controller: _descriptionController,
            style: const TextStyle(
              color: Colors.black,
            ),
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.account_box,
                  color: Colors.black,),
                prefixIconColor: Colors.black,
                border: OutlineInputBorder(),
                hintText: "Описание",
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
          const SizedBox(
            height: 40,
          ),
          TextField(
            controller: _priceController,
            style: const TextStyle(
              color: Colors.black,
            ),
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.account_box,
                  color: Colors.black,),
                prefixIconColor: Colors.black,
                border: OutlineInputBorder(),
                hintText: "Цена",
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
          const SizedBox(
            height: 40,
          ),
          TextField(
            controller: _dataController,
            style: const TextStyle(
              color: Colors.black,
            ),
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.account_box,
                  color: Colors.black,),
                prefixIconColor: Colors.black,
                border: OutlineInputBorder(),
                hintText: "Дата",
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
          const SizedBox(
            height: 40,
          ),
          TextField(
            controller: _imageController,
            style: const TextStyle(
              color: Colors.black,
            ),
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.account_box,
                  color: Colors.black,),
                prefixIconColor: Colors.black,
                border: OutlineInputBorder(),
                hintText: "Картинка",
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
          ElevatedButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue),
                foregroundColor: MaterialStatePropertyAll(Colors.white),
                overlayColor: MaterialStatePropertyAll(Colors.purple),
                padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 35.0)
                )


            ),
            onPressed: _post,
            child: const Text("Загрузить", style: TextStyle(
              fontSize: 15,
            ),),
          ),



        ],
      ),
    );
  }

}



