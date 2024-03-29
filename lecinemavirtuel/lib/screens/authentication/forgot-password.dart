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

class ForgotPassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ForgotPasswordState();
  }
}

class ForgotPasswordState extends State<ForgotPassword> {
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

  submit(context) async {
    try {
      if (!_formKey.currentState!.validate()) {
        return;
      }
      _formKey.currentState!.save();
      var payload = {"email": email};
      final result = await authService.forgotPassword(payload);
      print('result $result');
      Navigator.pushNamed(context, ForgotPasswordSuccessRoute);
    } catch (e) {
      // show flushbar
      customFlushBar.showErrorFlushBar(
          title: 'Error occured', body: '$e', context: context);
    }
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
                        Text('Forgot Your Password',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),

                        SizedBox(height: 27),
                        Text(
                            'Input the email you registered and a reset link will be sent.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),

                        SizedBox(height: 26),
                        // form
                        Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Email Address *',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(height: 14),
                                Input(
                                  borderColor: Color(0xff3E4145),
                                  fillColor: Color(0xff2C3644),
                                  labelText: 'Enter email address',
                                  validator: (String? value) {
                                    if (value == '')
                                      return 'Email cannot be empty';
                                  },
                                  onSaved: (String? value) {
                                    email = value;
                                  },
                                ),
                                SizedBox(height: 26),
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
                                          submit(context);
                                          // Navigator.pushNamed(
                                          //     context, MoviePremiereRoute);
                                        },
                                        child: Text('Reset Account Password',
                                            style: TextStyle(
                                                color: Color(0xffffffff),
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500)))),
                                SizedBox(height: 32),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Remember Password?",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(width: 10),
                                    InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, LoginRoute);
                                        },
                                        child: Text('Login',
                                            style: TextStyle(
                                                color: Color(0xff0096C7),
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500)))
                                  ],
                                )
                              ],
                            ))
                      ],
                    )))));
  }
}
