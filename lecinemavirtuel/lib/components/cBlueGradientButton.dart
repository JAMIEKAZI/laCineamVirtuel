import 'package:flutter/material.dart';
import 'package:lecinemavirtuel/helpers/customColors.dart';

class CGradientButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  CGradientButton({required this.onPressed, required this.title});

  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(gradient: CustomColors.BlueGradient),
        child: MaterialButton(
            onPressed: () {
              onPressed();
            },
            child: Text('$title',
                style: TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 18,
                    fontWeight: FontWeight.w500))));
  }
}
