import 'package:flutter/material.dart';

class EmptyList extends StatefulWidget {
  EmptyList({Key key, this.title, this.description}) : super(key: key);
  String title;
  String description;
  @override
  _EmptyListState createState() => _EmptyListState();
}

class _EmptyListState extends State<EmptyList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: MediaQuery.of(context).size.width - 100,
        height: 300,
        // color: Colors.white,
        child: Column(
          children: [
            Icon(
              Icons.list,
              size: 150,
              color: Colors.grey[300],
            ),
            Text(
              widget.title,maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 25,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              widget.description,maxLines: 3,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[500]),
            )
          ],
        ),
      ),
    );
  }
}
