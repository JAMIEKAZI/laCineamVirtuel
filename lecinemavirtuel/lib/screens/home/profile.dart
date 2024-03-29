import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lecinemavirtuel/common/appBarWrapper.dart';
import 'package:lecinemavirtuel/common/app_bar_action.dart';
import 'package:lecinemavirtuel/common/app_bar_leading.dart';

import 'package:lecinemavirtuel/common/cinema_wrapper.dart';
import 'package:lecinemavirtuel/components/inputText.dart';
import 'package:lecinemavirtuel/components/sideDrawer.dart';
import 'package:lecinemavirtuel/helpers/flushBar.dart';
import 'package:lecinemavirtuel/models/changePasswordModel.dart';
import 'package:lecinemavirtuel/models/editProfileModel.dart';
import 'package:lecinemavirtuel/models/editProfileModel.dart';
import 'package:lecinemavirtuel/services/auth_service.dart';
import 'package:lecinemavirtuel/services/controller/main_controller.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProfileState();
  }
}

class ProfileState extends State<Profile> {
  int tabIndex = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final AuthService authService = AuthService();
  final EditProfileModel editProfileModel = EditProfileModel();
  final ChangePasswordModel changePasswordModel = ChangePasswordModel();
  final CustomFlushBar customFlushBar = CustomFlushBar();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isEnabled = false;
  bool obscurePassword = true;
  bool obscureNewPassword = true;
  bool obscureConfirmPassword = true;
  List countries = [];

  void initState() {
    MainController c = Get.put(MainController());
    fetchCountries();
    countryController.text = '${c.userData.value.country!.name}';
    editProfileModel.countryId = c.userData.value.country!.id;

    super.initState();

    // _chatNotificationCheckStream.add(false);
  }

