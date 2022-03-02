import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../page.dart';
import '../widgets/xo_board.dart';
import '../utils/cell_value.dart';
import '../controllers/game_controller.dart';
import '../controllers/board_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routename='home';


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final BoardController boardController;
  late final GameController gameController;
  int score1= 0;



  @override
  void initState() {
    super.initState();
    boardController = BoardController();
    gameController = GameController(
      boardController: boardController,

    );

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  void dispose() {
    boardController.dispose();
    gameController.dispose();
    SystemChrome.restoreSystemUIOverlays();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    HomeScreenArguments Arguments= ModalRoute.of(context)?.settings.arguments as HomeScreenArguments;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Score',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              SizedBox(height: 18,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                Text('${Arguments.player1}: X ',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                Text('${Arguments.player2}: O ',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),

              ],),
              const Text(

                'Click a cell when it\'s your move.',
                style: TextStyle(fontSize: 18.0),
              ),
              AnimatedBuilder(
                animation: gameController,
                builder: (context, _) {

                  if (gameController.isDraw) {
                    return const Text(
                      'Draw!',
                      style: TextStyle(
                        fontSize: 32.0,
                        color: Colors.orange,
                      ),
                    );
                  } else if (gameController.hasWinner) {
                    score1++;
                    return
                      Text(
                        'Winner is ${mapCellValueToString(gameController.winner)}',
                        style: const TextStyle(
                          fontSize: 32.0,
                          color: Colors.green,
                        ),
                      );



                  } else {
                    return Text(
                      'Player ${gameController.currentPlayerString}\'s turn.',
                      style: TextStyle(
                        fontSize: 32.0,
                        color: gameController.currentPlayerColor,
                      ),
                    );

                  }
                },
              ),

              XOBoard(
                controller: boardController,
                onCellTap: gameController.onCellTap,
              ),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  child: const Text(
                    'computer  Play',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    gameController.aiPlay();
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: FlatButton(
                  color: Colors.red,
                  child: const Text(
                    'Play again',
                    style: TextStyle(
                      fontSize: 20,color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    gameController.restartGame(randomPlayer: false);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
