import 'package:flutter/material.dart';
import 'package:lecinemavirtuel/common/appBarWrapper.dart';
import 'package:lecinemavirtuel/common/cinema_wrapper.dart';
import 'package:lecinemavirtuel/common/route_constants.dart';
import 'package:lecinemavirtuel/components/cBlueGradientButton.dart';
import 'package:lecinemavirtuel/components/cGreyButton.dart';

class PurchaseSuccessful extends StatelessWidget {
  Widget build(BuildContext context) {
    return CinemaWrapper(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Container(
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
                                child: Container(
                                    child: Column(children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.25,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                              'assets/images/movie_art.png',
                                            ),
                                            fit: BoxFit.cover)),
                                  ),
                                  SizedBox(height: 48),
                                  Text('Ticket Purchase Successful',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600)),
                                  SizedBox(height: 21),
                                  Text(
                                      'You just purchased Mortal Kombat: Enders Tournament ticket for 4 people, schedule a reminder so you don’t forget.',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500)),
                                  SizedBox(height: 10),
                                  SizedBox(height: 30),
                                  CGradientButton(
                                      onPressed: () async {},
                                      title: 'Schedule Reminder'),
                                  SizedBox(height: 17),
                                  CGreyButton(
                                      onPressed: () async {
                                        Navigator.pushNamed(
                                            context, MoviesHomeRoute);
                                      },
                                      title: 'View My Movies'),
                                ])),
                              ))
                        ])))));
  }
}
