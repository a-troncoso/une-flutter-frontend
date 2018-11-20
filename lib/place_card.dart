import 'package:flutter/material.dart';
import 'dart:ui';

final _cardHeight = 225.0;
const _borderInfo = Colors.grey;

class PlaceCard extends StatelessWidget {
  final String placeImage;
  final String placeName;
  final String placeDate;
  final String placeNameAddress;
  final int sellerCount;
  final int favoriteCount;

  const PlaceCard({
    Key key,
    @required this.placeImage,
    @required this.placeName,
    @required this.placeDate,
    @required this.placeNameAddress,
    @required this.sellerCount,
    @required this.favoriteCount,
  })  : assert(placeImage != null),
        assert(placeName != null),
        assert(placeDate != null),
        assert(placeNameAddress != null),
        assert(sellerCount != null),
        assert(favoriteCount != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final placeNameWidget = Text(
        placeName.toUpperCase(),
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
            fontSize: 35.0
        )
    );

    final imageSection = Stack(
        children: [
          Image.network(
              placeImage,
              height: 150.0,
              fit: BoxFit.fitWidth,
              width: double.infinity
          ),
          new Positioned(
              bottom: 5.0,
              left: 10.0,
              child: placeNameWidget
          )
        ]
    );

    final infoSection = Container(
        height: 75.0,
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
                      children: [
                        Text(placeDate),
                        Text(placeNameAddress),
                        Text('${sellerCount.toString()} vendedores')
                      ]
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
        child: Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Container(
                height: _cardHeight,
                child: Container(
                    child: Column(
                        children: <Widget>[
                          imageSection,
                          infoSection
                        ]
                    )
                )
            )
        )
    );
  }
}
