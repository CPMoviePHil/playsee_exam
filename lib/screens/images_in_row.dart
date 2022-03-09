import 'package:flutter/material.dart';

import '../utils/utils.dart';

class ImageInRows extends StatelessWidget {
  final List<String> _imagePath;

  const ImageInRows ({
    Key? key,
    required List<String> imagePath,
  }): _imagePath = imagePath, super(key: key,);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageHelper(
          imgOnlineHost: true,
          imgPath: _imagePath[0],
        ).getImageWidget(
          width: MediaQuery.of(context).size.width / 3,
          fit: BoxFit.fitWidth,
        ),
        ImageHelper(
          imgOnlineHost: true,
          imgPath: _imagePath[1],
        ).getImageWidget(
          width: MediaQuery.of(context).size.width / 3,
          fit: BoxFit.fitWidth,
        ),
        ImageHelper(
          imgOnlineHost: true,
          imgPath: _imagePath[2],
        ).getImageWidget(
          width: MediaQuery.of(context).size.width / 3,
          fit: BoxFit.fitWidth,
        ),
      ],
    );
  }
}