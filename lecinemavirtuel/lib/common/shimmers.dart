import 'package:flutter/material.dart';
import 'package:lecinemavirtuel/components/cButton.dart';

import 'package:shimmer/shimmer.dart';

class ShimmerListCustom extends StatelessWidget {
  Widget build(BuildContext context) {
    return SizedBox(
        // width: sizeManager.scaledWidth(70),
        child: Shimmer.fromColors(
            enabled: true,
            baseColor: Colors.grey[300] as Color,
            highlightColor: Color(0xff983701).withOpacity(0.2),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                // image

                SizedBox(width: 12),
                Wrap(
                  direction: Axis.vertical,
                  alignment: WrapAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Text('',
                            style: TextStyle(
                                color: Color(0xff4A4B4D),
                                fontSize: 14,
                                height: 1.5,
                                fontWeight: FontWeight.w700))),
                    Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width * 0.7,
                    ),
                    SizedBox(height: 10),
                    Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Text(' ',
                            style: TextStyle(
                                color: Color(0xff4A4B4D),
                                fontSize: 12,
                                height: 1.3,
                                fontWeight: FontWeight.w400)))
                  ],
                )
              ]),
              SizedBox(height: 9),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: CWhiteButtonWithIcon(
                        color: Color(0xff046707),
                        title: Text(''),
                        icon: Icon(Icons.timer),
                        onpressed: () {},
                      )),
                ],
              ),
            ])));

    // Container(color: Colors.white)
  }
}

class ShimmerCustom2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        enabled: true,
        baseColor: Colors.grey[300] as Color,
        highlightColor: Color(0xff983701).withOpacity(0.2),
        child: ListTile(
            leading: CircleAvatar(
              radius: 18,
              child: Center(
                  child: Text('',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500))),
            ),
            title: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                color: Colors.white,
                child: Text('',
                    style: TextStyle(
                        color: Color(0xff4A4B4D),
                        fontSize: 14,
                        height: 1.5,
                        fontWeight: FontWeight.w700))),
            subtitle: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                color: Colors.white,
                child: Text('',
                    style: TextStyle(
                        color: Color(0xff4A4B4D),
                        fontSize: 12,
                        height: 1.2,
                        fontWeight: FontWeight.w400))),
            trailing: Container(
                width: MediaQuery.of(context).size.width * 0.37,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.1,
                        color: Colors.white,
                        child: Text('',
                            style: TextStyle(
                                color: Color(0xff4A4B4D),
                                fontSize: 12,
                                height: 1.2,
                                fontWeight: FontWeight.w400))),
                    SizedBox(width: 10),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.1,
                        color: Colors.white,
                        child: Text('',
                            style: TextStyle(
                                color: Color(0xff4A4B4D),
                                fontSize: 12,
                                height: 1.2,
                                fontWeight: FontWeight.w400)))
                  ],
                ))));

    // Container(color: Colors.white)
  }
}

class ShimmerTexts extends StatelessWidget {
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        enabled: true,
        baseColor: Colors.grey[300] as Color,
        highlightColor: Color(0xff983701).withOpacity(0.2),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width * 0.4,
              child: Text(''),
            ),
            SizedBox(height: 5),
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width * 0.3,
              child: Text(''),
            )
          ],
        ));

    // Container(color: Colors.white)
  }
}

class ShimmerList extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShimmerListCustom(),
        SizedBox(height: 20),
        ShimmerListCustom(),
        SizedBox(height: 20),
        ShimmerListCustom()
      ],
    );
  }
}

class ShimmerRow extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        height: 152,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            ShimmerListCustom(),
            SizedBox(height: 20),
            ShimmerListCustom(),
            SizedBox(height: 20),
            ShimmerListCustom()
          ],
        ));
  }
}

class ShimmerDetail extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      height: 152,
      child: ShimmerListCustom(),
    );
  }
}

class ShimmerList2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShimmerCustom2(),
        SizedBox(height: 18),
        ShimmerCustom2(),
        SizedBox(height: 18),
        ShimmerCustom2(),
        SizedBox(height: 18),
        ShimmerCustom2()
      ],
    );
  }
}
