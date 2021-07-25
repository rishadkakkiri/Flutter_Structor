
import 'package:flutter/material.dart';

Future<bool> infoDilog(
    context, titleAlert, descriptionAlert, trueTitle, falseTitle) {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              color: Colors.grey[100],
              height: 220,
              width: MediaQuery.of(context).size.width - 50,
              child: Column(
                children: [
                  Container(
                      height: 60,
                      width: double.infinity,
                      color: Colors.blue,
                      child: Center(
                          child: Text(
                        titleAlert,maxLines: 1,overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 17),
                      ))),
                  Container(
                      height: 100,
                      width: double.infinity,
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Text(descriptionAlert,maxLines: 3,overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.grey[800], fontSize: 15)),
                      ))),
                  Container(
                    height: 60,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop(false);
                            },
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey[300],
                                        offset: Offset(0, 1),
                                        blurRadius: 8)
                                  ]),
                              height: 60,
                              // margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
                              child: Center(
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 16, left: 16),
                                    child: Text(
                                      falseTitle,maxLines: 1,overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Schyler"),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            width: 10,
                          ),

                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop(true);
                            },
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey[300],
                                        offset: Offset(0, 1),
                                        blurRadius: 8)
                                  ]),
                              height: 60,
                              // margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
                              child: Center(
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 16, left: 16),
                                    child: Text(
                                      trueTitle,maxLines: 1,overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Schyler"),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )

                          //     RaisedButton(color: Colors.blue,
                          //   onPressed: () {
                          //     Navigator.of(context).pop(true);
                          //   },
                          //   child: Text(trueTitle,style: TextStyle(color: Colors.white),),
                          // ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
}
