import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../constant/constant.dart';

Widget currencyShimmer() {
  return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: ColorConfig.colorGrey,
                boxShadow: [
                  BoxShadow(
                    color: ColorConfig.colorShadow.withOpacity(0.25),
                    offset: const Offset(
                      0.0,
                      5.0,
                    ),
                    blurRadius: 18.0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: ColorConfig.colorShimmerDarkGrey,
                      highlightColor: ColorConfig.colorShimmerLightGrey,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Container(
                            color: ColorConfig.colorWhite,
                            height: 20,
                          )),
                    ),
                  ],
                ),
              )),
        );
      });
}
