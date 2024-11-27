import 'package:flutter/material.dart';
import 'package:act14/infastructure/models/pokemon.dart';
import 'package:dio/dio.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Pokemon? pokemon;
  int pokemonId = 0;



@override
  void initState() {
    super.initState();
    getPokemon();
  }

  Future<void> getPokemon() async{
    pokemonId++;
    final response = await Dio().get("https://pokeapi.co/api/v2/pokemon/$pokemonId");
    pokemon = Pokemon.fromJson(response.data);

setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Pokemon ID: $pokemonId'),

        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(pokemon?.name ?? 'No data', style: TextStyle(fontSize: 25)),
            
            if(pokemon != null )
            Image.network(pokemon!.sprites.frontDefault),

            if(pokemon != null )
            Image.network(pokemon!.sprites.backDefault),
            ],
          ),
        ),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.navigate_next ),
        onPressed: () {
          getPokemon();
        },
      ),
    );
  }
}