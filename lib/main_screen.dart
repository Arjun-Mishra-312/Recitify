import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:recitify/passages.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechScreen extends StatefulWidget {
  final String type;
  final String lvl;
  final String limit;
  final String userSpeech;
  SpeechScreen({this.type, this.limit, this.lvl, this.userSpeech});
  @override
  _SpeechScreenState createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  stt.SpeechToText _speech;
  bool _isListening = false;
  String _passage = '';
  String _passagenew = 'Test';
  String _text = '';
  String _txt = '';

  List wrongWords = [];
  List originalWords = [];
  int _confidence = 100;
  int wpm = 0;

  getList() {
    if (widget.type == 'Normal Reading' &&
        widget.lvl == 'Easy' &&
        widget.limit == '50 words') {
      _passage = (easy50.toList()..shuffle()).first;
    } else if (widget.type == 'Normal Reading' &&
        widget.lvl == 'Easy' &&
        widget.limit == '100 words') {
      _passage = (easy100.toList()..shuffle()).first;
    } else if (widget.type == 'Normal Reading' &&
        widget.lvl == 'Normal' &&
        widget.limit == '50 words') {
      _passage = (normal50.toList()..shuffle()).first;
    } else if (widget.type == 'Normal Reading' &&
        widget.lvl == 'Normal' &&
        widget.limit == '100 words') {
      _passage = (normal100.toList()..shuffle()).first;
    } else if (widget.type == 'Normal Reading' &&
        widget.lvl == 'Hard' &&
        widget.limit == '50 words') {
      _passage = (hard50.toList()..shuffle()).first;
    } else if (widget.type == 'Speech') {
      _passage = widget.userSpeech;
    } else {
      _passage = (hard100.toList()..shuffle()).first;
    }
  }

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    getList();
  }

  bool areListsEqual(List list1, List list2) {
    // check if both are lists
    wrongWords = list2.toSet().difference(list1.toSet()).toList();
    list1.removeRange(list2.length, list1.length);
    originalWords = list1.toSet().difference(list2.toSet()).toList();
    // check if elements are equal
    // for (int i = 0; i < list2.length; i++) {
    //   if ((list1[i]).toString().toLowerCase() !=
    //       list2[i].toString().toLowerCase()) {
    //     print(list2[i]);
    //     wrongWords.add(list1[i]);
    //   }
    // }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    // _passagenew = _passagenew.replaceAll(',', '**');

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFFF9EC),
        body: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 20, 0, 0),
                child: Text(
                  'Please press the Mic Button and Start Reading',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 310,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(79, 196, 255, 1.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(167, 246, 250, 1.0),
                        offset: const Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 20.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Color.fromRGBO(167, 246, 250, 1.0),
                        offset: const Offset(-5.0, -5.0),
                        blurRadius: 20.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      _passage,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CarouselSlider(
                items: [
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(136, 87, 201, 0.7),
                          offset: const Offset(
                            2.0,
                            0.0,
                          ),
                          blurRadius: 12.0,
                          spreadRadius: 1.0,
                        ), //BoxShadow
                        BoxShadow(
                          color: Color.fromRGBO(136, 87, 201, 0.7),
                          offset: const Offset(
                            -2.0,
                            0.0,
                          ),
                          blurRadius: 12.0,
                          spreadRadius: 1.0,
                        ), //BoxShadow
                      ],
                      color: Color.fromRGBO(136, 87, 201, 0.8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SingleChildScrollView(
                      child: _isListening
                          ? Text(
                              'Listening...',
                              style: TextStyle(color: Colors.grey.shade300),
                            )
                          : Text(
                              'Your Input:\n $_txt',
                              style: TextStyle(color: Colors.grey.shade300),
                            ),
                    ),
                  ),
                  Container(
                    height: 220,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(222, 38, 62, .7),
                          offset: const Offset(
                            2.0,
                            0.0,
                          ),
                          blurRadius: 12.0,
                          spreadRadius: 1.0,
                        ), //BoxShadow
                        BoxShadow(
                          color: Color.fromRGBO(222, 38, 62, .7),
                          offset: const Offset(-2.0, 0.0),
                          blurRadius: 12.0,
                          spreadRadius: 1.0,
                        ), //BoxShadow
                      ],
                      color: Color.fromRGBO(222, 38, 62, .8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Orignal Words',
                                  style: TextStyle(color: Colors.grey.shade200),
                                ),
                                Text(
                                  'Your Words',
                                  style: TextStyle(color: Colors.grey.shade200),
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: ListView.builder(
                                  itemCount: originalWords.length,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Text(
                                      '${originalWords[index]}',
                                      style: TextStyle(
                                          color: Colors.grey.shade200),
                                      textAlign: TextAlign.center,
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: wrongWords.length,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Text(
                                      '${wrongWords[index]}',
                                      style: TextStyle(
                                          color: Colors.grey.shade200),
                                      textAlign: TextAlign.center,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 220,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(101, 230, 87, 0.7),
                          offset: const Offset(
                            2.0,
                            0.0,
                          ),
                          blurRadius: 12.0,
                          spreadRadius: 1.0,
                        ), //BoxShadow
                        BoxShadow(
                          color: Color.fromRGBO(101, 230, 87, 0.7),
                          offset: const Offset(-2.0, 0.0),
                          blurRadius: 12.0,
                          spreadRadius: 1.0,
                        ), //BoxShadow
                      ],
                      color: Color.fromRGBO(101, 230, 87, 0.8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WPM\n$wpm',
                            style: TextStyle(
                                color: Colors.grey.shade200,
                                fontSize: 26,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'App\'s Accuracy\n$_confidence%',
                            style: TextStyle(
                                color: Colors.grey.shade200,
                                fontSize: 24,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          )
                        ]),
                  ),
                ],
                options: CarouselOptions(
                  height: 200.0,
                  enlargeCenterPage: true,
                  autoPlay: false,
                  aspectRatio: 16 / 9,
                  enableInfiniteScroll: true,
                  viewportFraction: 0.8,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: _listen,
              child: Icon(_isListening ? Icons.mic : Icons.mic_none),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back To Home Screen'),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  void _listen() async {
    _passagenew = _passage;
    _passagenew = _passagenew.replaceAll(',', '');
    _passagenew = _passagenew.replaceAll('.', '');
    _passagenew = _passagenew.replaceAll('?', '');
    // _passagenew = _passagenew.replaceAll('-', '');
    // _passagenew = _passagenew.replaceAll('-', '');
    // _passagenew = _passagenew.replaceAll('-', '');
    _passagenew = _passagenew.replaceAll(' the ', ' ');
    _passagenew = _passagenew.replaceAll(' is ', ' ');
    _passagenew = _passagenew.replaceAll(' to ', ' ');
    _passagenew = _passagenew.toLowerCase();
    int time = 0;
    List input = [];
    List defined = _passagenew.split(' ');
    Stopwatch stopwatch = new Stopwatch()..start();

    // print(defined);

    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) =>
            val == 'listening' ? print('onStatus: $val') : _isListening = false,
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() {
          _isListening = true;
          wrongWords = [];
          originalWords = [];
        });
        _speech.listen(
          partialResults: false,
          listenMode: stt.ListenMode.confirmation,
          onResult: (val) => setState(() {
            _txt = val.recognizedWords;
            _text = val.recognizedWords.replaceAll(' is ', ' ');
            _text = _text.replaceAll(' the ', ' ');
            _text = _text.replaceAll(' to ', ' ');
            _text = _text.toLowerCase();
            input = _text.split(' ');
            print(_txt);
            // print(input);
            time = stopwatch.elapsedMilliseconds - 1500;
            wpm = (input.length ~/ (time / 60000));
            areListsEqual(defined, input);
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = (val.confidence * 100).toInt();
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }
}
