import 'package:flutter/material.dart';

import './form_container.dart';

class UserProfileEditScreen extends StatelessWidget {
  static const routeName = '/user-profile-edit';

  @override
  Widget build(BuildContext context) {
    final appHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final appWidth = MediaQuery.of(context).size.width;

    final routeArgs = ModalRoute.of(context).settings.arguments as Map;

    final userName = routeArgs['name'];
    final userImage = routeArgs['imageUrl'];
    final userGender = routeArgs['gender'];
    final userDob = routeArgs['dob'];
    final userEmail = routeArgs['email'];
    final userPhoneNumber = routeArgs['phoneNumber'];
    final userOccupation = routeArgs['occupation'];

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: Image.asset(
              'assets/images/theBERRY.jpeg',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Positioned(
            top: 40,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back
              ), 
              iconSize: 40,
              color: Colors.white,
              onPressed: (){
                Navigator.pop(context);
              }
            ),
          ),
          Column(
            children: <Widget>[
              SizedBox(height: appHeight*0.3),
              FormContainer(
                userName,
                userGender,
                userDob,
                userEmail,
                userPhoneNumber,
                userOccupation
              )
            ],
          ),
          Positioned(
            top: appHeight*0.17,
            left: appWidth*0.325,
            child: CircleAvatar(
              radius: 75,
              backgroundImage: NetworkImage(
                userImage,
              ),
            ),
          ),
        ], 
      ),
    );
  }
}


