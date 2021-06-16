import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

//fine code
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("elisa"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: ButtonBar(
                buttonHeight: 24.0,
                children: <Widget>[
                  TextButton(
                    //   style: flatButtonStyle,
                    onPressed: () {
                      cardB.currentState?.expand();
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      cardB.currentState?.toggleExpansion();
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ExpansionTileCard(
              key: cardB,
              expandedTextColor: Colors.red,
              trailing: Image.asset(
                'asset/images/add.png',
                height: 20,
                width: 20,
              ),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Text(
                    """CARD B""",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
