import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_speech/google_speech.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sound_stream/sound_stream.dart';

class TensorflowTestScreen extends StatefulWidget {
  const TensorflowTestScreen({super.key});

  @override
  State<TensorflowTestScreen> createState() => _TensorflowTestScreenState();
}

class _TensorflowTestScreenState extends State<TensorflowTestScreen> {
  final RecorderStream _recorder = RecorderStream();

  bool recognizing = false;
  bool recognizeFinished = false;
  String text = '';
  StreamSubscription<List<int>>? _audioStreamSubscription;
  BehaviorSubject<List<int>>? _audioStream;

  @override
  void initState() {
    super.initState();

    _recorder.initialize();
  }

  void streamingRecognize() async {
    _audioStream = BehaviorSubject<List<int>>();
    _audioStreamSubscription = _recorder.audioStream.listen((event) {
      _audioStream!.add(event);
    });

    await _recorder.start();

    setState(() {
      recognizing = true;
    });
    // final serviceAccount = ServiceAccount.fromFile(
    //     File('/assets/ferrous-byway-380111-054b87112b40.json'));
    final serviceAccount =
        ServiceAccount.fromString(r'''{"type": "service_account",
  "project_id": "ferrous-byway-380111",
  "private_key_id": "054b87112b40de8997b64cdb9024d41a8f72d5f0",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDs+Fam+NebUN7e\n645XZGf++H90ZOBnEf4r4MevctQqT2obZaIPtN1sdkFgiFw4LfZnwbGBoLDjZ0at\nyrPPewmktxNXGl+/SVfqtaS6640Ati7UVI9dcxKK7QuN+qrbl+38vsv6wPYQRHEV\nII0oUg9X6Ljl6ZQFajxqDmgtivPpDywUyb9i5bn1Son3UTVooDtWWBTPTJAaDsaC\nOxkhaKf/UnD2MMBjKPPCZAta9z37jNAYmpeva2BSW1s/Yd9tySuhlFGpHWQNH/1+\ndKsRXPpEjZWoCEGEJLM6AOXXn3Idl+EyhyL1lz6nSSIxpdVEf0uFxe7gkXWRHUYc\n0Oy9RKeHAgMBAAECggEAJTFkdv2HPZ8888kN72/YwL84+0hFTk1tKBmLeIvxz+2P\nTlsudf+htz8noLfrnX0H98istxdFBtQerEgB3oFFsLQeqs+pZ9O3ovo9L4H+q2DC\nIIe1yWmLvKwFjGm4/RFaBDmKuMHQ0m8jk+N8NEVjl3J1Ps9hRlOicCpFtfbhXy/k\nmyXWr8KRaui9cQs9ACT95BkclYX/6ZfQhDVr3UgrFyQij2JQfySo0aNKP6onUcZM\n3SVBKY84Vu/4SfcLqcmZM0ZULD5KdJy6a/S0460r0qHoWcFoNu11Q1oGBgn2gXH/\nPzlCHem1apQM4dmMktL+iLUEoPzN7rzP2R9MMqRbcQKBgQD7HuXiWuYwxyVSqDku\nk1YkIRxIb5ebfPKvj9NsHfrclQq3o8/ok0jHGQnzqfTbMJquKPXZs5S6i9i58WCR\nYhcRaMnIjZYp+xH228CwOoFRcMXreYRd69tcUBt6CCA3J06BEjx56npAZbZ6G1/S\nYa6/Le/0qZGQNRrodhPe8GUAMQKBgQDxkw3CATn9HMDQaV7yj5IS1XC+GftLTtta\nj/NOlpPAbHPGQkIeK72uUL2I2E0g5VP72MCJzHWM40specp+nk2eRoY7ef/B87ZF\nTXabMsrDzE7QcD/4k0Ndp5m0AAuM/Yh2FYkslFYhqyGSUzrDjtmOlhdkCJCVRxn/\nsXhEvdktNwKBgFxo+WW715u5nTV2rFxEYd23xYWucxcH+vK6Na5Ctg84VZJQmPDY\nSl7iCvR85ZtHnpRahGZRnHitf9qlRckaVKzWZ/MCj3DxcKHsKlNvpCkJG/xUYm6B\nnd6xp/rXRKunLk93G4Qt0kEibO0wZ6muwrSdvgDF6cgskrNayGMxCanxAoGAAWtM\nvGQHdC40D8VesmwXfpbUZ7l9WW7oKPsJgd+ulIXOlE6VVtoI7jo5MtGaemP+f09B\nqk2SLzaynVbC0sWZTSG67iSEVR5aZsPSu4yr1kSf/ed66LnsvmMaqw0JBFYE9DSi\nLqnca6w2sUZd5QI00vqcvpCyUL4vL+pZ+4Vl/jcCgYATUvzuVHXrrs48On9LWZ+E\n2oymRl1YgM509vdPcnG3xDpN0cVnmF2NfFwWte/BcKmJuPkbhfQkw0ZI/9bUBSI/\n5r/TxVLafaQlhhT4/+uyuknvtyK1FUbYit8MV28BxPTGN93lbkrfm4i2aWWKwV9W\n08TiPYwCeJaZZX3vSvMndw==\n-----END PRIVATE KEY-----\n",
  "client_email": "digihow@ferrous-byway-380111.iam.gserviceaccount.com",
  "client_id": "114214914718587710709",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/digihow%40ferrous-byway-380111.iam.gserviceaccount.com"}''');

    final speechToText = SpeechToText.viaServiceAccount(serviceAccount);
    final config = _getConfig();

    final responseStream = speechToText.streamingRecognize(
        StreamingRecognitionConfig(config: config, interimResults: true),
        _audioStream!);

    var responseText = '';

    responseStream.listen((data) {
      final currentText =
          data.results.map((e) => e.alternatives.first.transcript).join('\n');

      if (data.results.first.isFinal) {
        responseText += '\n$currentText';
        setState(() {
          text = responseText;
          recognizeFinished = true;
        });
      } else {
        setState(() {
          text = '$responseText\n$currentText';
          recognizeFinished = true;
        });
      }
    }, onDone: () {
      setState(() {
        recognizing = false;
      });
    });
  }

  void stopRecording() async {
    await _recorder.stop();
    await _audioStreamSubscription?.cancel();
    await _audioStream?.close();
    setState(() {
      recognizing = false;
    });
  }

  RecognitionConfig _getConfig() => RecognitionConfig(
      encoding: AudioEncoding.LINEAR16,
      model: RecognitionModel.basic,
      enableAutomaticPunctuation: true,
      sampleRateHertz: 16000,
      languageCode: 'ko-KR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio File Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            if (recognizeFinished)
              _RecognizeContent(
                text: text,
              ),
            ElevatedButton(
              onPressed: recognizing ? stopRecording : streamingRecognize,
              child: recognizing
                  ? const Text('Stop recording')
                  : const Text('Start Streaming from mic'),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class _RecognizeContent extends StatelessWidget {
  final String? text;

  const _RecognizeContent({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          const Text(
            'The text recognized by the Google Speech Api:',
          ),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            text ?? '---',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
