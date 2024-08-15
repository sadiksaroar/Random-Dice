import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 late int index1 = 0 , index2 = 0;
 Random random = Random.secure();
 int sum = 0;
 bool hasGameStarted = false;
 bool isGameRunning = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dice Game',),),
      body: Center(
        child: hasGameStarted ? gameBody() : startBody(),
      ),
    );
  }

  Column  startBody(){
    return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const FlutterLogo(size: 100,),
            const Text('Welcome to Dice Game', style: TextStyle(),),

            ElevatedButton(
              onPressed: (){
               setState(() {
                  hasGameStarted = true;
               });
              }, 
              child: 
              const Text('START'),
              
              )
          ],
      );
  }

  Column gameBody() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Text('Welcome', style: TextStyle(fontSize: 30),),
          // SizedBox(height: 20,),
        if(isGameRunning)  Row(
            children: [
              Image.asset(diceList[index1], height: 100,width: 100,),
              SizedBox(width: 20,),
              Image.asset(diceList[index2], height: 100,width: 100,),

            ],
          ),
          Text('Dice Sum: $sum', style: const TextStyle(fontSize: 20),),
        ElevatedButton(
          onPressed: rollTheDice, 
          child: Text('Roll'))
        ],
      );
  }


  void rollTheDice() {
   setState(() {
      index1 = random.nextInt(6);
      index2 = random.nextInt(6);

      sum = index1 + index2 + 2;
      if(!isGameRunning){
        isGameRunning = true;
      }
   });
    

  }
}

final diceList = [
  'images/d1.PNG',
  'images/d2.PNG',
  'images/d3.PNG',
  'images/d4.PNG',
  'images/d5.PNG',
  'images/d6.PNG',
  

];