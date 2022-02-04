// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:math';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:controle_financas/pages/gastos_fixos.dart';
import 'package:http/http.dart' as http;
import 'package:controle_financas/models/despesas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Gastos_fixos extends StatefulWidget {
  const Gastos_fixos({Key? key}) : super(key: key);

  @override
  _Gastos_fixos createState() => _Gastos_fixos();
}
// class API {
//   postAPI() async {
//     const String url =
//         'https://api.hgbrasil.com/weather?key=78e4d8f1&city_name=SaoPau';
//     var response = await http.get(Uri.parse(url));

//     var weather = Weather.fromJson(jsonDecode(response.body)["results"]);

//     return weather.forecasts;
//   }
var isPressed = false;

API_post() async {
  String url =
      'https://financas-app-d4cef-default-rtdb.firebaseio.com/Usuarios/Brenda/Despesas/Gastos_fixos.json';
  var response = http.post(
    Uri.parse(url),
    body: jsonEncode(
      {
     
        'descricao': descricaoInput.text,
        'valor': valorInput.text,
        'data': vencimentoInput.text,
      },
    ),
  );
}

final despesas = [];
API_get() async {
  
  String url =
      'https://financas-app-d4cef-default-rtdb.firebaseio.com/Usuarios/Brenda/Despesas/Gastos_fixos.json';
final response = await http.get(Uri.parse(url));

if(json.decode(response.body) !=null){ 
 Map<String, dynamic> result = json.decode(response.body);
  despesas.clear();

  final temporario = [];
  temporario.clear();
  var aux = result.values.toList();
  //aux.map((e) => Despesas.fromJson(e).tag == 'Emprestimos');
  //var map = aux.map((e) => Despesas.fromJson(e).tag == 'Emprestimos');


  // pega a key que o Firebase gera, e inclue como id
 
 result.forEach((key, value) { 
   temporario.add({
        'id_banco': key,
        'descricao':Despesas.fromJson(value).descricao,
        'valor':Despesas.fromJson(value).valor,
        'data': Despesas.fromJson(value).data,
      });

 });
 
 despesas.addAll(temporario);

 

 
  
  
} 
}

API_delete(id_banco) async{
    String url =
      'https://financas-app-d4cef-default-rtdb.firebaseio.com/Usuarios/Brenda/Despesas/Gastos_fixos/$id_banco.json';
   final response = await http.delete(Uri.parse(url));


}
API_put(id_banco)async{
    String url =
      'https://financas-app-d4cef-default-rtdb.firebaseio.com/Usuarios/Brenda/Despesas/Gastos_fixos/$id_banco.json';
     var response = http.put(
    Uri.parse(url),
    body: jsonEncode(
      {
     
        'descricao': descricaoInput_edicao.text,
        'valor': valorInput_edicao.text,
        'data': vencimentoInput_edicao.text,
      },
    ),
  );
} 
    
    
  






TextEditingController descricaoInput = TextEditingController();
TextEditingController valorInput = TextEditingController();
TextEditingController vencimentoInput = MaskedTextController(mask: '00/00/0000');

TextEditingController descricaoInput_edicao = TextEditingController();
TextEditingController valorInput_edicao = TextEditingController();
TextEditingController vencimentoInput_edicao = MaskedTextController(mask: '00/00/0000');

// TextEditingController descricaoInput_edit = TextEditingController();
// TextEditingController valorInput_edit = TextEditingController();
// TextEditingController vencimentoInput_edit = TextEditingController();

