import 'dart:io';
import 'package:flutter/material.dart';
import 'fancyCard.dart';

class VerificationSuccess extends StatefulWidget {
  final File image;
  final score;
  VerificationSuccess({Key key, this.image, this.score}) : super(key: key);

  @override
  _VerificationSuccessState createState() => _VerificationSuccessState();
}

class _VerificationSuccessState extends State<VerificationSuccess> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(255,253,251,1),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .91,
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(243,248,228,1),
                        borderRadius: BorderRadius.all(Radius.circular(25))
                      ),
                      child: Icon(
                        Icons.check_circle, 
                        color: Color.fromRGBO(127,211,32,1)
                      ),
                    ),
                    SizedBox(height: 20),
                    Text('Verification Success', style: TextStyle(
                      color: Color.fromRGBO(20,17,63,1),
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    )),
                    SizedBox(height: 10),
                    Text('Congrats your identity successfully verified',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(177,174,184,1)
                      )),
                    SizedBox(height: 30),
                    Container(
                      width: MediaQuery.of(context).size.width * .9,
                      child: FancyCard(
                        child: Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage: AssetImage('assets/me.png'),
                                  ),
                                  Image.asset('assets/match-icon.png', width: 40),
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage: FileImage(widget.image),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30),
                              Text('Score ${widget.score}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromRGBO(177,174,184,1),
                                  fontWeight: FontWeight.bold
                                )
                              ),
                              Text('Your selfie matched with your\npassport photo',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromRGBO(177,174,184,1)
                                )
                              ),
                              SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ),
                    ),              
                  ],
                ),
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(242,159,46,1),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Continue', 
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
              )
            )
          ],
        )
      ),
    );
  }
}