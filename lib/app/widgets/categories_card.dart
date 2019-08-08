import 'package:flutter/material.dart';
import 'package:frank_and_joes/app/utils/constants/theme.dart';

class CategoriesCard extends StatefulWidget {
  final String title;
  final IconData icon;

  CategoriesCard({this.title, this.icon});
  @override
  _CategoriesCardState createState() => _CategoriesCardState();
}

class _CategoriesCardState extends State<CategoriesCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

    return Column(
      children: <Widget>[
        Container(
          width: 150.0,
          height: deviceHeight * .12,
          margin: EdgeInsets.only(left: 10.0),
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 3.0,
                color: Colors.black.withOpacity(0.1),
                offset: Offset(3.0, 3.0),
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Icon(
                widget.icon,
                size: 28.0,
                color: CustomColors.teal,
              ),
              Text(
                widget.title,
                style: TextStyle(fontSize: 18.0, fontFamily: 'Oswald'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
