import 'package:flutter/material.dart';
import 'package:my_pokemon/src/pokemon_detail_view.dart';

class PokemonView extends StatelessWidget{

  List<String> listName = [
    "Joel Matthew Najoan",
    "Astri Leoni Padaunan",
    "Regi Fernando Najoan"
  ];

  // @override
  // void initState() {
  //   // print("initState : listName ${listName[0].toString()}");
  //   // listName.forEach((element){
  //   //   print("initState : element ${element.toString()}");
  //   // });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Pokemon"),),
      body: ListView.builder(
          itemCount: listName.length,
          itemBuilder: (context, position){
            return Container(
              padding: EdgeInsets.all(20),
              child: InkWell(
                child: Text(listName[position],
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
                onTap: (){
                  print("listName : ${listName[position].toString()}");
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) {
                            return PokemonDetailView(
                              title: listName[position],
                            );
                          }
                      )
                  );
                },
              ),
            );
          }
      ),
    );
  }
}