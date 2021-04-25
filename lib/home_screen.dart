import 'package:flutter/material.dart';
import 'package:recitify/main_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _chosenType;
  String _choosenlvl;
  String _choosenlimit;
  String _speech;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF9BE7C),
                  image: DecorationImage(
                      image: AssetImage("asset/Home_screen.png"),
                      fit: BoxFit.cover),
                  // borderRadius: BorderRadius.only(
                  //   bottomRight: Radius.circular(40.0),
                  //   bottomLeft: Radius.circular(40.0),
                  // ),
                ),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 90,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          image: DecorationImage(
                              image: AssetImage("asset/Logo.png"),
                              fit: BoxFit.cover),
                          // borderRadius: BorderRadius.only(
                          //   bottomRight: Radius.circular(40.0),
                          //   bottomLeft: Radius.circular(40.0),
                          // ),
                        ),
                      ),
                      Text(
                        'Please Select Your Desired Options',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(245, 100, 100, 0.9),
                        ),
                      ),
                      DropdownButton<String>(
                        focusColor: Colors.white,
                        value: _chosenType,
                        dropdownColor: Color(0xffffb969),
                        //elevation: 5,
                        style: TextStyle(color: Colors.white),
                        iconEnabledColor: Color.fromRGBO(245, 100, 100, 0.9),
                        items: <String>['Normal Reading', 'Speech']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                  color: Color.fromRGBO(245, 100, 100, 0.9),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700),
                            ),
                          );
                        }).toList(),
                        hint: Text(
                          "Please Select The Type    ",
                          style: TextStyle(
                              color: Color.fromRGBO(245, 100, 100, 0.9),
                              fontSize: 25,
                              fontWeight: FontWeight.w700),
                        ),
                        onChanged: (String value) {
                          setState(
                            () {
                              _chosenType = value;
                              _choosenlimit = null;
                              _choosenlvl = null;
                            },
                          );
                        },
                      ),
                      _chosenType != 'Speech'
                          ? IgnorePointer(
                              ignoring: _chosenType == 'Speech',
                              child: DropdownButton<String>(
                                focusColor: Colors.white,
                                value: _choosenlvl,
                                dropdownColor: Color(0xffffb969),
                                //elevation: 5,
                                style: TextStyle(color: Colors.white),
                                iconEnabledColor:
                                    Color.fromRGBO(245, 100, 100, 0.9),
                                items: <String>[
                                  'Easy',
                                  'Normal',
                                  'Hard',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                          color: Color.fromRGBO(
                                              245, 100, 100, 0.9),
                                          fontSize: 25,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  );
                                }).toList(),
                                hint: _chosenType != 'Speech'
                                    ? Text(
                                        "Please Select Difficulty Level",
                                        style: TextStyle(
                                          color: Color.fromRGBO(
                                              245, 100, 100, 0.9),
                                          fontSize: 22,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )
                                    : Text(
                                        "Speech                                    ",
                                        style: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontSize: 22.7,
                                            fontWeight: FontWeight.w700),
                                      ),
                                onChanged: (String value) {
                                  setState(
                                    () {
                                      _choosenlvl = value;
                                    },
                                  );
                                },
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                color: Color(0xffffb969),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Your Speech',
                                  labelStyle: TextStyle(
                                    color: Color.fromRGBO(245, 100, 100, 0.9),
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  hintText: 'Please Enter Your Speech Here',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter a name';
                                  }
                                },
                                onChanged: (value) {
                                  setState(() {
                                    _speech = value;
                                  });
                                },
                              ),
                            ),
                      _chosenType != 'Speech'
                          ? IgnorePointer(
                              ignoring: _chosenType == 'Speech',
                              child: DropdownButton<String>(
                                focusColor: Colors.white,
                                value: _choosenlimit,
                                dropdownColor: Color(0xffffb969),
                                //elevation: 5,
                                style: TextStyle(color: Colors.white),
                                iconEnabledColor:
                                    Color.fromRGBO(245, 100, 100, 0.9),
                                items: <String>[
                                  '50 words',
                                  '100 words',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                          color: Color.fromRGBO(
                                              245, 100, 100, 0.9),
                                          fontSize: 26,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  );
                                }).toList(),
                                hint: _chosenType != 'Speech'
                                    ? Text(
                                        "Please Select A Word Limit ",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                245, 100, 100, 0.9),
                                            fontSize: 22.7,
                                            fontWeight: FontWeight.w700),
                                      )
                                    : Text(
                                        "Speech                                    ",
                                        style: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontSize: 22.7,
                                            fontWeight: FontWeight.w700),
                                      ),
                                onChanged: (String value) {
                                  setState(
                                    () {
                                      _choosenlimit = value;
                                    },
                                  );
                                },
                              ),
                            )
                          : Container(),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SpeechScreen(
                                        lvl: _choosenlvl,
                                        limit: _choosenlimit,
                                        type: _chosenType,
                                        userSpeech: _speech,
                                      )));
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 22.7,
                              fontWeight: FontWeight.w700),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffffb969),
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          elevation: 5,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
