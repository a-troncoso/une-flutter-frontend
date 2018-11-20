import 'package:flutter/material.dart';
import './place_card.dart';
import './user_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  static const _placesNames = <String>[
    'feria del libro usado',
    'feria espiritual',
    'feria de artesanía maya',
    'feria de peluqueros y barberos',
    'feria de Chiloé y sus magia',
    'feria digital'
  ];

  static const _userNames = <String>[
    'maría machuca lastarria mercedes suvercaseaux gilipollas',
    'camila rincón',
    'sonia vivanco',
    'susana soto',
    'maría machuca lastarria mercedes suvercaseaux gilipollas',
    'camila rincón',
    'sonia vivanco',
    'susana soto',
    'maría machuca lastarria mercedes suvercaseaux gilipollas',
    'camila rincón',
    'sonia vivanco',
    'susana soto'
  ];

  final primaryColor = const Color(0xFF0FBCB0);
  final primaryTextColor = Colors.white;
  final loginButtonHeight = 50.0;
  final gridColCount = 2;

  Widget _buildPlaceCardListView(List<Widget> places) {
    return ListView.builder(
        itemBuilder: (BuildContext context, int index) => places[index],
        itemCount: places.length
    );
  }

  Widget _buildUserCardGrid(List<Widget> users, BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemWidth = size.width / gridColCount;

    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: gridColCount,
            //mainAxisSpacing: 10.0,
            //crossAxisSpacing: 10.0,
            childAspectRatio: 1.15,
            //childAspectRatio: (itemWidth / 235.0)
        ),
        itemBuilder: (BuildContext context, int index) => users[index],
    itemCount: _userNames.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    final places = <PlaceCard>[];
    final users = <UserCard>[];

    for (var i = 0; i < _placesNames.length; i++) {
      places.add(PlaceCard(
          placeImage: 'https://storage.googleapis.com/mmc-cdn-bucket/uploads/2017/04/45f63ff2-feria-del-libro-primer-dia.jpg',
          placeName: _placesNames[i],
          placeDate: 'Hoy hasta las 20:00 hrs.',
          placeNameAddress: 'Lastarria #423',
          sellerCount: 23,
          favoriteCount: 7
      ));
    }
    for(var i = 0; i <_userNames.length; i++) {
      users.add(
          UserCard(
              coverImage: 'https://d1nz104zbf64va.cloudfront.net/dt/a/o/top-7-books-that-changed-the-world.jpg',
              userImage: 'https://www.w3schools.com/w3images/avatar6.png',
              userName: _userNames[i],
              activityDesc: 'Libros para niños grandes y chicos',
              favoriteCount: 7
          )
      );
    }

    final appBar = AppBar(
        bottom: TabBar(
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            tabs: [
              Tab(text: '${'lugares'}'.toUpperCase()),
              Tab(text: '${'vendedores'}'.toUpperCase())
            ]
        )
    );

    final placesList = Container(
      padding: EdgeInsets.only(
          left: 10.0,
          top: 10.0,
          right: 10.0,
          bottom: loginButtonHeight
      ),
      child: _buildPlaceCardListView(places),
    );

    final sellersGird = Container(
      margin: EdgeInsets.only(
          //left: 10.0,
          top: 10.0,
          //right: 10.0,
          bottom: loginButtonHeight
      ),
      child: _buildUserCardGrid(users, context)
    );

    final fixedLoginButton = Positioned(
        left: 0.0,
        right: 0.0,
        bottom: 0.0,
        child: ButtonTheme(
            height: loginButtonHeight,
            child: RaisedButton(
              onPressed: () => print('I was tapped!'),
              color: primaryColor,
              child: Text(
                '${'iniciar sesión'}'.toUpperCase(),
                style: TextStyle(color: primaryTextColor),
              ),
            )
        )
    );

    return Scaffold(
        appBar: appBar,
        body: TabBarView(
            children: [
              Stack(
                  children: <Widget>[
                    placesList,
                    fixedLoginButton
                  ]
              ),
              Stack(
                  children: <Widget>[
                    sellersGird,
                    fixedLoginButton
                  ]
              )
            ])
    );
  }
}
