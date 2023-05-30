import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokemonDetailScreen extends StatefulWidget {

  final PokemonDetail;
  final Color color;
  final int heroTag;

  const PokemonDetailScreen({Key? key, this.PokemonDetail, required this.color, required this.heroTag}) : super(key: key);

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return  Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 30,
            left: 1,
            child: IconButton(onPressed: (){
              Navigator.pop(context);
            }
            , icon: Icon(Icons.arrow_back,color: Colors.white,size: 40,)
            ),
          ),
          Positioned(
            left: 20,
              top: 90,
              child: Text(
            widget.PokemonDetail['name'],
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          )
          ),
          Positioned(
            top: 140,
              left: 20,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8,right: 8,top: 4,bottom: 4),
                  child: Text(widget.PokemonDetail['type'].join(' , '),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.black26
                ),
              )
          ),

          Positioned(

            bottom: 0,
            child: Container(
              width: width,
              height: height * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 40,),
                          Container(
                            width: width * 0.3,
                              child: Text("Name",
                              style:TextStyle(
                                color: Colors.blueGrey,fontSize: 18
                              ) ,
                              )
                          ),
                          Container(
                              child: Text(widget.PokemonDetail['name'],
                                style:TextStyle(
                                    color: Colors.black,fontSize: 18, fontWeight: FontWeight.bold
                                ) ,
                              )
                          ),
                        ],

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 40,),
                          Container(
                              width: width * 0.3,
                              child: Text("Height",
                                style:TextStyle(
                                    color: Colors.blueGrey,fontSize: 18
                                ) ,
                              )
                          ),
                          Container(
                              child: Text(widget.PokemonDetail['height'],
                                style:TextStyle(
                                    color: Colors.black,fontSize: 18, fontWeight: FontWeight.bold
                                ) ,
                              )
                          ),
                        ],

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 40,),
                          Container(
                              width: width * 0.3,
                              child: Text("Weight",
                                style:TextStyle(
                                    color: Colors.blueGrey,fontSize: 18
                                ) ,
                              )
                          ),
                          Container(
                              child: Text(widget.PokemonDetail['weight'],
                                style:TextStyle(
                                    color: Colors.black,fontSize: 18, fontWeight: FontWeight.bold
                                ) ,
                              )
                          ),
                        ],

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 40,),
                          Container(
                              width: width * 0.3,
                              child: Text("Spawn Time",
                                style:TextStyle(
                                    color: Colors.blueGrey,fontSize: 18
                                ) ,
                              )
                          ),
                          Container(
                              child: Text(widget.PokemonDetail['spawn_time'],
                                style:TextStyle(
                                    color: Colors.black,fontSize: 18, fontWeight: FontWeight.bold
                                ) ,
                              )
                          ),
                        ],

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 40,),
                          Container(
                              width: width * 0.3,
                              child: Text("Weaknesses",
                                style:TextStyle(
                                    color: Colors.blueGrey,fontSize: 18
                                ) ,
                              )
                          ),
                          Container(
                            width: width*0.5,
                              child: Text(widget.PokemonDetail['weaknesses'].join(' , '),
                                style:TextStyle(
                                    color: Colors.black,fontSize: 18, fontWeight: FontWeight.bold
                                ) ,
                              )
                          ),
                        ],

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 40,),
                          Container(
                              width: width * 0.3,
                              child: Text("Pre form",
                                style:TextStyle(
                                    color: Colors.blueGrey,fontSize: 18
                                ) ,
                              )
                          ),
                          widget.PokemonDetail['prev_evolution']!=null ?
                          SizedBox(
                            height: 20,
                            width: width*0.5,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.PokemonDetail['prev_evolution'].length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text(widget.PokemonDetail['prev_evolution'][index]['name'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                );
                              },
                            ),
                          ) : Text("Just Hatched",style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black
                          ),)

                        ],

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 40,),
                          Container(
                              width: width * 0.3,
                              child: Text("Evolution",
                                style:TextStyle(
                                    color: Colors.blueGrey,fontSize: 18
                                ) ,
                              )
                          ),
                          widget.PokemonDetail['next_evolution']!=null ?
                              SizedBox(
                                height: 20,
                                  width: width*0.5,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: widget.PokemonDetail['next_evolution'].length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: Text(widget.PokemonDetail['next_evolution'][index]['name'],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold
                                      ),
                                      ),
                                    );
                                  },
                                ),
                              ) : Text("Maxed Out",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black
                          ),)

                        ],

                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: height *0.18 + 20,
            left: (width/2)-100,
            child: Hero(
              tag: widget.heroTag,
              child: CachedNetworkImage(
                imageUrl: widget.PokemonDetail['img'],
                height: 200,
                fit: BoxFit.fitHeight,
              ),
            ),
          )
        ],
      ),
    );
  }
}
