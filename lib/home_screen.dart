import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(mounted){
      fetchPokemonData();
    }
  }

  var pokeapi="https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  List pokedex=[ ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          pokedex !=null ?
          Expanded(child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.2
          ),
              itemCount:pokedex.length ,
            itemBuilder: (context,index){
            return Card(
              child: Column(
                children: [
                  Text(pokedex[index]['name']),
                  CachedNetworkImage(imageUrl: pokedex[index]['img']),

                ],
              ),
            );
            },
          )
          ):
              Center(
                child: CircularProgressIndicator(),
              )
        ],
      )

    );
  }

  void fetchPokemonData(){
    var url=Uri.https("raw.githubusercontent.com","/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    http.get(url).then((value){
      if(value.statusCode==200){
        var decodedJsonData=jsonDecode(value.body);
        pokedex=decodedJsonData['pokemon'];
      }
      setState(() {});
    });
  }
}
