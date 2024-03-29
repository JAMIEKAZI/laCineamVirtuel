import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:lecinemavirtuel/common/appBarWrapper.dart';
import 'package:lecinemavirtuel/common/app_bar_action.dart';
import 'package:lecinemavirtuel/common/app_bar_leading.dart';

import 'package:lecinemavirtuel/common/cinema_wrapper.dart';
import 'package:lecinemavirtuel/common/ratingBar.dart';
import 'package:lecinemavirtuel/common/route_constants.dart';
import 'package:lecinemavirtuel/components/cBlueGradientButton.dart';
import 'package:lecinemavirtuel/components/cGreyButton.dart';
import 'package:lecinemavirtuel/components/sideDrawer.dart';
import 'package:lecinemavirtuel/helpers/customColors.dart';
import 'package:lecinemavirtuel/screens/purchase-movies/purchase.dart';

class MoviesHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MoviesHomeState();
  }
}

class MoviesHomeState extends State<MoviesHome> {
  int tabIndex = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  //  StreamController<bool> _chatNotificationCheckStream =
  //     StreamController<bool>();

  //      StreamBuilder(
  //               stream: _chatNotificationCheckStream.stream,
  //               builder: (context, snapshot) {
  //                 snapshot.data
  //               })

  void initState() {
    super.initState();

    // _chatNotificationCheckStream.add(false);
  }

