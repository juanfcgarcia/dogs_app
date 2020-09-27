import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String path;
  final String lblTitle;
  final String lblSubtitle;

  const Labels({
    Key key,
    @required this.path,
    @required this.lblTitle,
    @required this.lblSubtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(this.lblTitle,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w300)),
          SizedBox(height: 10),
          GestureDetector(
              child: Text(
                this.lblSubtitle,
                style: TextStyle(
                    color: Colors.blue[600],
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, this.path);
              })
        ],
      ),
    );
  }
}
