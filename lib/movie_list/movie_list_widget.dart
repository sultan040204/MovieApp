import 'package:flutter/material.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final image = const AssetImage('images/dark-knight.jpg');
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemExtent: 163,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black.withOpacity(0.2)),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        )
                      ]
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Row(
                    children: [
                      Image(image: image),
                      const SizedBox(width: 15,),
                      Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const[
                              SizedBox(height: 20),
                              Text("Dark-Knight",
                                style: TextStyle(fontWeight: FontWeight.bold),maxLines: 2, overflow: TextOverflow.ellipsis,),
                              SizedBox(height: 5),
                              Text("Дата",
                                style: TextStyle(color: Colors.grey),maxLines: 2, overflow: TextOverflow.ellipsis,),
                              SizedBox(height: 20),
                              Text("Описание", maxLines: 2, overflow: TextOverflow.ellipsis,),
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
        });
  }
}
