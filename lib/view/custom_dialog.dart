import 'package:flutter/material.dart';

class MyCustomDialog extends StatefulWidget {
  final String wifiInfoText;
  MyCustomDialog({@required this.wifiInfoText});
  @override
  _MyCustomDialogState createState() => _MyCustomDialogState();
}

class _MyCustomDialogState extends State<MyCustomDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 350.0,
          width: MediaQuery.of(context).size.width * 0.9,
          padding:
              EdgeInsets.only(top: 16.0, bottom: 16.0, left: 16.0, right: 16.0),
          margin: EdgeInsets.only(top: 16.0),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(17.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 10.0))
              ]),
          child: Column(
            children: <Widget>[
              Text(
                "Device Wifi",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 85.0,
              ),
              Center(
                child: Text(
                  "${widget.wifiInfoText}",
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.pinkAccent),
                ),
              ),
              SizedBox(
                height: 85.0,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Okay")),
              )
            ],
          ),
        )
      ],
    );
  }
}
