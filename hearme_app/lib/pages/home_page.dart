import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final SpeechToText _speechToText = SpeechToText();

  bool _speechEnable = false;
  String _wordSpoken = "";
  double _confidenceLevel = 0;

  @override
  void initState() {
    super.initState();
    initSpeech();
  }

  void initSpeech() async {
    _speechEnable = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {
      _confidenceLevel = 0;
    });
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(result) {
    // this function generate result from recording
    print(result);
    setState(() {
      _wordSpoken = result.SpeechRecognitionWords;
      _confidenceLevel = result.confidence;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.red,
      title: Text(
        'Hearme',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
    body: Center(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Text(_speechToText.isListening ?
            "Listening..." : _speechEnable ?
            "Tap the microphone to start listening" : "Speech not available",
            style: const TextStyle(fontSize: 20.0, color: Colors.black),
            ),
          ),
          Expanded(child: Container(
            padding: EdgeInsets.all(16),
            child: Text(_wordSpoken,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w300
            ),),
          )),
          if (_speechToText.isNotListening && _confidenceLevel > 0)
            Text(
              "Confidence : ${(_confidenceLevel * 100).toStringAsFixed(1)}",
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            )
        ],
      ),
    ),
      floatingActionButton: FloatingActionButton(onPressed:
        _speechToText.isListening ? _stopListening : _startListening,
        tooltip: "Listen",
        child: Icon(
          _speechToText.isNotListening ? Icons.mic_off : Icons.mic,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
      ),
    );
  }
}
