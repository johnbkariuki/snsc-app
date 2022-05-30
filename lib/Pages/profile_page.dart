import 'package:flutter/material.dart';
import 'package:snsc/Functions_and_Vars/api_services.dart';
import 'package:snsc/Pages/account_page.dart';
import 'package:snsc/models/user.dart';
import 'package:snsc/widgets/all_widgets.dart';

import '../config/accesibility_config.dart';
import '../config/pallete.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<User> user;

  Future<User> getUser() async {
    return await APIService.getUserInfo();
  }

  void refreshPage() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    user = getUser();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(screenWidth < 700
              ? "Assets/background_1.jpg"
              : "Assets/web_background_1.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor:
            Preferences.usingDarkMode() ? Colors.black : Colors.transparent,
        body: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              child: Column(children: [
                AppBarReturn(
                  returnPage: const AccountPage(),
                  popContext: true,
                  callBack: refreshPage,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
                  child: Image(
                    image: AssetImage('Assets/high_res_SNSC_logo.png'),
                    width: 200,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    Text("My Profile",
                        style: TextStyle(
                            color: Pallete.buttonGreen,
                            fontFamily: Preferences.currentFont(),
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                FutureBuilder(
                  future: user,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    Widget child;
                    if (snapshot.hasData) {
                      child = SizedBox(
                        height: 650,
                        width: 450,
                        child: ListView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Divider(
                                thickness: 2,
                                color: Preferences.usingDarkMode()
                                    ? Colors.white
                                    : Colors.grey,
                              ),
                            ),
                            ProfileText(
                                tittle: "Name",
                                content: "${snapshot.data.name}"),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 100.0,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 0.0, 8.0, 8.0),
                                child: Divider(
                                  thickness: 2,
                                  color: Preferences.usingDarkMode()
                                      ? Colors.white
                                      : Colors.grey,
                                ),
                              ),
                            ),
                            ProfileText(
                                tittle: "Email",
                                content: "${snapshot.data.email}"),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 100,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 0.0, 8.0, 8.0),
                                child: Divider(
                                  thickness: 2,
                                  color: Preferences.usingDarkMode()
                                      ? Colors.white
                                      : Colors.grey,
                                ),
                              ),
                            ),
                            ProfileText(
                                tittle: "Age",
                                content: "${snapshot.data.dateOfBirth}"),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 100,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 0.0, 8.0, 8.0),
                                child: Divider(
                                  thickness: 2,
                                  color: Preferences.usingDarkMode()
                                      ? Colors.white
                                      : Colors.grey,
                                ),
                              ),
                            ),
                            ProfileText(
                                tittle: "Location",
                                content: "${snapshot.data.location}"),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Divider(
                                thickness: 2,
                                color: Preferences.usingDarkMode()
                                    ? Colors.white
                                    : Colors.grey,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ProfileButton(
                              text: "Delete Account",
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                              press: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text(
                                            "Delete your SNSC account?",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0)),
                                        content: const Text(
                                            "This action cannot be reversed",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.0,
                                                color: Colors.red)),
                                        actions: [
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Wrap(
                                              alignment: WrapAlignment.center,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary:
                                                            Pallete.buttonGreen,
                                                      ),
                                                      child: const Text(
                                                        "Cancel",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white),
                                                      )),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary:
                                                            Pallete.buttonGreen,
                                                      ),
                                                      onPressed: () async {
                                                        showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return const Center(
                                                                child:
                                                                    CircularProgressIndicator(),
                                                              );
                                                            });
                                                        // TO DO: DELETE USER
                                                        // await APIService.logout(
                                                        //     context);
                                                      },
                                                      child: const Text(
                                                        "Delete",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white),
                                                      )),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              },
                            ),
                          ],
                        ),
                      );
                    } else {
                      child = Container();
                    }
                    return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child: child);
                  },
                ),
              ]),
            )),
      ),
    );
  }
}
