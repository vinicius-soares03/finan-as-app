import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
 
 
 
 
 
    return 
 
    Center(
      child: 
      
      Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        
        body: 
        Center(
            child: SingleChildScrollView(
              child:
        
           SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: LayoutBuilder(
                    builder: (_, constraints) {
                      return Column(
                        children: <Widget>[
                          Center(
                            child: Container(
                              //color: Colors.red,
                              
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10,top: 130),
                              //color: Colors.red,
                              height: constraints.maxHeight / 1.09,
                            
                                child: Column(
                                  
                                  children: <Widget>[
                                 
                                    Container(
                                      
                                      height: 60,
                                      child: Row(
                                        children: [
                                          Image.asset('assets/images/logo.png'),
                                          Container(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: const Text(
                                              'Zenits Finances',
                                              style: TextStyle(
                                                  fontSize: 40,
                                                  color: Color(0xFF01B8AA),
                                                  fontWeight: FontWeight.w900),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                 

                                    Container(
                                      padding: EdgeInsets.only(top: 60),
                                      //color: Colors.red,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          icon: Icon(
                                            Icons.email,
                                            color: Colors.grey,
                                          ),
                                          hintText: 'Email',
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2.0,
                                                color: Color(0xFF01B8AA)),
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 3.0,
                                                color: Color(0xFF01B8AA)),
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.only(top: 10, bottom:40),
                                      //color: Colors.red,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          icon: Icon(
                                            Icons.password_rounded,
                                            color: Colors.grey,
                                          ),
                                          hintText: 'Senha',
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2.0,
                                                color: Color(0xFF01B8AA)),
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 3.0,
                                                color: Color(0xFF01B8AA)),
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                      ),
                                    ),

                                   RaisedButton(
                                     elevation: 0,
                                      padding:
                                          EdgeInsets.only(left: 50, right: 50),
                                      child: Text(
                                        "Cadastre-se",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () {},
                                      color: Colors.grey[400],
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.grey,
                                        width: 2.0,
                                        ),
                                      ),
                                    ),

                                    RaisedButton(
                                      padding:
                                          EdgeInsets.only(left: 70, right: 70),
                                      child: Text(
                                        "Login",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () {
                                       Navigator.pushNamed(context, '/home');

                                      },
                                      color: Color(0xFF01B8AA),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.grey,
                                        width: 2.0
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                         
                        ],
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      ),),);
  }
}
