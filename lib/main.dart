import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(FlutterLocalization());
}

class FlutterLocalization extends StatelessWidget {
  const FlutterLocalization({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Localizations Sample App',
      locale: Locale('es '),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('es'),
        // Locale('np')
        // Spanish
      ],
      home: FlutterLocal(),
    );
  }
}

class FlutterLocal extends StatefulWidget {
  const FlutterLocal({super.key});

  @override
  State<FlutterLocal> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<FlutterLocal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
              itemBuilder: ((BuildContext context) => <PopupMenuEntry>[
                    PopupMenuItem(
                      //value: ,
                      child: Text('english '),
                    ),
                    PopupMenuItem(child: Text('nepali '))
                  ]))
        ],
        // The [AppBar] title text should update its message
        // according to the system locale of the target platform.
        // Switching between English and Spanish locales should
        // cause this text to update.
        title: Text(AppLocalizations.of(context)!.helloWorld),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Add the following code
            Localizations.override(
              context: context,

              // Using a Builder to get the correct BuildContext.
              // Alternatively, you can create a new widget and Localizations.override
              // will pass the updated BuildContext to the new widget.
              child: Builder(
                builder: (context) {
                  // A toy example for an internationalized Material widget.
                  return CalendarDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                    onDateChanged: (value) {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyWidget());
// }

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(localizationsDelegates: [
//       AppLocalizations.delegate, // Add this line
//       GlobalMaterialLocalizations.delegate,

//       GlobalWidgetsLocalizations.delegate,
//       GlobalCupertinoLocalizations.delegate,
//     ], supportedLocales: [
//       Locale('en'), // English
//       Locale('es'), // Spanish
//       Locale('np') //nepali
//     ], home: Myhome());
//   }
// }

// class Myhome extends StatelessWidget {
//   const Myhome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }
