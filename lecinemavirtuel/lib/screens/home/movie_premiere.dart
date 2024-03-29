import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import 'package:lecinemavirtuel/common/appBarWrapper.dart';
import 'package:lecinemavirtuel/common/app_bar_action.dart';
import 'package:lecinemavirtuel/common/app_bar_leading.dart';

import 'package:lecinemavirtuel/common/cinema_wrapper.dart';
import 'package:lecinemavirtuel/common/ratingBar.dart';
import 'package:lecinemavirtuel/components/cBlueGradientButton.dart';
import 'package:lecinemavirtuel/components/cGreyButton.dart';
import 'package:lecinemavirtuel/components/inputText.dart';
import 'package:lecinemavirtuel/components/sideDrawer.dart';
import 'package:lecinemavirtuel/helpers/stringHelpers.dart';
import 'package:lecinemavirtuel/models/moviePremiereListModel.dart';
import 'package:lecinemavirtuel/screens/home/movie_details.dart';
import 'package:lecinemavirtuel/screens/purchase-movies/purchase.dart';
import 'package:lecinemavirtuel/services/auth_service.dart';
import 'package:lecinemavirtuel/services/config.dart';
import 'package:lecinemavirtuel/services/controller/main_controller.dart';
import 'package:lecinemavirtuel/services/movie_service.dart';

class MoviePremiere extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MoviePremiereState();
  }
}

class MoviePremiereState extends State<MoviePremiere> {
  // VlcPlayerController _videoPlayerController = VlcPlayerController.network('');
  // Future<void> initializePlayer() async {}
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final MovieService movieService = MovieService();
  //  StreamController<bool> _chatNotificationCheckStream =
  //     StreamController<bool>();

  //      StreamBuilder(
  //               stream: _chatNotificationCheckStream.stream,
  //               builder: (context, snapshot) {
  //                 snapshot.data
  //               })

  void initState() {
    initialize();
    super.initState();

    // _chatNotificationCheckStream.add(false);

    // _videoPlayerController = VlcPlayerController.network(
    //   'https://media.w3.org/2010/05/sintel/trailer.mp4',
    //   hwAcc: HwAcc.FULL,
    //   autoPlay: false,
    //   options: VlcPlayerOptions(),
    // );
  }

  Future initialize() async {
    await Future.wait([
      movieService.fetchGenre(),
      movieService.fetchCategories(),
      movieService.fetchMovies()
    ]);
  }

  @override
  void dispose() async {
    super.dispose();
    // await _videoPlayerController.stopRendererScanning();
    // await _videoPlayerController.dispose();
  }

