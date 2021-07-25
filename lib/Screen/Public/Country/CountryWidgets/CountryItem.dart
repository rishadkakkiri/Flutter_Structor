
import 'package:cached_network_image/cached_network_image.dart';
import 'package:alsignon/CommonWidgets/ImageView.dart';
import 'package:alsignon/Constants/Constants.dart';
import 'package:alsignon/Provider/PublicProvider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class CountryItem extends StatelessWidget {
  const CountryItem({@required this.onPressed, this.countryItem});
  final onPressed;
  final countryItem;
  @override
  Widget build(BuildContext context) {
var publicProvider = Provider.of<PublicProvider>(context, listen: false);

    return InkWell(
      onTap: onPressed,
      child: Container(
          margin: EdgeInsets.fromLTRB(20, 15, 20, 15),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    offset: Offset(2, 2),
                    color: Colors.grey[200],
                    blurRadius: 6)
              ]),
          height: 70,
          child: Row(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: Container(width: 35,height: 35,
                                    child: 
                                    ImageView(imageURL: countryItem["flag_image"],)

                                    
                                    
                                    
                //                     PhotoView(
                //   imageProvider: CachedNetworkImageProvider(HOSTNAME + countryItem["flag_image"]), //NetworkImage(global.APP_URL + widget.image_path),
                // )
                
                
                
                
                ,
                                  )
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(child: Text(countryItem['name'],maxLines: 2,overflow: TextOverflow.ellipsis,)),
              Text(
               publicProvider.selectedLanguage == "en" ? "+" + countryItem['mobile_code']: countryItem['mobile_code'] +"+" ,
                style: TextStyle(color: Colors.grey[400]),
              ),
            ],
          )),
    );
  }
}