  @override
  void dispose() async {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return CinemaWrapper(
        child: Scaffold(
            key: _key,
            drawer: NavigationDrawer(),
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              centerTitle: true,
              flexibleSpace: AppBarWrapper(),
              leading: AppBarLeading(),
              title: Text('Purchase ticket'),
              actions: [
                AppBarAction(
                  scaffoldKey: _key,
                )
              ],
            ),
            body: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(children: [
                  SizedBox(height: 36),
                  Expanded(
                    // padding: const EdgeInsets.all(20.0),
                    child: DefaultTabController(
                      length: 2,
                      child: Column(
                        children: <Widget>[
                          Container(
                            constraints: BoxConstraints(maxHeight: 150.0),
                            child: Material(
                              color: Colors.transparent,
                              child: Container(
                                // color: Colors.white,
                                child: TabBar(
                                  labelPadding: EdgeInsets.zero,
                                  indicatorPadding: EdgeInsets.zero,
                                  indicator:
                                      BoxDecoration(color: Colors.transparent),
                                  onTap: (int data) {
                                    setState(() {
                                      tabIndex = data;
                                    });
                                  },
                                  tabs: [
                                    Tab(
                                      child: Container(
                                        // margin: EdgeInsets.only(right: 2.5),
                                        decoration: BoxDecoration(
                                            // borderRadius:
                                            //     BorderRadius.circular(50),
                                            gradient: tabIndex == 0
                                                ? CustomColors.BlueGradient
                                                : CustomColors.GreyGradient),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Saved Movies",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Tab(
                                      child: Container(
                                        // margin: EdgeInsets.only(left: 2.5),
                                        decoration: BoxDecoration(
                                            // borderRadius: BorderRadius.circular(
                                            //     50), // Creates border
                                            gradient: tabIndex == 1
                                                ? CustomColors.BlueGradient
                                                : CustomColors.GreyGradient),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text("Purchased Movies",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                SingleChildScrollView(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 34,
                                    ),
                                    Text('Movies You Saved',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 26,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 24, horizontal: 21),
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                              Color(0xff3E4145),
                                              Color(0xff2C3644)
                                            ])),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Center(
                                                child: AspectRatio(
                                                  aspectRatio: 16 / 9,
                                                  child: BetterPlayer.network(
                                                    "https://media.w3.org/2010/05/sintel/trailer.mp4",
                                                    betterPlayerConfiguration:
                                                        BetterPlayerConfiguration(
                                                            placeholder:
                                                                Image.network(
                                                                    'https://images.alphacoders.com/113/thumb-1920-1136691.jpeg',
                                                                    fit: BoxFit
                                                                        .cover),
                                                            aspectRatio: 16 / 9,
                                                            showPlaceholderUntilPlay:
                                                                true,
                                                            controlsConfiguration:
                                                                BetterPlayerControlsConfiguration(

                                                                    // showControls: false,
                                                                    enableSkips:
                                                                        false,
                                                                    enableMute:
                                                                        false,
                                                                    enableFullscreen:
                                                                        false,
                                                                    enableOverflowMenu:
                                                                        false,
                                                                    enableProgressBar:
                                                                        false)),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 48),
                                              Text(
                                                  'Mortal Kombat: Enders Tournament',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              SizedBox(height: 6),
                                              Text(
                                                  'Hollywood Movie Action Movie',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              SizedBox(height: 20),
                                              // movie info
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text('Premiere Date',
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  color: Color(
                                                                      0xff777E84),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)),
                                                          Text('10/03/2021',
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500))
                                                        ]),
                                                    Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text('Ticket Price',
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  color: Color(
                                                                      0xff777E84),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)),
                                                          Text('₦4,000',
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500))
                                                        ]),
                                                    Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text('Movie Rating',
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  color: Color(
                                                                      0xff777E84),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)),

                                                          SizedBox(
                                                              child: RatingBarComponent(
                                                                  initialRating:
                                                                      3.5)),
                                                          // Text('******',
                                                          //     style: TextStyle(
                                                          //         fontSize: 16,
                                                          //         color: Colors
                                                          //             .white,
                                                          //         fontWeight:
                                                          //             FontWeight
                                                          //                 .w500))
                                                        ])
                                                  ]),

                                              SizedBox(height: 30),
                                              CGradientButton(
                                                  onPressed: () async {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (_) =>
                                                                PurchaseMovie()));
                                                  },
                                                  title: 'Purchase Ticket'),
                                              SizedBox(height: 17),
                                              CGreyButton(
                                                  onPressed: () async {
                                                    Navigator.pop(context);
                                                  },
                                                  title: 'Movie Details'),
                                            ])),
                                  ],
                                )),
                                SingleChildScrollView(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 34,
                                    ),
                                    Text('Movies You Purchased',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 26,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 24, horizontal: 21),
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                              Color(0xff3E4145),
                                              Color(0xff2C3644)
                                            ])),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Center(
                                                child: AspectRatio(
                                                  aspectRatio: 16 / 9,
                                                  child: BetterPlayer.network(
                                                    "https://media.w3.org/2010/05/sintel/trailer.mp4",
                                                    betterPlayerConfiguration:
                                                        BetterPlayerConfiguration(
                                                            placeholder:
                                                                Image.network(
                                                                    'https://images.alphacoders.com/113/thumb-1920-1136691.jpeg',
                                                                    fit: BoxFit
                                                                        .cover),
                                                            aspectRatio: 16 / 9,
                                                            showPlaceholderUntilPlay:
                                                                true,
                                                            controlsConfiguration:
                                                                BetterPlayerControlsConfiguration(

                                                                    // showControls: false,
                                                                    enableSkips:
                                                                        false,
                                                                    enableMute:
                                                                        false,
                                                                    enableFullscreen:
                                                                        false,
                                                                    enableOverflowMenu:
                                                                        false,
                                                                    enableProgressBar:
                                                                        false)),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 48),
                                              Text(
                                                  'Mortal Kombat: Enders Tournament',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              SizedBox(height: 6),
                                              Text(
                                                  'Hollywood Movie Action Movie',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              SizedBox(height: 20),
                                              // movie info
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text('Premiere Date',
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  color: Color(
                                                                      0xff777E84),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)),
                                                          Text('10/03/2021',
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500))
                                                        ]),
                                                    Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text('Ticket Price',
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  color: Color(
                                                                      0xff777E84),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)),
                                                          Text('₦4,000',
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500))
                                                        ]),
                                                    Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text('Movie Rating',
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  color: Color(
                                                                      0xff777E84),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)),
                                                          SizedBox(
                                                              child: RatingBarComponent(
                                                                  initialRating:
                                                                      3.5)),
                                                          // Text('******',
                                                          //     style: TextStyle(
                                                          //         fontSize: 16,
                                                          //         color: Colors
                                                          //             .white,
                                                          //         fontWeight:
                                                          //             FontWeight
                                                          //                 .w500))
                                                        ])
                                                  ]),

                                              SizedBox(height: 30),
                                              CGradientButton(
                                                  onPressed: () async {
                                                    //

                                                    Navigator.pushNamed(context,
                                                        WatchScreenRoute);
                                                  },
                                                  title: 'Watch Movie'),
                                            ])),
                                  ],
                                )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                ]))));
  }
}
