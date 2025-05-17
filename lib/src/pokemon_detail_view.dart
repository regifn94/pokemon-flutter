import 'package:flutter/material.dart';

class PokemonDetailView extends StatefulWidget {

  final String? title;

  const PokemonDetailView({
    Key? key,
    this.title
  }) : super(key: key);

  @override
  State<PokemonDetailView> createState() => _PokemonDetailViewState();
}

class _PokemonDetailViewState extends State<PokemonDetailView> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  String myTitle = "";

  @override
  void initState() {
    myTitle = widget.title ?? myTitle;

    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(myTitle),),
    );
  }
}