class _Gastos_fixos extends State<Gastos_fixos> {
  //var isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        elevation: 0,
        backgroundColor: Color(0xFF01B8AA),
        title: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10),
              alignment: Alignment.topLeft,
              child: Text(
                'Olá Brenda !',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 4),
              alignment: Alignment.topLeft,
              child: Text(
                'Esses são seus gastos fixos',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        actions: [
          Container(
            //color: Colors.blue,
            padding: EdgeInsets.only(right: 7, top: 10, bottom: 3),
            child: Container(
              //color: Colors.white,
              padding: EdgeInsets.all(3.0),
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: Image.asset(
                'assets/images/logo.png',
              ),
            ),
          ),
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Expanded(child: Container(
              child: LayoutBuilder(
                builder: (_, constraints) {
                  return Column(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    color: Color(0xFF01B8AA),
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height * 0.08,
                                ),
                                Container(
                                    padding: EdgeInsets.only(
                                        left: 15, top: 22, bottom: 10),
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Gastos fixos',
                                          style: TextStyle(
                                              color: Color(0xFF888686),
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(right: 10),
                                          child: IconButton(
                                            iconSize: 40,
                                            splashColor: Colors.purple,
                                            onPressed: () async {
                                              await API_get();
                                              setState(() {
                                                Gastos_fixos();
                                              });
                                            },
                                            icon: Icon(Icons.sync_sharp),
                                          ),
                                        )
                                      ],
                                    )),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  width:
                                      MediaQuery.of(context).size.width * 0.95,
                                  child: despesas.isEmpty
                                      ? Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Não há gastos',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontFamily: 'Roboto',
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          ))
                                      : ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          reverse: false,
                                          itemCount: despesas.length,
                                          itemBuilder: (context,
                                              int index) {
                                                //final item = despesas[index];

                                            return Dismissible(
                                                background: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.green,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Icon(
                                                        Icons.done,
                                                        size: 40,
                                                        color: Colors.white,
                                                      )),
                                                ),
                                                secondaryBackground: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Container(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Icon(
                                                        Icons.delete,
                                                        size: 40,
                                                        color: Colors.white,
                                                      )),
                                                ),
                                                key: UniqueKey(),
                                                onDismissed: (direction) {
                                                  switch (direction) {
                                                    case DismissDirection
                                                        .endToStart:
                                                      setState(() {
                                                          API_delete(Despesas.fromJson( despesas[index]
                                                            ).id_banco);
                                                        despesas
                                                            .removeAt(index);
                                                        
                                                        Gastos_fixos();


                                                      });
                                                      break;
                                                    case DismissDirection
                                                        .startToEnd:
                                                      setState(() {});

                                                      break;

                                                    default:
                                                  }
                                                },
                                                child: GestureDetector(
                                                    onTap: () {
                                        
                                                       showBarModalBottomSheet(
                                              context: context,
                                              builder: (context) {

                                               return SingleChildScrollView(
      controller: ModalScrollController.of(context),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.68,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15), topLeft: Radius.circular(15)),
        ),
        child: Column(
          children: <Widget>[
            Container(
              color: Color(0xFF01B8AA),
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 15, bottom: 5),
              child: Text(
                'Editar Despesa',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 15, right: 25),
                child: Column(
                  children: <Widget>[
                    /////
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: 
                      
                      TextField(
                      
                        controller: descricaoInput_edicao,
                        decoration: InputDecoration(
                          
                        
                           hintText: '${Despesas.fromJson(despesas[index]).descricao}',
                            icon: Icon(Icons.text_fields)),
                      ),
                    ),
                    Container(
                      child: TextField(
                        
                        controller: valorInput_edicao,
                        decoration: InputDecoration(
                          hintText: '${Despesas.fromJson(despesas[index]).valor}',
                           
                            icon: Icon(Icons.attach_money_rounded)),
                      ),
                    ),
                    Container(
                      child: TextField(
                        controller: vencimentoInput_edicao,
                        decoration: InputDecoration(
                          hintText: '${Despesas.fromJson(despesas[index]).data}',
                          
                          icon: Icon(Icons.insert_invitation_rounded),
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(top: 15),
                      child: RaisedButton(
                        padding: EdgeInsets.only(
                          left: 70,
                          right: 70,
                        ),
                        child: Text(
                          "Editar",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                        
                          setState(() {
                           
                            API_put(Despesas.fromJson(despesas[index]).id_banco);
                            descricaoInput_edicao.clear();
                            valorInput_edicao.clear();
                            vencimentoInput_edicao.clear();
                        
                            
                          });
                        },
                        color: Color(0xFF01B8AA),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.grey, width: 2.0),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
                                              },
                                            );
                                                      
                                                    },
                                                    child: Card(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            width: 2.0,
                                                            color: Colors.grey),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                      ),
                                                      elevation: 2,
                                                      color: Colors.white,
                                                      child: Row(
                                                        // crossAxisAlignment:
                                                        //     CrossAxisAlignment.start,
                                                        children: <Widget>[
                                                          Container(
                                                            height: 27,
                                                            padding:
                                                                EdgeInsets.all(
                                                                    2),
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                          ),
                                                          Container(
                                                            //alignment:AlignmentDirectional.bottomStart,
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 5),
                                                            child: Icon(
                                                              Icons
                                                                  .monetization_on_rounded,
                                                              color: Colors
                                                                  .green[800],
                                                              size: 40,
                                                            ),
                                                          ),
                                                          Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 10),
                                                            height: 80,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  child: Text(
                                                                    '${despesas.map((e) => Despesas.fromJson(e).descricao).toList()[index]}',
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                ),
                                                                Container(
                                                                    child: Text(
                                                                  '${despesas.map((e) => Despesas.fromJson(e).valor).toList()[index]}',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                              .green[
                                                                          400],
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ))
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: SizedBox(
                                                              height: 10,
                                                            ),
                                                          ),
                                                          
                                                         
                                                          Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right: 10),
                                                            height: 80,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Container(
                                                                  child: Text(
                                                                    'Vencimento',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .grey,
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                                Container(
                                                                    child: Text(
                                                                  '${despesas.map((e) => Despesas.fromJson(e).data).toList()[index]}',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .grey,
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ))
                                                              ],
                                                            ),
                                                          ),
                                                           
                                                        ],
                                                      ),
                                                    )));
                                          }),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.only(right: 13, top: 10),
                                      child: FloatingActionButton(
                                        heroTag: null,
                                        onPressed: () {
                                          setState(() {
                                            showBarModalBottomSheet(
                                              context: context,
                                              builder: (context) {
                                                isScrollControlled:
                                                true;
                                                return ModalBottomSheet();
                                              },
                                            );
                                          });
                                        },
                                        backgroundColor: Color(0xFF01B8AA),
                                        child: Icon(Icons.add),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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

  Widget ModalBottomSheet() {
    return SingleChildScrollView(
      controller: ModalScrollController.of(context),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.68,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15), topLeft: Radius.circular(15)),
        ),
        child: Column(
          children: <Widget>[
            Container(
              color: Color(0xFF01B8AA),
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 15, bottom: 5),
              child: Text(
                'Cadastrar Despesas',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 15, right: 25),
                child: Column(
                  children: <Widget>[
                    /////
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: TextField(
                        controller: descricaoInput,
                        decoration: InputDecoration(
                            hintText: 'Descrição',
                            icon: Icon(Icons.text_fields)),
                      ),
                    ),
                    Container(
                      child: TextField(
                        
                        controller: valorInput,
                        decoration: InputDecoration(
                            hintText: 'Valor',
                            icon: Icon(Icons.attach_money_rounded)),
                      ),
                    ),
                    Container(
                      child: TextField(
                        controller: vencimentoInput,
                        decoration: InputDecoration(
                          hintText: 'Vencimento',
                          icon: Icon(Icons.insert_invitation_rounded),
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(top: 15),
                      child: RaisedButton(
                        padding: EdgeInsets.only(
                          left: 70,
                          right: 70,
                        ),
                        child: Text(
                          "Cadastrar",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          await API_post();
                          await API_get();
                          setState(() {
                            descricaoInput.clear();
                            valorInput.clear();
                            vencimentoInput.clear();
                            Gastos_fixos();
                          });
                        },
                        color: Color(0xFF01B8AA),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.grey, width: 2.0),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
  
}
