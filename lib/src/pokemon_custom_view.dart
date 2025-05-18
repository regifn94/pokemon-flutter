import 'package:flutter/material.dart';
import 'package:my_pokemon/src/pokemon_detail_view.dart';
import 'package:my_pokemon/src/pokemon_model.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class PokemonCustomView extends StatefulWidget {
  const PokemonCustomView({super.key});

  @override
  State<PokemonCustomView> createState() => _PokemonCustomViewState();
}

class _PokemonCustomViewState extends State<PokemonCustomView> {

  List<PokemonModel> listPokemon = [];

  List<PokemonModel> listData = [
    PokemonModel("Abomasnow", "images/abomasnow.png"),
    PokemonModel("Abra", "images/abra.png"),
    PokemonModel("Accelgor", "images/accelgor.png"),
    PokemonModel("Absol", "images/absol.png"),
    PokemonModel("Aegislash Shield", "images/aegislash-shield.png"),
    PokemonModel("Aerodactyl", "images/aerodactyl.png"),
    PokemonModel("Aggron", "images/aggron.png"),
    PokemonModel("Aipom", "images/aipom.png"),
    PokemonModel("Alakazam", "images/alakazam.png"),
    PokemonModel("Alomomola", "images/alomomola.png"),
    PokemonModel("Altaria", "images/altaria.png"),
  ];

  var countPokemon = 0;

  void addData(){
    if(countPokemon <12) {
      print("addData: countPokemon ${countPokemon}");
      setState(() {
        listPokemon.add(listData[countPokemon]);
        countPokemon ++;
      });
    }
  }

  void loadData(){
    ProgressDialog pd = ProgressDialog(context: context);
    pd.show(msg: "Pokemon Loading...");
    Future.delayed(Duration(seconds: 2), (){
      setState(() {
        listPokemon = listData;
        pd.close();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Pokemon"),),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            // loadData();
            addData();
          },
      ),
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
                            return PokemonDetailView(
                              title: listPokemon[position].name,
                              image: listPokemon[position].image,
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