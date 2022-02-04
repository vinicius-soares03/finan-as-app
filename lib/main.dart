

import 'package:controle_financas/pages/emprestimos.dart';
import 'package:controle_financas/pages/gastos_fixos.dart';
import 'package:controle_financas/pages/gastos_gerais.dart';
import 'package:controle_financas/pages/login.dart';
import 'package:controle_financas/pages/home.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';


void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
   title: 'Zenits Finances',
   debugShowCheckedModeBanner: false,
   theme: ThemeData(
     canvasColor: const Color(0xFF01B8AA)
   ),
  
 
   
    localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate
  ],
  supportedLocales: [const Locale('pt', 'BR')],
routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/login': (context) => const Login(),
        '/home': (context) => const Home(),
      '/gastos_fixos':(context)=> const Gastos_fixos(),
        '/gastos_gerais':(context)=> const Gastos_gerais(),
        '/emprestimos':(context)=>Emprestimos(),
      


     
   
      },

      home:  const Login(),
    );

  }

}
