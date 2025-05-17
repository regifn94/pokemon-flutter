import 'package:flutter/material.dart';

class PokemonDetailView extends StatefulWidget {

  final String? title;
  final String? image;

  const PokemonDetailView({
    Key? key,
    this.title,
    this.image
  }) : super(key: key);

  @override
  State<PokemonDetailView> createState() => _PokemonDetailViewState();
}

class _PokemonDetailViewState extends State<PokemonDetailView> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  String myTitle = "";
  String myImage = "";

  @override
  void initState() {
    myTitle = widget.title ?? myTitle;
    myImage = widget.image ?? myImage;

    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(myTitle),),
      body: Container(
        margin: EdgeInsets.all(50),
        child: myImage.isNotEmpty ? Image.asset(myImage) : Container(),
      ),
    );
  }
}
