import 'package:flutter/material.dart';

class LoadingBottom extends StatefulWidget {
  LoadingBottom({Key key}) : super(key: key);

  @override
  _LoadingBottomState createState() => _LoadingBottomState();
}

class _LoadingBottomState extends State<LoadingBottom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: 75,
        width: double.infinity,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
