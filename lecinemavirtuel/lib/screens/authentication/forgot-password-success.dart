import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lecinemavirtuel/common/cinema_wrapper.dart';
import 'package:lecinemavirtuel/common/route_constants.dart';
import 'package:lecinemavirtuel/components/cButton.dart';
import 'package:lecinemavirtuel/components/horizontalOrLine.dart';
import 'package:lecinemavirtuel/components/inputText.dart';
import 'package:lecinemavirtuel/helpers/flushBar.dart';
import 'package:lecinemavirtuel/models/signinModel.dart';
import 'package:lecinemavirtuel/models/signupModel.dart';
import 'package:lecinemavirtuel/services/auth_service.dart';

class ForgotPasswordSuccess extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ForgotPasswordSuccessState();
  }
}

class ForgotPasswordSuccessState extends State<ForgotPasswordSuccess> {
  final AuthService authService = AuthService();
  final SigninModel signinModel = SigninModel();
  final CustomFlushBar customFlushBar = CustomFlushBar();
  String? email = '';
  List countries = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff20262D), Color(0xff29323D)])),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.12),
                        SvgPicture.asset(
                          'assets/cinemaappLogo.svg',
                        ),
                        SizedBox(height: 80),
                        Text('Request sent!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),

                        SizedBox(height: 27),
                        Text(
                            'A request to reset your password has been sent, check your email and follow the instructions to complete the process.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),

                        SizedBox(height: 26),
                        // form
                        SizedBox(height: 38),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                  Color(0xff2077C8),
                                  Color(0xff0096C7)
                                ])),
                            child: MaterialButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, LoginRoute);
                                },
                                child: Text('Login',
                                    style: TextStyle(
                                        color: Color(0xffffffff),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500)))),
                        SizedBox(height: 32),
                      ],
                    )))));
  }
}
