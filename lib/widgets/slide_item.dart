import 'package:flutter/material.dart';

import '../model/slide.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(slideList[index].imageUrl),
              fit: BoxFit.cover
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
            slideList[index].title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Color(0xff1d976c),
              fontFamily: 'Monserrat',
              fontStyle: FontStyle.normal
            ),
        ),
        SizedBox(
          height: 20,
        ),
          Text(
            slideList[index].description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Monserrat',
              fontStyle: FontStyle.normal),
          ),
      ],
    );
  }
}
