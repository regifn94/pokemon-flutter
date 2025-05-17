import 'package:flutter/material.dart';
import 'package:my_pokemon/src/pokemon_detail_view.dart';
import 'package:my_pokemon/src/pokemon_model.dart';

class PokemonImageView extends StatelessWidget{

  List<PokemonModel> listPokemon = [
    PokemonModel("BCA", "images/bca.png"),
    PokemonModel("BNI", "images/bni.png"),
    PokemonModel("BRI", "images/bri.png")
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
          itemCount: listPokemon.length,
          itemBuilder: (context, position){
            return Container(
              padding: EdgeInsets.all(20),
              child: InkWell(
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      padding: EdgeInsets.only(right: 20),
                      child: Image.asset(listPokemon[position].image),
                    ),
                    Text(listPokemon[position].name,
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ],
                ),
                onTap: (){
                  print("listName : ${listPokemon[position].name.toString()}");
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) {
                            return PokemonDetailView(title: listPokemon[position].name,);
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