  _genreDialog(BuildContext context, MainController c) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionDuration: Duration(milliseconds: 400),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation,
            child: child,
          ),
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return Obx(() => SafeArea(
              child: CinemaWrapper(
                  child: Scaffold(
                      backgroundColor: Colors.transparent,
                      appBar: AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        automaticallyImplyLeading: false,
                        title: Text(
                          'Select Genre',
                        ),
                        actions: [
                          GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                Navigator.of(context).pop();
                              },
                              child: Icon(Icons.close)),
                          SizedBox(width: 10),
                        ],
                      ),
                      body: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        padding: EdgeInsets.only(
                            top: 10, right: 20, left: 20, bottom: 20),
                        child: Center(
                          child: ListView.builder(
                            itemCount: c.genreData.value.data!.length,
                            itemBuilder: (BuildContext context, index) {
                              return InkWell(
                                  onTap: () {
                                    setState(() {
                                      // countryController.text =
                                      //     countries[index]['name'];
                                      // signupModel.countryId =
                                      //     countries[index]['id'];
                                      FocusScope.of(context).unfocus();
                                      Navigator.of(context).pop();
                                    });
                                  },
                                  child: Text(
                                    '${c.genreData.value.data![index].name!.toCapitalize()}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        height: 2),
                                  ));
                            },
                          ),
                        ),
                      ))),
            ));
      },
    );
  }

  _categoryDialog(BuildContext context, MainController c) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionDuration: Duration(milliseconds: 400),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation,
            child: child,
          ),
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return Obx(() => SafeArea(
              child: CinemaWrapper(
                  child: Scaffold(
                      backgroundColor: Colors.transparent,
                      appBar: AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        automaticallyImplyLeading: false,
                        title: Text(
                          'Select Category',
                        ),
                        actions: [
                          GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                Navigator.of(context).pop();
                              },
                              child: Icon(Icons.close)),
                          SizedBox(width: 10),
                        ],
                      ),
                      body: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        padding: EdgeInsets.only(
                            top: 10, right: 20, left: 20, bottom: 20),
                        child: Center(
                          child: ListView.builder(
                            itemCount: c.categoryData.value.data!.length,
                            itemBuilder: (BuildContext context, index) {
                              return InkWell(
                                  onTap: () {
                                    setState(() {
                                      // countryController.text =
                                      //     countries[index]['name'];
                                      // signupModel.countryId =
                                      //     countries[index]['id'];
                                      FocusScope.of(context).unfocus();
                                      Navigator.of(context).pop();
                                    });
                                  },
                                  child: Text(
                                    '${c.categoryData.value.data![index].name!.toCapitalize()}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        height: 2),
                                  ));
                            },
                          ),
                        ),
                      ))),
            ));
      },
    );
  }

  Widget build(BuildContext context) {
    MainController c = Get.put(MainController());
    return CinemaWrapper(
        child: Obx(() => Scaffold(
            key: _key,
            drawer: NavigationDrawer(),
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              centerTitle: true,
              flexibleSpace: AppBarWrapper(),
              leading: AppBarLeading(),
              title: Text('Movie Premiere'),
              actions: [
                AppBarAction(
                  scaffoldKey: _key,
                )
              ],
            ),
            body: RefreshIndicator(
                onRefresh: () async {
                  await initialize();
                },
                child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(children: [
                          SizedBox(height: 36),
                          Text('Stream High Quality Movies WIth Your Friends',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(height: 36),
                          GridView(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 50,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                              ),
                              shrinkWrap: true,
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                          Color(0xff20262D),
                                          Color(0xff29323D)
                                        ])),
                                    child: GestureDetector(
                                        onTap: () =>
                                            _categoryDialog(context, c),
                                        child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Container(
                                                  child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text('Hollywood Movies',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.white)),
                                                  Icon(
                                                      Icons.keyboard_arrow_down,
                                                      color: Colors.white)
                                                ],
                                              )),
                                            )))),
                                Container(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                          Color(0xff20262D),
                                          Color(0xff29323D)
                                        ])),
                                    child: GestureDetector(
                                        onTap: () => _genreDialog(context, c),
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Container(
                                                  child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text('Romantics Movies',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.white)),
                                                  Icon(
                                                      Icons.keyboard_arrow_down,
                                                      color: Colors.white)
                                                ],
                                              ))),
                                        ))),
                                Container(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                          Color(0xff20262D),
                                          Color(0xff29323D)
                                        ])),
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Container(
                                              child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Date Added',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white)),
                                              Icon(Icons.keyboard_arrow_down,
                                                  color: Colors.white)
                                            ],
                                          ))),
                                    )),
                                Container(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                          Color(0xff20262D),
                                          Color(0xff29323D)
                                        ])),
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Container(
                                              child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Recent Movies',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white)),
                                              Icon(Icons.keyboard_arrow_down,
                                                  color: Colors.white)
                                            ],
                                          ))),
                                    )),
                              ]),
                          SizedBox(height: 48),
                          Input(
                            borderColor: Color(0xff3E4145),
                            obscureText: true,
                            suffixIcon: Icon(Icons.search, color: Colors.white),
                            fillColor: Color(0xff2C3644),
                            labelText: 'Search for movie e.g wolf bane',
                            validator: (String? value) {},
                            onSaved: (String? value) {},
                          ),
                          SizedBox(height: 48),
                          Column(
                              children: c.moviePremiereList.value.data!.docs!
                                  .map((Docs movieItem) {
                            return Container(
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
                                            // "https://media.w3.org/2010/05/sintel/trailer.mp4",
                                            '${Config.awsBaseUrl}${movieItem.movie!.trailerUrl}',
                                            betterPlayerConfiguration:
                                                BetterPlayerConfiguration(
                                                    placeholder: Image.network(
                                                        '${Config.awsBaseUrl}${movieItem.movie!.coverImageUrl}',
                                                        fit: BoxFit.cover),
                                                    aspectRatio: 16 / 9,
                                                    autoPlay: false,
                                                    showPlaceholderUntilPlay:
                                                        true,
                                                    controlsConfiguration:
                                                        BetterPlayerControlsConfiguration(

                                                            // showControls: false,
                                                            enableSkips: false,
                                                            enableMute: false,
                                                            enableFullscreen:
                                                                false,
                                                            enableOverflowMenu:
                                                                false,
                                                            enableProgressBar:
                                                                false)),
                                          ),
                                        ),
                                        //     Stack(
                                        //   alignment: Alignment.center,
                                        //   children: [
                                        //     VlcPlayer(
                                        //       controller: _videoPlayerController,
                                        //       aspectRatio: 16 / 9,
                                        //       placeholder: Center(
                                        //           child: CircularProgressIndicator()),
                                        //     ),
                                        //     Positioned.fill(
                                        //       child: Align(
                                        //           alignment: Alignment.center,
                                        //           child: InkWell(
                                        //               onTap: () async {
                                        //                 _videoPlayerController
                                        //                         .value.isPlaying
                                        //                     ? await _videoPlayerController
                                        //                         .pause()
                                        //                     : await _videoPlayerController
                                        //                         .play();
                                        //                 setState(() {});
                                        //               },
                                        //               child: _videoPlayerController
                                        //                       .value.isPlaying
                                        //                   ? Icon(Icons.pause,
                                        //                       size: 35,
                                        //                       color: Colors.white)
                                        //                   : Icon(
                                        //                       Icons.play_arrow_rounded,
                                        //                       size: 35,
                                        //                       color: Colors.white))),
                                        //     ),
                                        //   ],
                                        // )
                                      ),
                                      SizedBox(height: 48),
                                      Text('${movieItem.movie!.title}',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600)),
                                      SizedBox(height: 6),
                                      Text('${movieItem.movie!.tags}',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600)),
                                      SizedBox(height: 20),
                                      // movie info
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('Premiere Date',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Color(0xff777E84),
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                  Text(
                                                      '${Jiffy(movieItem.premiereDatetime).format("MMM do yy")}',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500))
                                                ]),
                                            Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('Premiere Time',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Color(0xff777E84),
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                  Text(
                                                      '${Jiffy(movieItem.premiereDatetime).format("h:mm a")}',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500))
                                                ]),
                                            Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('Ticket Price',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Color(0xff777E84),
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                  Text('₦4,000',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontFamily: 'Roboto',
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500))
                                                ]),
                                            // Column(
                                            //     crossAxisAlignment:
                                            //         CrossAxisAlignment.start,
                                            //     children: [
                                            //       Text('Movie Rating',
                                            //           style: TextStyle(
                                            //               fontSize: 14,
                                            //               color:
                                            //                   Color(0xff777E84),
                                            //               fontWeight:
                                            //                   FontWeight.w500)),
                                            //       SizedBox(
                                            //           child: RatingBarComponent(
                                            //               initialRating: 3.5)),

                                            //     ])
                                          ]),
                                      SizedBox(height: 22),
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
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        MovieDetails(
                                                            trailerUrl:
                                                                movieItem.movie!
                                                                    .trailerUrl,
                                                            id: movieItem.id
                                                                as String)));
                                          },
                                          title: 'Movie Details'),
                                    ]));
                          }).toList()),
                          SizedBox(height: 60),
                        ])))))));
  }
}
