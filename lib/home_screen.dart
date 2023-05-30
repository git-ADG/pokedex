import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/pokemon_detail_screen.dart';

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
    var width=MediaQuery.of(context).size.width;
    return  Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: -50,
              right: -50,
              child: Image.asset("images/pokeball.png",width: 200,fit: BoxFit.fitWidth,)
          ),
          Positioned(
            top: 80,
              left: 20,
              child: Text(
            "POKEDEX",style: TextStyle(
            color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30
          ),
          )
          ),
          Positioned(
            top: 150,
          bottom: 0,
          width: width,
          child: Column(
            children: [
              pokedex !=null ?
              Expanded(child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.4
              ),
                  itemCount:pokedex.length ,
                itemBuilder: (context,index){
                var type=pokedex[index]['type'][0];
                return InkWell(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                    child: Container(
                      decoration: BoxDecoration(
                        color: type=='Grass' ? Colors.greenAccent :
                        type=='Fire' ? Colors.redAccent :
                          type=='Water' ? Colors.blue :
                          type=='Bug'  ? Colors.lightGreenAccent :
                          type=='Electric' ? Colors.yellow :
                          type=='Rock' ? Colors.black38 :
                          type=='Ground' ? Colors.brown :
                          type=='Psychic' ? Colors.pinkAccent :
                          type=='Fighting' ? Colors.orange :
                          type=='Ice' ? Colors.lightBlueAccent :
                          type=='Ghost' ? Colors.deepPurple :
                          type=='Normal' ? Colors.black12 :
                          type=='Poison' ? Colors.purple :
                          Colors.purpleAccent,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Stack(
                        children:[

                            Positioned(
                              top: 8,
                                left: 10,
                                child: Text(pokedex[index]['name'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,fontSize: 17,
                                  color: Colors.white
                                ),
                                )
                            ),
                          Positioned(
                              top: 32,
                              left: 10,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black26,
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                                ),

                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8,right: 8,top: 4,bottom: 4),
                                    child: Text(type.toString(),
                                    style: TextStyle(color: Colors.white),),
                                  ))
                          ),
                            Positioned(
                                bottom:-10,
                                right: -10,
                                child: Hero(
                                  tag: index,
                                  child: CachedNetworkImage(imageUrl: pokedex[index]['img'],
                                  height: 100,
                                  fit: BoxFit.fitHeight,
                                  ),
                                )
                            ),
                          ],
                      ),
                    ),
                  ),
                  onTap: (){
                    //TODO Navigate to new detail screen
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>PokemonDetailScreen(
                      PokemonDetail: pokedex[index],
                      color: type=='Grass' ? Colors.greenAccent :
                      type=='Fire' ? Colors.redAccent :
                      type=='Water' ? Colors.blue :
                      type=='Bug'  ? Colors.lightGreenAccent :
                      type=='Electric' ? Colors.yellow :
                      type=='Rock' ? Colors.grey :
                      type=='Ground' ? Colors.brown :
                      type=='Psychic' ? Colors.pinkAccent :
                      type=='Fighting' ? Colors.orange :
                      type=='Ice' ? Colors.lightBlueAccent :
                      type=='Ghost' ? Colors.deepPurple :
                      type=='Normal' ? Colors.grey :
                      type=='Poison' ? Colors.purple :
                      Colors.purpleAccent,
                      heroTag: index,
                    )));
                  },
                );
                },
              )
              ):
                  Center(
                    child: CircularProgressIndicator(),
                  )
            ],
          ),
        ),
      ])

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
