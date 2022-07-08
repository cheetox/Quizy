import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quizlen/constants/text_constants.dart';
import 'package:quizlen/extension/context_extension.dart';
import 'package:quizlen/pages/authentication_pages/login_page.dart';
import 'package:quizlen/services/AuthenticationService.dart';
import 'package:quizlen/services/UserServices.dart';

import '../../components/reusable_widgets.dart';

void main() => runApp(EditProfileScreen());

class EditProfileScreen extends StatefulWidget {
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}



class _EditProfileScreenState extends State<EditProfileScreen> {

  void initState() {

    print("init leader");
    // TODO: implement initState
    getList();
    super.initState();
  }

  List<Object> userRank = [];

  Future getList() async {
    var data = await FirebaseFirestore.instance
        .collection('users')
        .orderBy('Score', descending: true)
        .get();

    setState(() {
      userRank = List.from(data.docs.map((doc) => doc.id));
      print(userRank.indexOf(FirebaseAuth.instance.currentUser!.uid)+1);
    });
  }


  AuthService _authService=AuthService();
  UserService _userService=UserService();
  @override
  Widget build(BuildContext context) {
    print(userRank.indexOf(FirebaseAuth.instance.currentUser!.uid)+1);

    return Scaffold(
      backgroundColor: Color(0xffE1CCEC),
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar(context),
      body: FutureBuilder<List<String>>(
          future: _userService.getCurrentUser(),
          builder: (context,snapshot) {
            return !snapshot.hasData
                ? Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(
                  backgroundColor: Colors.grey,
                  color: Colors.purple,
                  strokeWidth: 10,
                ))
                :  Center(
                child: Column(
                  children: [
                    CircleAvatarWidget(context,snapshot.data![2]),
                    nickNameText(context,snapshot.data![0]),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: EdgeInsets.only(top: context.dynamicHeight(0.03)),
                        child: Container(
                          decoration:  BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(40),
                                  topLeft: Radius.circular(40)),
                              color: Colors.white),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: context.dynamicWidth(0.1),
                                right: context.dynamicWidth(0.1),
                                top: context.dynamicHeight(0.03)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TabTexts(context),
                                Tabs(context,snapshot.data![1],(userRank.indexOf(FirebaseAuth.instance.currentUser!.uid)+1).toString()),
                                const Divider(height: 5, thickness: 3),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: context.dynamicHeight(0.02),
                                      left: 10,
                                      right: 10,
                                      bottom: 10),
                                  child: Column(
                                    children: [
                                      ChooseAvatar(context),
                                      ChangePassword(context),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  height: 5,
                                  thickness: 2,
                                  color: Colors.black,
                                ),
                                SignOut(context),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ));
          }
      ),
    );
  }

  Row SignOut(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Çıkış Yap",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        IconButton(
            iconSize: 35, onPressed: () {
          _authService.Logout(context);

        }, icon: Icon(Icons.exit_to_app))
      ],
    );
  }

  Row ChangePassword(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Şifre Değiştir",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios))
      ],
    );
  }

  Row ChooseAvatar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Avatar Seç",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        IconButton(onPressed: () {
        _userService.changeAvatars('https://firebasestorage.googleapis.com/v0/b/cookcaquiz.appspot.com/o/1.png?alt=media&token=abcd8ce4-6227-4454-99b2-a3590b95246a');
        }, icon: Icon(Icons.arrow_forward_ios))
      ],
    );
  }

  Padding Tabs(BuildContext context,puan,userRank) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //yazılar
          CircleAvatar(
            radius: 30,
            backgroundColor: Color(0xff26CE55),
            child: ReusableWidgets.getImageAsset("tarih.png"),
          ),
          CircleAvatar(
            radius: 30,
            backgroundColor: Color(0xff00B2FF),
            child: Text(
              puan,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.white),
            ),
          ),
          CircleAvatar(
            radius: 30,
            backgroundColor: Color(0xffFF0000),
            child: Text(
              userRank,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Row TabTexts(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              "Favori",
              style: TextConstants.favCategoryTextStyle(context),
            ),
            Text(
              "Kategori",
              style: TextConstants.favCategoryTextStyle(context),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "Toplam",
              style: TextConstants.favCategoryTextStyle(context),
            ),
            Text(
              "Puan",
              style: TextConstants.favCategoryTextStyle(context),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "Başarı",
              style: TextConstants.favCategoryTextStyle(context),
            ),
            Text(
              "Sırası",
              style: TextConstants.favCategoryTextStyle(context),
            ),
          ],
        ),
      ],
    );
  }

  Text nickNameText(BuildContext context,name) {
    return Text(
      name,
      style: Theme.of(context)
          .textTheme
          .headline5
          ?.copyWith(color: Color(0xff5E5F5E)),
    );
  }

  Expanded CircleAvatarWidget(BuildContext context,avatar) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: context.dynamicHeight(0.05)),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Image.network(avatar),
          radius: 75,
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      title: Text(
        'Profil',
        style: TextConstants.whiteAppBarTextStyle(context),
      ),
    );
  }
}