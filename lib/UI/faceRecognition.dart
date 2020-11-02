import 'dart:io';
import 'package:facerecog/API/api.dart';
import 'package:facerecog/UI/verificationSuccess.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'fancyCard.dart';

class FaceRecognition extends StatefulWidget {
  FaceRecognition({Key key}) : super(key: key);

  @override
  _FaceRecognitionState createState() => _FaceRecognitionState();
}

class _FaceRecognitionState extends State<FaceRecognition> {

  File _image;
  final picker = ImagePicker();
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

  Future getImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.camera,
      imageQuality: 40
    );

    _image = File(pickedFile.path);

    showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (BuildContext bc){
        return Container(
          child: Column(
            children: [
              SizedBox(height: 30),
              CircularProgressIndicator(),
              SizedBox(height: 30),
              Text('Verifying ...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(177,174,184,1),
                  fontSize: 20
                )
              ),
            ],
          ),
        );
      }
    );

    var _matchFace = await API().matchFace(_image.path);
    if (_matchFace == null) {
      Navigator.pop(context);
      return _scaffold.currentState.showSnackBar(SnackBar(content: Text('Oops, something went wrong')));
    } else if (_matchFace != null && _matchFace['confidence'] == null) {
      print(_matchFace);
      
      Navigator.pop(context);
      return _scaffold.currentState.showSnackBar(SnackBar(content: Text('Oops, something went wrong')));
    }

    // confidence
    print(_matchFace);
    print(_matchFace['confidence']);
    
    Navigator.pop(context);

    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (context, animation, anotherAnimation) {
        return VerificationSuccess(image: _image,score: _matchFace['confidence']);
      },
      transitionDuration: Duration(milliseconds: 2000),
      transitionsBuilder: (context, animation, anotherAnimation, child) {
        animation = CurvedAnimation(
            // curve: _curveList[1],
            curve: Curves.linear,
            parent: animation);
        return Align(
          child: FadeTransition(

            // size transition
            // sizeFactor: animation,
            // axisAlignment: 0.0,

            // slide transition
            // position: Tween(
            //   begin: Offset(1.0, 0.0),
            //   end: Offset(0.0, 0.0)
            // ).animate(animation),
            opacity: animation,
            child: child,
          ),
        );
      }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
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
                    Text('Take Selfie', style: TextStyle(
                      color: Color.fromRGBO(20,17,63,1),
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    )),
                    SizedBox(height: 30),
                    Text('We use your selfie to compare with\nyour passport photo',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(177,174,184,1)
                      )),
                    SizedBox(height: 30,),
                    Container(
                      width: MediaQuery.of(context).size.width * .9,
                      child: FancyCard(
                        child: Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset('assets/icon.png'),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 10),
                                      Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(126,210,33,1),
                                          borderRadius: BorderRadius.circular(12.5)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text('1', style: TextStyle(
                                            color: Colors.white
                                          ), textAlign: TextAlign.center),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Good lighting', style: TextStyle(
                                            color: Color.fromRGBO(20,17,63,1),
                                            fontWeight: FontWeight.bold
                                          )),
                                          SizedBox(height: 5),
                                          Container(
                                            width: MediaQuery.of(context).size.width * .7,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Text('Make sure you are in a well lit area and both ears are uncovered', 
                                                    style: TextStyle(
                                                    color: Color.fromRGBO(177,174,184,1)
                                                  )),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 15,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 10),
                                      Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(126,210,33,1),
                                          borderRadius: BorderRadius.circular(12.5)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text('2', style: TextStyle(
                                            color: Colors.white
                                          ), textAlign: TextAlign.center),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Look straight', style: TextStyle(
                                            color: Color.fromRGBO(20,17,63,1),
                                            fontWeight: FontWeight.bold
                                          )),
                                          SizedBox(height: 5),
                                          Container(
                                            width: MediaQuery.of(context).size.width * .7,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Text('Hold your phone at eye level and look straight to the camera', 
                                                    style: TextStyle(
                                                    color: Color.fromRGBO(177,174,184,1)
                                                  )),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )
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
              onPressed: () async => await getImage(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(242,159,46,1),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Open Camera', 
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