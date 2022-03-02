import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

class page extends StatelessWidget {
  static const String routename='page';
  String player1name='';
  String player2name='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('xo_game')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:  [
          TextField(
            decoration: InputDecoration(
          labelText:'enter name of player 1'
            ),
        onChanged: (text){
      player2name=text;
    },
          ),
         TextField(
                decoration: InputDecoration(
                  labelText: 'enter name of player2'
                  ),
           onChanged: (text){
                  player1name=text;
           },
         ),
          ElevatedButton(onPressed:  (){
            Navigator.pushNamed(
                context, HomeScreen.routename,arguments: HomeScreenArguments(player1name, player2name));

          }   , child: Text('Start')
          ),
        ],
      ),


    );
  }
}
class HomeScreenArguments{
  late String player1;
  late String player2;
  HomeScreenArguments(this.player1,this.player2);

}