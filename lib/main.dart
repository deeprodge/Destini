import 'dart:ui';

import 'package:destini_challenge_starting/story_brain.dart';
import 'package:flutter/material.dart';


void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

StoryBrain storyBrain=StoryBrain();
class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/background2.png'),
          fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyBrain.getStory(),
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: 25.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: FlatButton(
                  onPressed: () {
                    //Choice 1 made by user.
                  setState(() {
                      storyBrain.nextStory(1);
                   });},
                  color: Colors.grey[600],
                  child: Text(
                    storyBrain.getChoice1(),
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: 22.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        storyBrain.nextStory(2);
                      });
                    },
                    color: Colors.grey[900],
                    child: Text(
                      storyBrain.getChoice2(),
                      style: TextStyle(
                        fontFamily: 'Oswald',
                        fontSize: 22.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


