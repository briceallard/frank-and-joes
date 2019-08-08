import 'package:flutter/material.dart';
import 'package:frank_and_joes/app/utils/constants/theme.dart';

class PicksCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final AssetImage assetImage;

  PicksCard({this.title, this.description, this.icon, this.assetImage});

  @override
  _PicksCardState createState() => _PicksCardState();
}

class _PicksCardState extends State<PicksCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.all(15.0),
      height: deviceHeight * 30,
      width: 225.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 5.0,
            offset: Offset(10.0, 10.0),
          ),
        ],
      ),
      child: Stack(
        children: <Widget>[
          Container(
            height: 150.0,
            width: 225.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
                bottomLeft: Radius.circular(50.0),
              ),
              image: DecorationImage(
                image: widget.assetImage,
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 5.0,
                  offset: Offset(2.0, 2.0),
                ),
              ],
            ),
          ),
          Positioned(
            top: 150.0,
            left: 0.0,
            right: 0.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                    softWrap: true,
                    maxLines: 2,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.star, color: CustomColors.orange),
                      Icon(Icons.star, color: CustomColors.orange),
                      Icon(Icons.star, color: CustomColors.orange),
                      Icon(Icons.star, color: CustomColors.orange),
                      Icon(Icons.star_half, color: CustomColors.orange),
                      Text('(265)'),
                    ],
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    widget.description,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                    softWrap: true,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            right: 10.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '\$4.99',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Positioned(
            top: 120.0,
            right: 10.0,
            child: FloatingActionButton(
              mini: true,
              elevation: 5.0,
              backgroundColor: CustomColors.white,
              onPressed: () {},
              child: Icon(
                widget.icon,
                color: CustomColors.teal,
                size: 22.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
