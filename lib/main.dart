import 'package:flutter/material.dart';
import 'package:pokedex/home_screen.dart';
import 'package:flutter/services.dart';

void main(){
  runApp(const Pokemon());
}

class Pokemon extends StatelessWidget {
  const Pokemon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
