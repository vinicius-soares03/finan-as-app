import 'package:controle_financas/pages/gastos_fixos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:table_calendar/table_calendar.dart';

bool isvible = true;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  @override
  var isPressed = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leading: Container(
          //color: Colors.grey,
          padding: const EdgeInsets.only(left: 5, right: 10),
          child: Image.asset('assets/images/logo.png'),
        ),
        elevation: 0,
        title: Container(
          child: Text('Zenits Finances',
              style: TextStyle(
                  fontSize: 30,
                  color: Color(0xFF01B8AA),
                  fontWeight: FontWeight.w900)),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 13),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: Color(0xFF01B8AA),
                size: 50,
              ),
            ),
          )
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            // ignore: avoid_unnecessary_containers
            Expanded(child: Container(
              child: LayoutBuilder(
                builder: (_, constraints) {
                  return Column(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          width: constraints.maxWidth,
                          height: constraints.maxHeight / 1,
                          color: const Color(0xFFE5E5E5),
                          child: Column(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Container(
                                    //height: MediaQuery.of(context).size.height*0.25,
                                    padding: EdgeInsets.only(top: 30),
                                    color: Colors.white,
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          children: [
                                            Container(
                                                padding:
                                                    EdgeInsets.only(left: 10),
                                                alignment: Alignment.centerLeft,
                                                //height: 250,
                                                //width: constraints.maxWidth,
                                                // color: Colors.white,
                                                child: isPressed
                                                    ? Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors.grey,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.4,
                                                        child: SizedBox(
                                                            height: 20))
                                                    : Text(
                                                        "RS 1.808,80",
                                                        style: TextStyle(
                                                          fontSize: 30,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.black,
                                                        ),
                                                      )),
                                            Container(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    isPressed = !isPressed;
                                                  });
                                                },
                                                icon: Icon(
                                                  isPressed
                                                      ? Icons.visibility_off
                                                      : Icons.remove_red_eye,
                                                  size: 30,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            TextButton(
                                                onPressed: () {},
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                      bottom: 55),
                                                  child: Text(
                                                    'Ver gastos',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xFF01B8AA)),
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                  //////##

                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 8, right: 8, top: 150),
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 100,
                                            child: RaisedButton(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                side: BorderSide(
                                                    color: Color(0xFFD8D4D4),
                                                    width: 3.0),
                                              ),
                                              elevation: 0,
                                              color: Colors.white,
                                              onPressed: () {
                                                Navigator.pushNamed(context, '/gastos_fixos');
                                              },
                                              child: Column(
                                                children: <Widget>[
                                                  Container(
                                                      padding: EdgeInsets.only(
                                                          top: 15),
                                                      child: IconButton(
                                                        color:
                                                            Color(0xFF01B8AA),
                                                        onPressed: () {
                                                          print(despesas);
                                                          Navigator.pushNamed(
                                                              context,
                                                              '/gastos_fixos');
                                                        },
                                                        icon: Icon(
                                                          Icons
                                                              .attach_money_rounded,
                                                          size: 40,
                                                        ),
                                                      )),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        top: 10),
                                                    child: Text(
                                                      'Gastos Fixos',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 100,
                                            child: RaisedButton(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                side: BorderSide(
                                                    color: Color(0xFFD8D4D4),
                                                    width: 3.0),
                                              ),
                                              elevation: 0,
                                              color: Colors.white,
                                              onPressed: () { Navigator.pushNamed(context, '/emprestimos');},
                                              child: Column(
                                                children: <Widget>[
                                                  Container(
                                                      padding: EdgeInsets.only(
                                                          top: 15),
                                                      child: IconButton(
                                                        color:
                                                            Color(0xFF01B8AA),
                                                        onPressed: () {
                                                          Navigator.pushNamed(
                                                              context,
                                                              '/emprestimos');
                                                        },
                                                        icon: Icon(
                                                          Icons
                                                              .compare_arrows_sharp,
                                                          size: 40,
                                                        ),
                                                      )),
                                                  Container(
                                                      padding: EdgeInsets.only(
                                                          top: 10),
                                                      child: Text(
                                                        'Emprestimos',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 100,
                                            child: RaisedButton(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                side: BorderSide(
                                                    color: Color(0xFFD8D4D4),
                                                    width: 3.0),
                                              ),
                                              elevation: 0,
                                              color: Colors.white,
                                              onPressed: () { Navigator.pushNamed(context, '/gastos_gerais');},
                                              child: Column(
                                                children: <Widget>[
                                                  Container(
                                                      padding: EdgeInsets.only(
                                                          top: 15),
                                                      child: IconButton(
                                                        color:
                                                            Color(0xFF01B8AA),
                                                        onPressed: () {
                                                          Navigator.pushNamed(context, '/gastos_gerais');
                                                        },
                                                        icon: Icon(
                                                          Icons
                                                              .payments_outlined,
                                                          size: 40,
                                                        ),
                                                      )),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        top: 10),
                                                    child: Text(
                                                      'Gastos Gerais',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 15, top: 18),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Calendário Financeiro',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black),
                                ),
                              ),
                              Container(
                                padding:
                                    EdgeInsets.only(top: 10, left: 8, right: 8),
                                // height:
                                //     MediaQuery.of(context).size.height * 0.38,
                                width: MediaQuery.of(context).size.width,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Color(0xFFD8D4D4),
                                      )),
                                  child: TableCalendar(
                                    locale: 'pt_BR',
                                    headerStyle: HeaderStyle(),
                                    rowHeight: 40,
                                    calendarStyle: CalendarStyle(),
                                    firstDay: DateTime.utc(2010, 10, 16),
                                    lastDay: DateTime.utc(2030, 3, 14),
                                    focusedDay: DateTime.now(),
                                  ),
                                ),
                              ),
                            ], //*
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ))
          ],
        ),
      ),
    );
  }
}
