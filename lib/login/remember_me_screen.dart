import 'package:flutter/material.dart';

import '../strings.dart';

class RememberMe extends StatefulWidget {
  @override
  _RememberMeState createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Transform.scale(
              scale: 0.8,
              child: Checkbox(
                value: false,
                onChanged: (bool value) {
                  setState(() {});
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.0),
              child: Text(
                Strings.remember,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Text(
              Strings.forgot_password,
              style: TextStyle(
                  color: const Color(0xFFEFEFEF648CBF),
                  fontSize: 16),
            ),
          ],
        ),
      ),

    );
  }
}