  @override
  void dispose() async {
    super.dispose();
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
      final result = await authService.upateAccount(editProfileModel);
      print('result $result');
      setState(() {
        isEnabled = !isEnabled;
      });
      customFlushBar.showSuccessFlushBar(
          title: 'Profile Updated',
          body: 'Profile information successfuly updated',
          context: context);
      // _successDialog(context);
    } catch (e) {
      // show flushbar
      customFlushBar.showErrorFlushBar(
          title: 'Error occured', body: '$e', context: context);
    }
  }

  changePassword(context) async {
    try {
      if (!_formKey.currentState!.validate()) {
        return;
      }
      _formKey.currentState!.save();
      final result = await authService.updatePassword(changePasswordModel);
      print('result $result');
      setState(() {
        isEnabled = !isEnabled;
      });
      customFlushBar.showSuccessFlushBar(
          title: 'Password Updated',
          body: 'Account password successfuly updated',
          context: context);
      // _successDialog(context);
    } catch (e) {
      // show flushbar
      customFlushBar.showErrorFlushBar(
          title: 'Error occured', body: '$e', context: context);
    }
  }

  void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }

  _displayDialog(BuildContext context) {
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
                                  editProfileModel.countryId =
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

  toggleObscurePassword() {
    obscurePassword = !obscurePassword;
    setState(() {});
  }

  toggleNewObscurePassword() {
    setState(() {
      obscureNewPassword = !obscureNewPassword;
    });
  }

  toggleConfirmObscurePassword() {
    setState(() {
      obscureConfirmPassword = !obscureConfirmPassword;
    });
  }

  Widget build(BuildContext context) {
    MainController c = Get.put(MainController());

    return Obx(() => CinemaWrapper(
        child: Scaffold(
            key: _key,
            drawer: NavigationDrawer(),
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              centerTitle: true,
              flexibleSpace: AppBarWrapper(),
              leading: AppBarLeading(),
              title: Text('My Profile'),
              actions: [
                AppBarAction(
                  scaffoldKey: _key,
                )
              ],
            ),
            body: SingleChildScrollView(
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 36),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Your Profile Information',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500))),
                          SizedBox(height: 43),
                          Form(
                              key: _formKey,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('FirstName *',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(height: 14),
                                    Input(
                                      enabled: isEnabled,
                                      init: '${c.userData.value.firstName}',
                                      borderColor: Color(0xff3E4145),
                                      fillColor: Color(0xff2C3644),
                                      validator: (String? value) {
                                        if (value == '')
                                          return 'First name cannot be empty';
                                      },
                                      onSaved: (String? value) {
                                        editProfileModel.firstName = value;
                                      },
                                    ),
                                    SizedBox(height: 15),
                                    Text('LastName *',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(height: 14),
                                    Input(
                                      enabled: isEnabled,
                                      init: '${c.userData.value.lastName}',
                                      borderColor: Color(0xff3E4145),
                                      fillColor: Color(0xff2C3644),
                                      validator: (String? value) {
                                        if (value == '')
                                          return 'Last name cannot be empty';
                                      },
                                      onSaved: (String? value) {
                                        editProfileModel.lastName = value;
                                      },
                                    ),
                                    SizedBox(height: 15),
                                    Text('Email Address *',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(height: 14),
                                    Input(
                                      borderColor: Color(0xff3E4145),
                                      fillColor: Color(0xff2C3644),
                                      enabled: false,
                                      init: '${c.userData.value.email}',
                                      validator: (String? value) {
                                        if (value == '')
                                          return 'Email cannot be empty';
                                      },
                                      onSaved: (String? value) {},
                                    ),
                                    SizedBox(height: 15),
                                    Text('Country *',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(height: 14),
                                    isEnabled
                                        ? Input(
                                            controller: countryController,
                                            readOnly: false,
                                            onTap: () {
                                              _displayDialog(context);
                                              FocusScope.of(context).unfocus();
                                            },
                                            borderColor: Color(0xff3E4145),
                                            suffixIcon: Icon(
                                                Icons.keyboard_arrow_down,
                                                color: Colors.white),
                                            fillColor: Color(0xff2C3644),
                                            // labelText: 'Select Country',
                                            validator: (String? value) {
                                              if (countryController.text ==
                                                      null ||
                                                  countryController.text == '')
                                                return 'Select your country';
                                            },
                                            onSaved: (String? value) {},
                                          )
                                        : Input(
                                            enabled: false,
                                            controller: countryController,
                                            readOnly: false,
                                            onTap: () {
                                              // _displayDialog(context);
                                              FocusScope.of(context).unfocus();
                                            },
                                            borderColor: Color(0xff3E4145),
                                            suffixIcon: Icon(
                                                Icons.keyboard_arrow_down,
                                                color: Colors.white),
                                            fillColor: Color(0xff2C3644),
                                            validator: (String? value) {
                                              if (countryController.text ==
                                                      null ||
                                                  countryController.text == '')
                                                return 'Select your country';
                                            },
                                            onSaved: (String? value) {},
                                          ),
                                    SizedBox(height: 38),
                                    !isEnabled
                                        ? Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
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
                                                  setState(() {
                                                    isEnabled = !isEnabled;
                                                  });
                                                  // submit(context);
                                                  // Navigator.pushNamed(
                                                  //     context, MoviePremiereRoute);
                                                },
                                                child: Text(
                                                    'Edit Profile Information',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xffffffff),
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500))))
                                        : Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
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

                                                  // submit(context);
                                                  // Navigator.pushNamed(
                                                  //     context, MoviePremiereRoute);
                                                },
                                                child: Text('Submit', style: TextStyle(color: Color(0xffffffff), fontSize: 18, fontWeight: FontWeight.w500)))),
                                    SizedBox(height: 35),
                                    Text('Change Account Password',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(height: 43),
                                    Text('Current Password *',
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
                                      labelText: 'Current Password *',
                                      validator: (String? value) {
                                        if (value == '')
                                          return 'Password cannot be empty';
                                      },
                                      onSaved: (String? value) {
                                        changePasswordModel.currentPassword =
                                            value;
                                      },
                                    ),
                                    SizedBox(height: 15),
                                    Text('New Password *',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(height: 14),
                                    Input(
                                      controller: newPasswordController,
                                      borderColor: Color(0xff3E4145),
                                      obscureText: obscureNewPassword,
                                      suffixIcon: GestureDetector(
                                          onTap: () {
                                            toggleNewObscurePassword();
                                            rebuildAllChildren(context);
                                          },
                                          child: Icon(
                                              obscureNewPassword
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: Colors.white)),
                                      fillColor: Color(0xff2C3644),
                                      labelText: 'New Password *',
                                      validator: (String? value) {
                                        if (value == '')
                                          return 'Password cannot be empty';
                                        else if (value!.length < 5)
                                          return 'Password must 6 characters or more';
                                      },
                                      onSaved: (String? value) {
                                        changePasswordModel.newPassword = value;
                                      },
                                    ),
                                    SizedBox(height: 15),
                                    Text('Confirm Password *',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(height: 14),
                                    Input(
                                      borderColor: Color(0xff3E4145),
                                      obscureText: obscureConfirmPassword,
                                      suffixIcon: GestureDetector(
                                          onTap: () {
                                            toggleConfirmObscurePassword();
                                            rebuildAllChildren(context);
                                          },
                                          child: Icon(
                                              obscureConfirmPassword
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: Colors.white)),
                                      fillColor: Color(0xff2C3644),
                                      labelText: 'Confirm Password *',
                                      validator: (String? value) {
                                        if (value == '')
                                          return 'Password cannot be empty';
                                        else if (value !=
                                            newPasswordController.text)
                                          return "Pasword doesn't match";
                                      },
                                      onSaved: (String? value) {
                                        changePasswordModel.confirmPassword =
                                            value;
                                      },
                                    ),
                                    SizedBox(height: 26),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width,
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
                                              changePassword(context);

                                              // submit(context);
                                              // Navigator.pushNamed(
                                              //     context, MoviePremiereRoute);
                                            },
                                            child: Text(
                                                'Change Account Password',
                                                style: TextStyle(
                                                    color: Color(0xffffffff),
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500)))),
                                    SizedBox(height: 40),
                                  ])),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                  backgroundColor: Color(0xff2077C8),
                                  child: Center(
                                      child: SvgPicture.asset(
                                    'assets/images/logout.svg',
                                    fit: BoxFit.cover,
                                    width: 20,
                                  ))),
                              SizedBox(width: 7),
                              Text('Log Out',
                                  style: TextStyle(
                                      color: Color(0xffffffff),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
                          SizedBox(height: 60),
                        ]))))));
  }
}
