import 'package:flutter/material.dart';

class ListViews extends StatefulWidget {
  @override
  _ChildState createState() => _ChildState();
}

class _ChildState extends State<ListViews> {
  @override
  Widget build(BuildContext context) {
    var str = [
      "XYLOPHONE",
      "YACHT",
      "ZEBRA",
      "ZEBRA",

    ];
    var images = [
      "https://previews.123rf.com/images/djmilic/djmilic1506/djmilic150600243/41125671-xylophone-with-rainbow-colored-keys-and-with-two-wood-drum-sticks-3d-render-isolated-on-white-backgr.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCUccF316xfYC_UPtCGXxdhH_c8NYhTPT-XjGD4DBBUu-GQh-S",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCUccF316xfYC_UPtCGXxdhH_c8NYhTPT-XjGD4DBBUu-GQh-S",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCUccF316xfYC_UPtCGXxdhH_c8NYhTPT-XjGD4DBBUu-GQh-S",

    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("ALPHABETS"),
      ),
      body: ListView.builder(
        itemCount: str.length,
        itemBuilder: (context, index) {
          return Container(

            margin: EdgeInsets.only(left: 16, right: 16, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        str[index].substring(0, 1),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                     // Text(str[index]),
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    height: 50,
                    width: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.network(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}