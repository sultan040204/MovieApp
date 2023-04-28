import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:text_field_test1/entity/product.dart';
import 'package:text_field_test1/api/api.dart';

class ListProduct{
  final String name;
  final String description;
  final String price;
  final String imageOne;
  final String data;

  ListProduct({
    required this.name, required this.description, required this.price, required this.imageOne, required this.data
  });
  }



class gridViewHome extends StatefulWidget {
  const gridViewHome({Key? key}) : super(key: key);

  @override
  State<gridViewHome> createState() => _gridViewHomeState();
}


class _gridViewHomeState extends State<gridViewHome> {

  List<dynamic> product = [];
  bool isLoading = false;
  @override
  void initState(){
    super.initState();
    this.getListProducts();
  }
  Future<void> getListProducts() async {
    setState(() {
      isLoading=true;
    });
    final url1 = Api.API+'/product';
    final uri = Uri.parse(url1);
    var responce = await http.get(uri);
    print(responce.body);
      if(responce.statusCode==200){
        var items = jsonDecode(responce.body);
        setState(() {
          isLoading=false;
          product = items;
        });
      }else{
        setState(() {
          product = [];
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    if(product.contains(null) || product.length<0||isLoading){
      return Center(
        child: CircularProgressIndicator(
            backgroundColor: Colors.black
        ),
      );
    }
    return Column(
      children: [
        Expanded(child: GridView.builder(
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.60),
            itemCount: product.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(product[index]);
            },
        )),
      ],
    );
  }
  Widget Card(index){
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Stack(
          children: [
            Container(
              // height: 250,
              width: 195,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black.withOpacity(0.08)),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.01),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    )
                  ]
              ),
              clipBehavior: Clip.hardEdge,
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(index["imageOne"],
                  height: 230,
                  width: double.infinity,
                  fit: BoxFit.cover,),
                  const SizedBox(width: 12,),
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          SizedBox(height: 12),
                          Text(" "
                              +index["name"].toString()
                            ,
                            style: TextStyle(fontWeight: FontWeight.bold),maxLines: 2, overflow: TextOverflow.ellipsis,),
                          SizedBox(height: 12),
                          Text("   "
                            +index["description"].toString()
                            ,
                            style: TextStyle(fontSize: 12,),maxLines: 1, overflow: TextOverflow.ellipsis,),
                        ],
                      )),
                  const SizedBox(width: 10,),
                ],
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: (){
                  print("2");
                },
              ),
            )
          ],
        )
    );
  }

}



