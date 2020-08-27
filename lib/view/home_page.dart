import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

import 'package:vendomatics_app/view/custom_dialog.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  String _wifistatus = "wifi not initiated";

  String methodChannelValue;
  AnimationController _animationController1;
  AnimationController _animationController2;

//  static const methodChannel = MethodChannel("vendomatics_app");
  static const platform = MethodChannel('example.vedndomaticindia.com/wifi');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    methodChannelValue = "not initiated";
    _animationController1 = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 5000),
    );
  }

  Future<void> _getBatteryLevel() async {
    String wifiInfo;
    try {
      final String result =
          await platform.invokeMethod<String>('getWifiInfoFromDevice');
      wifiInfo = result;
    } on PlatformException catch (e) {
      wifiInfo = "Failed to get wifi info: '${e.message}'.";
    }

    setState(() {
//      _batteryLevel = batteryLevel;
      _wifistatus = wifiInfo;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController1.dispose();
    _animationController2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                Center(
                  child: Draggable(
                    child: RaisedButton(
                      color: Colors.redAccent,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                      elevation: 5.0,
                      shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      onPressed: () {
                        setState(() {
                          _getBatteryLevel();
                        });

                        showDialog(
                            context: context,
                            builder: (context) => MyCustomDialog(
                                  wifiInfoText: _wifistatus,
                                ));
//                      iniMethodChannel();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Drag me",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    feedback: RaisedButton(
                      color: Colors.redAccent,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                      elevation: 5.0,
                      shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      onPressed: () {
                        setState(() {
                          _getBatteryLevel();
                        });

                        showDialog(
                            context: context,
                            builder: (context) => MyCustomDialog(
                                  wifiInfoText: _wifistatus,
                                ));
//                      iniMethodChannel();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Drag me",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    childWhenDragging: Container(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: AnimatedBuilder(
                    animation: _animationController1,
                    builder: (_, child) {
                      return Transform.rotate(
                        angle:
//                      -180,
                            _animationController1.value * 6 * math.pi,
//                              * -10 * math.pi,

                        child: child,
                      );
                    },
                    child: InkWell(
                        onTap: () {
//                        _animationController1.repeat(reverse: true);
                          _animationController1.reverse(from: 1.0);
                        },
                        child: Container(
                            height: 200,
                            width: 200,
                            child: Image.asset("assets/compass.jpg"))),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
