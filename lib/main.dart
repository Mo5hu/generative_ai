import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('es', 'ES')
      ], // Add supported locales
      path:
          'assets/translations', // Path where your translation files are located
      fallbackLocale: Locale('en', 'US'), // Fallback locale
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates:
          context.localizationDelegates, // Make sure this line is present
      supportedLocales:
          context.supportedLocales, // Make sure this line is present
      locale: context.locale, // Make sure this line is present
      title: 'NLP and Translation App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

// Rest of your code

class MyHomePage extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();

  void _speak(String text) async {
    await flutterTts.setLanguage('en-US'); // Set the desired language
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('NLP and Translation')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Hello'.tr()), // Display translated text
            ElevatedButton(
              onPressed: () => _speak('Hello'.tr()), // Speak translated text
              child: Text('Speak'),
            ),
          ],
        ),
      ),
    );
  }
}
