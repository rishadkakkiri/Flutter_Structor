import 'package:cached_network_image/cached_network_image.dart';
import 'package:alsignon/Constants/Constants.dart';
import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  const ImageView({this.imageURL});
final imageURL;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CachedNetworkImage(
  imageUrl: IMAGE_HOSTNAME+imageURL,
  imageBuilder: (context, imageProvider) => Container(
    decoration: BoxDecoration(
      image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
    
              ),
    ),
  ),
  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
  errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
),
    );
  }
}