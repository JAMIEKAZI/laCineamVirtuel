import 'package:flutter/material.dart';

import 'package:lecinemavirtuel/common/appBarWrapper.dart';
import 'package:lecinemavirtuel/common/app_bar_action.dart';
import 'package:lecinemavirtuel/common/app_bar_leading.dart';

import 'package:lecinemavirtuel/common/cinema_wrapper.dart';
import 'package:lecinemavirtuel/components/cBlueGradientButton.dart';
import 'package:lecinemavirtuel/components/cGreyButton.dart';
import 'package:lecinemavirtuel/components/inputText.dart';
import 'package:lecinemavirtuel/components/sideDrawer.dart';
import 'package:lecinemavirtuel/screens/purchase-movies/purchase-successful.dart';

class PurchaseMovie extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PurchaseMovieState();
  }
}

class PurchaseMovieState extends State<PurchaseMovie> {
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
              title: Text('Purchase Ticket'),
              actions: [
                AppBarAction(
                  scaffoldKey: _key,
                )
              ],
            ),
            body: SingleChildScrollView(
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(children: [
                      SizedBox(height: 36),
                      Container(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.25,
                              // child: Image.asset(
                              //   'assets/images/movie_art.png',
                              //   fit: BoxFit.cover,
                              //   height: double.infinity,
                              //   width: double.infinity,
                              // ),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        'https://w0.peakpx.com/wallpaper/915/542/HD-wallpaper-sub-zero-x-scorpion-mortalkombat-movie-mortal-kombat-movie-mortal-kombat-movies-2021-movies.jpg',
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(height: 48),
                            Text('Mortal Kombat: Enders Tournament',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                            SizedBox(height: 6),
                            Text('Hollywood Movie Action Movie',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),

                            // movie info

                            SizedBox(height: 20),
                            Text('Ticket Type ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(height: 14),
                            Input(
                              borderColor: Color(0xff3E4145),
                              suffixIcon: Icon(Icons.keyboard_arrow_down,
                                  color: Colors.white),
                              fillColor: Color(0xff2C3644),
                              labelText: 'Group Ticket',
                              validator: (String? value) {},
                              onSaved: (String? value) {},
                            ),
                            SizedBox(height: 14),
                            Text('Add Group Members ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(height: 14),
                            Input(
                              borderColor: Color(0xff3E4145),
                              obscureText: true,
                              suffixIcon:
                                  Icon(Icons.search, color: Colors.white),
                              fillColor: Color(0xff2C3644),
                              labelText: 'Search username',
                              validator: (String? value) {},
                              onSaved: (String? value) {},
                            ),
                            SizedBox(height: 30),
                            CGradientButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              PurchaseSuccessful()));
                                },
                                title: 'Purchase Ticket'),
                            SizedBox(height: 17),
                            CGreyButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                title: 'Close'),
                          ])),
                      SizedBox(height: 60),
                    ])))));
  }
}
