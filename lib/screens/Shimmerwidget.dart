import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../constants.dart';

class shimmerwidget extends StatelessWidget {
  const shimmerwidget({Key ?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthsize=MediaQuery.of(context).size.width;
    return  SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(kDefaultPaddin),
              child: Shimmer.fromColors(
              //  enabled: true,
                baseColor: Colors.grey[400]!,
                highlightColor: Colors.grey[300]!,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // Skeleton(height: 30,width: 120,),
                      // SizedBox(height: 20,),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Skeleton(height: 45,width: 90,),
                      //     Skeleton(height: 45,width: 90,),
                      //     Skeleton(height: 45,width: 90,),
                      //     Skeleton(height: 45,width: 90,),
                      //   ],
                      // ),



                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Skeleton(height: 180,width:widthsize/2-30,),
                          SizedBox(width: 20,),
                          Skeleton(height: 180,width:widthsize/2-30,),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Skeleton(height: 180,width:widthsize/2-30,),
                          SizedBox(width: 20,),
                          Skeleton(height: 180,width:widthsize/2-30,),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Skeleton(height: 180,width:widthsize/2-30,),
                          SizedBox(width: 20,),
                          Skeleton(height: 180,width:widthsize/2-30,),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ))

    ;
  }
}


class Skeleton extends StatelessWidget {
  const Skeleton({Key ?key,required this.height,required this.width}) : super(key: key);

  final double height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(kDefaultPaddin / 2),
      decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius:
          const BorderRadius.all(Radius.circular(kDefaultPaddin))),
    );
  }
}

class CircleSkeleton extends StatelessWidget {
  const CircleSkeleton({Key ?key, this.size = 24}) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.04),
        shape: BoxShape.circle,
      ),
    );
  }
}
