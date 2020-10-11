import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/svg.dart';
import 'no_image_widget.dart';

enum LOADING_IMAGE { IMAGE, DEFAULT }
DefaultCacheManager defaultCacheManager = new DefaultCacheManager();

class CacheNetworkImageLoader extends StatelessWidget {
  final String url;
  final BoxFit fit;
  final double width;
  final double height;
  final VoidCallback onTap;
  final LOADING_IMAGE loadingImage;
  final BoxFit placeOrderFitBox;
  CacheNetworkImageLoader({
    Key key,
    @required this.url,
    this.fit,
    this.placeOrderFitBox,
    this.height = 150,
    this.loadingImage = LOADING_IMAGE.DEFAULT,
    this.width,
    this.onTap,
  })  : assert(url != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    if (url?.isEmpty ?? true)
      return InkWell(
        onTap: onTap != null
            ? () {
                if (url != null) onTap();
              }
            : null,
        child: NoImageWidget(
          fit: placeOrderFitBox,
        ),
      );
    else
      return InkWell(
        onTap: onTap != null
            ? () {
                if (url != null) onTap();
              }
            : null,
        child: CachedNetworkImage(
          fit: fit,
          imageUrl: url,
          cacheManager: defaultCacheManager,
          useOldImageOnUrlChange: true,
          fadeOutDuration: Duration(milliseconds: 500),
          width: MediaQuery.of(context).size.width,
          fadeInDuration: Duration(milliseconds: 500),
          // ),
          placeholder: (context, url) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: height,
                child: loadingImage == LOADING_IMAGE.IMAGE
                    ? SvgPicture.asset('')
                    : NoImageWidget(
                        fit: placeOrderFitBox,
                      )),
          ),
          errorWidget: (context, url, error) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: height,
                child: loadingImage == LOADING_IMAGE.IMAGE
                    ? SvgPicture.asset('')
                    : NoImageWidget(
                        fit: placeOrderFitBox,
                      )),
          ),
        ),
      );
  }
}
