import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class AudioPlayerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio Player App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AudioPlayerScreen(),
    );
  }
}

class AudioPlayerScreen extends StatefulWidget {
  @override
  _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  bool isPlaying = false;

  void _togglePlay() {
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Player'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You are listening to:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Lottie.asset(
              'assets/lottie/audio.json', // Replace with your Lottie animation file path
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _togglePlay,
        tooltip: isPlaying ? 'Pause' : 'Play',
        child: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
