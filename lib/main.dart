import 'package:flutter/material.dart';
import 'package:pokedex/home_screen.dart';

void main(){
  runApp(const Pokemon());
}

class Pokemon extends StatelessWidget {
  const Pokemon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
