import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: 8,
          itemBuilder: (_, index) {
            return Shimmer.fromColors(
              highlightColor: Colors.white,
              baseColor: Colors.grey[300],
              child: Container(
                margin: EdgeInsets.all(7.5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      color: Colors.grey,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 280,
                          height: 15,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 280,
                          height: 15,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 280 * 0.75,
                          height: 15,
                          color: Colors.grey,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
