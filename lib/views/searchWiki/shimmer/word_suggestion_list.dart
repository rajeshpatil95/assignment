import 'package:assignment/components/shimmer_widget.dart';
import 'package:assignment/constants/constant.dart';
import 'package:flutter/material.dart';

class WordSuggestionListShimmer extends StatelessWidget {
  Widget _suggestionProductsShimmer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.white, width: 4))),
      child: SizedBox(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Stack(
            alignment: Alignment.centerRight,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ShimmerWidget(
                    child: Container(
                        color: shimmerColor,
                        alignment: Alignment.center,
                        width: 80,
                        child: Container()),
                  ),
                  sizeBoxW5,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ShimmerWidget(
                        child: Container(
                            color: shimmerColor,
                            width: 200,
                            height: 30,
                            child: Container()),
                      ),
                      ShimmerWidget(
                        child: Container(
                          color: shimmerColor,
                          height: 15,
                          width: 60,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        sizeBoxH10,
        ShimmerWidget(
          child: Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Container(
                color: shimmerColor,
                height: 10,
                width: 100,
                child: Container()),
          ),
        ),
        sizeBoxH10,
        divider,
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return _suggestionProductsShimmer(context);
            },
          ),
        ),
      ],
    );
  }
}
