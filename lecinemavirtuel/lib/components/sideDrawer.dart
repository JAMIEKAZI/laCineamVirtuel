import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lecinemavirtuel/common/route_constants.dart';
import 'package:lecinemavirtuel/screens/home/profile.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget createDrawerHeader() {
      return DrawerHeader(
        child: Container(
            width: 50,
            child: Center(
                child: SvgPicture.asset(
              'assets/cinemaappLogo.svg',
              fit: BoxFit.cover,
            ))),
      );
    }

    return Drawer(
        child: Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
            colors: [
              const Color(0xFF2C3644),
              const Color(0xFF3E4145),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createDrawerHeader(),
          DrawerItem(
              icon: 'assets/images/video.svg',
              title: 'Movies Premiere',
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, MoviePremiereRoute);
              }),
          DrawerItem(
              icon: 'assets/images/play.svg',
              title: 'My Movies',
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, MoviesHomeRoute);
              }),
          DrawerItem(
              icon: 'assets/images/profile.svg',
              title: 'My Profile',
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Profile()));
                // Get.to(Profile());
              }),
          DrawerItem(
              icon: 'assets/images/logout.svg',
              title: 'Logout',
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, LoginRoute);
                // Get.to(Profile());
              }),
        ],
      ),
    ));
  }
}

class DrawerItem extends StatelessWidget {
  final String? icon;
  final String? title;
  Function? onPressed;
  DrawerItem({this.icon, this.title, this.onPressed});

  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          backgroundColor: Color(0xff2077C8),
          child: Center(
              child: SvgPicture.asset(
            '$icon',
            fit: BoxFit.cover,
            width: 20,
          ))),
      title: Text('$title',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)),
      onTap: () => onPressed!(),
    );
  }
}
