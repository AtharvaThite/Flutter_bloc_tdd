import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_tdd/core/common/app/providers/user_provider.dart';
import 'package:flutter_bloc_tdd/core/res/colours.dart';
import 'package:flutter_bloc_tdd/core/res/fonts.dart';
import 'package:flutter_bloc_tdd/core/service/injection_container.dart';
import 'package:flutter_bloc_tdd/core/service/router.dart';
import 'package:flutter_bloc_tdd/firebase_options.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance
      // Your personal reCaptcha public key goes here:
      .activate(
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.debug,
    // webProvider: ReCaptchaV3Provider(kWebRecaptchaSiteKey),
  );
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Education App',
        theme: ThemeData(
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorScheme: ColorScheme.fromSwatch(
            accentColor: Colours.primaryColor,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
          ),
          fontFamily: Fonts.poppins,
        ),
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
