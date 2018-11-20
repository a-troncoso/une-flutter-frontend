import 'package:flutter/material.dart';

final _cardHeight = 225.0;
const _borderInfo = Colors.grey;

class UserCard extends StatelessWidget {
  final String coverImage;
  final String userImage;
  final String userName;
  final String activityDesc;
  final int favoriteCount;

  const UserCard({
    Key key,
    @required this.coverImage,
    @required this.userImage,
    @required this.userName,
    @required this.activityDesc,
    @required this.favoriteCount
  })  : assert(userImage != null),
        assert(coverImage != null),
        assert(userName != null),
        assert(activityDesc != null),
        assert(favoriteCount != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final userNameWidget = Text(
        userName.toUpperCase(),
        style: TextStyle(
            shadows: <Shadow>[
              Shadow(
                offset: Offset(3.0, 3.0),
                blurRadius: 7.0,
                color: Colors.black,
              )
            ],
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20.0
        )
    );

    final circularImageWidget = Container(
        width: 70.0,
        height: 70.0,
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
                fit: BoxFit.fill,
                image: new NetworkImage(userImage)
            )
        )
    );

    final coverImageSection = Stack(
        children: [
          Image.network( // Cover image
              coverImage,
              //height: 150.0,
              fit: BoxFit.fill,
              width: double.infinity
          ),
          new Positioned( // Avatar image and username
              bottom: 5.0,
              left: 10.0,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: circularImageWidget,
                  ),
                  userNameWidget
                ],
              )
          )
        ]
    );

    final infoSection = Container(
        //height: 75.0,
        decoration: const BoxDecoration(
          border: Border(
            left: BorderSide(width: 1.0, color: _borderInfo),
            right: BorderSide(width: 1.0, color: _borderInfo),
            bottom: BorderSide(width: 1.0, color: _borderInfo),
          ),
        ),
        child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [ Text(activityDesc) ]
                  ),
                  Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 5.0),
                          child: Icon(Icons.favorite_border),
                        ),
                        Text(favoriteCount.toString())
                      ]
                  )
                ]
            )
        )
    );

    return Material(
            child: Container(
                //height: _cardHeight,
                width: _cardHeight,
                child: Column(
                    children: <Widget>[
                      coverImageSection,
                      infoSection
                    ]
                )
            )
    );
  }
}