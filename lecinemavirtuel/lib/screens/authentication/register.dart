import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lecinemavirtuel/common/cinema_wrapper.dart';
import 'package:lecinemavirtuel/common/route_constants.dart';
import 'package:lecinemavirtuel/components/cButton.dart';
import 'package:lecinemavirtuel/components/horizontalOrLine.dart';
import 'package:lecinemavirtuel/components/inputText.dart';
import 'package:lecinemavirtuel/helpers/flushBar.dart';
import 'package:lecinemavirtuel/models/signupModel.dart';
import 'package:lecinemavirtuel/services/auth_service.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RegisterState();
  }
}

class RegisterState extends State<Register> {
  final AuthService authService = AuthService();
  final SignupModel signupModel = SignupModel();
  final CustomFlushBar customFlushBar = CustomFlushBar();
  final TextEditingController countryController = TextEditingController();
  List countries = [];
  bool obscurePassword = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) => fetchCountries());

    super.initState();
  }

  fetchCountries() async {
    try {
      var response = await authService.fetchCountries();
      print('countries $response');
      setState(() {
        countries = response['data'];
      });
      print('countries $countries');
    } catch (e) {
      print('error $e');
    }
  }

  submit(context) async {
    try {
      if (!_formKey.currentState!.validate()) {
        return;
      }
      _formKey.currentState!.save();
      final result = await authService.signUp(signupModel);
      print('result $result');
      _successDialog(context);
    } catch (e) {
      // show flushbar
      customFlushBar.showErrorFlushBar(
          title: 'Error occured', body: '$e', context: context);
    }
  }

  _displayDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionDuration: Duration(milliseconds: 500),
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
        return SafeArea(
          child: CinemaWrapper(
              child: Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    automaticallyImplyLeading: false,
                    title: Text(
                      'Select country',
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
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: ListView.builder(
                        itemCount: countries.length,
                        itemBuilder: (BuildContext context, index) {
                          return InkWell(
                              onTap: () {
                                setState(() {
                                  countryController.text =
                                      countries[index]['name'];
                                  signupModel.countryId =
                                      countries[index]['id'];
                                  FocusScope.of(context).unfocus();
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text(
                                '${countries[index]['name']}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    height: 2),
                              ));
                        },
                      ),
                    ),
                  ))),
        );
      },
    );
  }

  _successDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionDuration: Duration(milliseconds: 500),
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
        return SafeArea(
          child: CinemaWrapper(
              child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.all(20),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Your account has been created',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 25,
                                color: Colors.white)),
                        SizedBox(height: 20),
                        InkWell(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, LoginRoute);
                            },
                            child: Text('Proceed to Login',
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xff2077C8))))
                      ],
                    )),
                  ))),
        );
      },
    );
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
                        SizedBox(height: 36),
                        Row(
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: CBlueButtonWithIcon(
                                    title: Text('Register As User',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500)),
                                    onpressed: () {},
                                    icon: Icon(Icons.person,
                                        size: 15, color: Colors.white))),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: CWhiteButtonWithIcon(
                                    title: Text('Register As FilmMaker',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500)),
                                    onpressed: () {},
                                    icon: Icon(Icons.video_camera_front,
                                        size: 15, color: Colors.white))),
                          ],
                        ),
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
                                Text('Sign Up Using Google',
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
                                Text('First Name *',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(height: 14),
                                Input(
                                  borderColor: Color(0xff3E4145),
                                  fillColor: Color(0xff2C3644),
                                  labelText: 'Enter first name',
                                  validator: (String? value) {
                                    if (value == '')
                                      return 'First name cannot be empty';
                                  },
                                  onSaved: (String? value) {
                                    signupModel.firstName = value;
                                  },
                                ),
                                SizedBox(height: 26),
                                Text('Last Name *',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(height: 14),
                                Input(
                                  borderColor: Color(0xff3E4145),
                                  fillColor: Color(0xff2C3644),
                                  labelText: 'Enter last name',
                                  validator: (String? value) {
                                    if (value == '')
                                      return 'Last name cannot be empty';
                                  },
                                  onSaved: (String? value) {
                                    signupModel.lastName = value;
                                  },
                                ),
                                SizedBox(height: 26),
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
                                    signupModel.email = value;
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
                                    signupModel.password = value;
                                  },
                                ),
                                SizedBox(height: 26),
                                Text('Country *',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(height: 14),
                                Input(
                                  controller: countryController,
                                  readOnly: false,
                                  onTap: () {
                                    _displayDialog(context);
                                    FocusScope.of(context).unfocus();
                                  },
                                  borderColor: Color(0xff3E4145),
                                  suffixIcon: Icon(Icons.keyboard_arrow_down,
                                      color: Colors.white),
                                  fillColor: Color(0xff2C3644),
                                  labelText: 'Select Country',
                                  validator: (String? value) {
                                    if (countryController.text == null ||
                                        countryController.text == '')
                                      return 'Select your country';
                                  },
                                  onSaved: (String? value) {},
                                ),
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
                                        child: Text(
                                            'Start Using Le Virtuel Cinéma',
                                            style: TextStyle(
                                                color: Color(0xffffffff),
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500)))),
                                SizedBox(height: 32),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Already A Member?',
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
