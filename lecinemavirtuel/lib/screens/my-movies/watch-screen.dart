import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

import 'package:lecinemavirtuel/common/appBarWrapper.dart';
import 'package:lecinemavirtuel/common/app_bar_action.dart';
import 'package:lecinemavirtuel/common/app_bar_leading.dart';

import 'package:lecinemavirtuel/common/cinema_wrapper.dart';
import 'package:lecinemavirtuel/components/sideDrawer.dart';

class WatchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WatchScreenState();
  }
}

class WatchScreenState extends State<WatchScreen> {
  int tabIndex = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  // BetterPlayerController _betterPlayerController;
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
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 90),
                      Text('You Are Watching Mortal Kombat: Enders Tournament',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.w500)),
                      SizedBox(height: 30),
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: BetterPlayer.network(
                          "https://media.w3.org/2010/05/sintel/trailer.mp4",
                          betterPlayerConfiguration: BetterPlayerConfiguration(
                              placeholder: Image.network(
                                  'https://images.alphacoders.com/113/thumb-1920-1136691.jpeg',
                                  fit: BoxFit.cover),
                              aspectRatio: 16 / 9,
                              fullScreenByDefault: true,
                              controlsConfiguration:
                                  BetterPlayerControlsConfiguration()),
                        ),
                      ),
                      SizedBox(height: 60),
                    ]))));
  }
}
