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
            childAspectRatio: 1.4
          ),
              itemCount:pokedex.length ,
            itemBuilder: (context,index){
            var type=pokedex[index]['type'][0];
            return Card(
              color: Colors.green,
              child: Stack(
                children:[
                  Positioned(
                      bottom:-10,
                      right: -10,
                      child: Image.asset("images/pokeball.png", height: 100, fit: BoxFit.fitHeight,)
                  ),
                    Positioned(
                      top: 30,
                        left: 20,
                        child: Text(pokedex[index]['name'])
                    ),
                  Positioned(
                      top: 45,
                      left: 20,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(20))
                        ),

                          child: Padding(
                            padding: const EdgeInsets.only(left: 8,right: 8,top: 4,bottom: 4),
                            child: Text(type.toString()),
                          ))
                  ),
                    Positioned(
                        bottom:-10,
                        right: -10,
                        child: CachedNetworkImage(imageUrl: pokedex[index]['img'])
                    ),
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
