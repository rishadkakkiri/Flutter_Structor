import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingSpinner extends StatelessWidget {
  const LoadingSpinner({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    color: Colors.transparent,
      child: Center(child: SpinKitWave(
        
          color: Colors.blue[400],
          size: 50.0,
        ),),
    );
  }
}