import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:lecinemavirtuel/common/appBarWrapper.dart';
import 'package:lecinemavirtuel/common/app_bar_action.dart';
import 'package:lecinemavirtuel/common/app_bar_leading.dart';

import 'package:lecinemavirtuel/common/cinema_wrapper.dart';
import 'package:lecinemavirtuel/common/ratingBar.dart';
import 'package:lecinemavirtuel/common/shimmers.dart';
import 'package:lecinemavirtuel/components/cBlueGradientButton.dart';
import 'package:lecinemavirtuel/components/cGreyButton.dart';
import 'package:lecinemavirtuel/components/sideDrawer.dart';
import 'package:lecinemavirtuel/models/moviePremeireDetails.dart';

import 'package:lecinemavirtuel/screens/purchase-movies/purchase.dart';
import 'package:lecinemavirtuel/services/config.dart';
import 'package:lecinemavirtuel/services/controller/main_controller.dart';
import 'package:lecinemavirtuel/services/movie_service.dart';

class MovieDetails extends StatefulWidget {
  final String id;
  final String? trailerUrl;
  MovieDetails({required this.id, this.trailerUrl});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MovieDetailsState();
  }
}

class MovieDetailsState extends State<MovieDetails> {
  Future<void> initializePlayer() async {}
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final MovieService movieService = MovieService();

  void initState() {
    // getMovieDetails();
    super.initState();
    getMovieDetails();
  }

  @override
  void dispose() async {
    super.dispose();
  }

  Future getMovieDetails() async {
    await movieService.fetchMoviePremiereDetail(widget.id);
  }

  Widget build(BuildContext context) {
    MainController c = Get.put(MainController());
    return CinemaWrapper(child: Obx(() {
      print('movie ${c.moviePremiereDetails.value.data}');
      Data movieItem = c.moviePremiereDetails.value.data as Data;
      return Scaffold(
          key: _key,
          drawer: NavigationDrawer(),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            flexibleSpace: AppBarWrapper(),
            leading: AppBarLeading(),
            title: Text('Movie Details'),
            actions: [
              AppBarAction(
                scaffoldKey: _key,
              )
            ],
          ),
          body: c.isLoading.value
              ? Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Center(child: ShimmerDetail()))
              : SingleChildScrollView(
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(children: [
                        SizedBox(height: 36),
                        Container(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              Center(
                                child: AspectRatio(
                                  aspectRatio: 16 / 9,
                                  child: BetterPlayer.network(
                                    '${Config.awsBaseUrl}${widget.trailerUrl}',
                                    betterPlayerConfiguration:
                                        BetterPlayerConfiguration(
                                            placeholder: Image.network(
                                                '${Config.awsBaseUrl}${movieItem.movie!.coverImageUrl}',
                                                fit: BoxFit.cover),
                                            aspectRatio: 16 / 9,
                                            showPlaceholderUntilPlay: true,
                                            controlsConfiguration:
                                                BetterPlayerControlsConfiguration(

                                                    // showControls: false,
                                                    enableSkips: false,
                                                    enableMute: false,
                                                    enableFullscreen: false,
                                                    enableOverflowMenu: false,
                                                    enableProgressBar: false)),
                                  ),
                                ),
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
                                                  color: Color(0xff777E84),
                                                  fontWeight: FontWeight.w500)),
                                          Text(
                                              '${Jiffy(movieItem.premiereDatetime).format("MMM do yy")}',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500))
                                        ]),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Premiere Time',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xff777E84),
                                                  fontWeight: FontWeight.w500)),
                                          Text(
                                              '${Jiffy(movieItem.premiereDatetime).format("h:mm a")}',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500))
                                        ]),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Ticket Price',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xff777E84),
                                                  fontWeight: FontWeight.w500)),
                                          Text('₦4,000',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'Roboto',
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500))
                                        ]),
                                    // Column(
                                    //     crossAxisAlignment:
                                    //         CrossAxisAlignment.start,
                                    //     children: [
                                    //       Text('Movie Rating',
                                    //           style: TextStyle(
                                    //               fontSize: 14,
                                    //               color: Color(0xff777E84),
                                    //               fontWeight:
                                    //                   FontWeight.w500)),
                                    //       SizedBox(
                                    //           child: RatingBarComponent(
                                    //               initialRating: 3.5)),
                                    //       // Text('******',
                                    //       //     style: TextStyle(
                                    //       //         fontSize: 16,
                                    //       //         color: Colors.white,
                                    //       //         fontWeight: FontWeight.w500))
                                    //     ])
                                  ]),
                              SizedBox(height: 20),
                              Text('${movieItem.movie!.synopsis}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(height: 10),
                              Text('Movie Cast',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff777E84),
                                      fontWeight: FontWeight.w500)),
                              SizedBox(height: 14),
                              Text(
                                  'Jackie Chan, Wesley Snipe, Jet Li, Nicholas Cage, Antonio Banderras, Angelina Jolie, Jackie Chan, Wesley Snipe, Jet Li, Nicholas Cage, Antonio Banderras, Angelina Jolie',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(height: 30),
                              CGradientButton(
                                  onPressed: () async {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => PurchaseMovie()));
                                  },
                                  title: 'Purchase Ticket'),
                              SizedBox(height: 17),
                              CGreyButton(
                                  onPressed: () async {
                                    Navigator.pop(context);
                                  },
                                  title: 'Close Details'),
                            ])),
                        SizedBox(height: 60),
                      ]))));
    }));
  }
}
