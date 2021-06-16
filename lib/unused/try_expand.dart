import 'package:flutter/material.dart';

class ExpandTileExtra extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ExpandTileExtra> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Container(

        child: Center(
          child: Column(
            children: [

              ButtonBar(
                buttonHeight: 24.0,
                children: <Widget>[
                  TextButton(
                    //   style: flatButtonStyle,
                    onPressed: () {
                    //  cardB.currentState?.expand();
                    },
                  ),

                  TextButton(
                    onPressed: () {
                     // cardB.currentState?.toggleExpansion();

                      ExpansionTile(
                        trailing: Image.asset(
                          'asset/images/pump.png',
                          height: 32,
                          width: 32,
                        ),
                        children: [
                          Column(
                            children: [
                              Text('exn'),
                              Image.asset('asset/images/add.png')
                            ],
                          )
                        ],
                        backgroundColor: Colors.red,
                        initiallyExpanded: false,

                      );
                    },
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'asset/images/add.png',
                          height: 32,
                          width: 32,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                trailing: Image.asset(
                  'asset/images/pump.png',
                  height: 32,
                  width: 32,
                ),
                children: [
                  Column(
                    children: [
                      Text('exn'),
                      Image.asset('asset/images/add.png')
                    ],
                  )
                ],
                backgroundColor: Colors.red,
                initiallyExpanded: false,

              ),




            ],
          ),
        ),

      )



    );
  }
}
