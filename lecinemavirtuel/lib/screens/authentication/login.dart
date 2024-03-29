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

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final AuthService authService = AuthService();
  final SigninModel signinModel = SigninModel();
  final CustomFlushBar customFlushBar = CustomFlushBar();
  final TextEditingController countryController = TextEditingController();
  List countries = [];
  bool obscurePassword = true;
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
      final result = await authService.signIn(signinModel);
      print('result $result');
      Navigator.pushReplacementNamed(context, MoviePremiereRoute);
    } catch (e) {
      // show flushbar
      customFlushBar.showErrorFlushBar(
          title: 'Error occured', body: '$e', context: context);
    }
  }

  toggleObscurePassword() {
    obscurePassword = !obscurePassword;
    setState(() {});
  }

  void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
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
                            height: MediaQuery.of(context).size.height * 0.078),
                        SvgPicture.asset(
                          'assets/cinemaappLogo.svg',
                        ),
                        SizedBox(height: 30),
                        Text('Start Streaming High Quality Movies Today!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 28,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),

                        SizedBox(height: 56),
                        MaterialButton(
                            color: Color(0xffffffff),
                            padding: EdgeInsets.symmetric(vertical: 15),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/googleIcon.svg',
                                ),
                                SizedBox(width: 10),
                                Text('Sign In Using Google',
                                    style: TextStyle(
                                        color: Color(0xff20262D),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500))
                              ],
                            )),
                        SizedBox(height: 26),
                        HorizontalOrLine(height: 10, label: 'or'),
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
                                    signinModel.email = value;
                                  },
                                ),
                                SizedBox(height: 26),
                                Text('Password *',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(height: 14),
                                Input(
                                  borderColor: Color(0xff3E4145),
                                  obscureText: obscurePassword,
                                  suffixIcon: GestureDetector(
                                      onTap: () {
                                        toggleObscurePassword();
                                        rebuildAllChildren(context);
                                      },
                                      child: Icon(
                                          obscurePassword
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: Colors.white)),
                                  fillColor: Color(0xff2C3644),
                                  labelText: 'Enter password',
                                  validator: (String? value) {
                                    if (value == '')
                                      return 'Password cannot be empty';
                                    else if (value!.length < 5)
                                      return 'Password must 6 characters or more';
                                  },
                                  onSaved: (String? value) {
                                    signinModel.password = value;
                                  },
                                ),
                                SizedBox(height: 5),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                        onTap: () => Navigator.pushNamed(
                                            context, ForgotPasswordRoute),
                                        child: Text('Forgot Password',
                                            style: TextStyle(
                                                color: Color(0xff0096C7),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500)))),
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
                                        child: Text('Login',
                                            style: TextStyle(
                                                color: Color(0xffffffff),
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500)))),
                                SizedBox(height: 32),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Don't have an account?",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(width: 10),
                                    InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, RegisterRoute);
                                        },
                                        child: Text('Register',
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
