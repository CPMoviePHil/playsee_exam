import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageHelper {

  ImageHelper ({
    required bool imgOnlineHost,
    required String? imgPath,
    bool imgFromAssets = false,
  }): _imgOnlineHost = imgOnlineHost, _imgPath = imgPath, _imgFromAssets = imgFromAssets;

  final bool _imgOnlineHost;
  final String? _imgPath;

  final bool _imgFromAssets;

  Widget getImageWidget ({
    double? width,
    double? height,
    BoxFit? fit,
    Widget? loadingWidget,
  }) {
    if (_imgPath != null) {
      if (_imgOnlineHost) {
        return _onlineImgWidget(
          width: width,
          height: height,
          fit: fit,
          loadWidget: loadingWidget,
        );
      } else {
        if (_imgFromAssets) {
          return _localAssetsImage();
        } else {
          return _localImageFile();
        }
      }
    } else {
      return Container();
    }
  }
  CachedNetworkImage _onlineImgWidget ({
    double? width,
    double? height,
    BoxFit? fit,
    Widget? loadWidget,
  }) {
    return CachedNetworkImage(
      imageUrl: _imgPath!,
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: fit ?? BoxFit.cover,
          ),
        ),
      ),
      fit: fit ?? BoxFit.none,
      placeholder: (context, url) => loadWidget ?? const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }

  Image _localAssetsImage () {
    return Image.asset(
      _imgPath!,
      gaplessPlayback: true,
    );
  }

  Image _localImageFile () {
    return Image.file(File(_imgPath!));
  }

}