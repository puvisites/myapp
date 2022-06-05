  import 'dart:io';
  import 'package:flutter/services.dart';
  import 'package:flutter/material.dart';
  import 'package:splash_screen_view/SplashScreenView.dart';
  
  
  
  
  import 'package:myapp/src/pages/entrypoint/page.dart';
  import 'package:teta_cms/teta_cms.dart';

  ///NOTE:
  ///if you have an error while running <flutter run> 
  ///run <flutter pub upgrade> and than <flutter run --no-sound-null-safety>
  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    await TetaCMS.initialize(
      token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InRhcmZyYW1ld29ya0BnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwicHJvamVjdHMiOlsxMjgwODYsMTI4ODI0XSwiaW1hZ2UiOiJodHRwczovL2xoMy5nb29nbGV1c2VyY29udGVudC5jb20vYS0vQU9oMTRHaGVnUm1idGZ5UG1GRzMxTjdrTFVLRlhOMFVJdE10enVrWUJNR3YxQT1zOTYtYyIsIm5hbWUiOiJ0YXIgZnJhbWV3b3JrIiwiZW1pdHRlciI6IlRldGEtQXV0aCIsImlhdCI6MTY1NDQ0ODAyNiwiZXhwIjo0ODEwMjA4MDI2fQ.IdysuiLozHs78pNb0ibIOW8JZFs9lsC7x3Tkj7SYZLE',
      prjId: 128824,
    );
    
    
    
    
    runApp(MyApp());
  }
  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Untitled',
        home: SplashScreenView(
          navigateRoute: PageEntryPoint(),
          duration: 2200,
          imageSize: 80,
          imageSrc: 'assets/teta-app.png',
          text: '',
          textType: TextType.NormalText,
          textStyle: TextStyle(
            fontSize: 30.0,
          ),
          backgroundColor: Colors.black,
        ),
      );
    }
  }
  