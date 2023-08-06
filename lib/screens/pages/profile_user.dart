import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../utils/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading:
                const Image(image: AssetImage('assets/images/goagrics.png')),
            backgroundColor: themeColorWhite,
            elevation: 0.0,
            title: Text(
              'GoAgrics',
              style:
                  GoogleFonts.urbanist(fontSize: 18.0, color: themeColorLight),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    print("Sign Out");
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Expanded(
                          child: AlertDialog(
                            backgroundColor: themeColorWhite,
                            title: Text(
                              'Log Out',
                              style: GoogleFonts.prompt(
                                  fontSize: 16.0, color: themeColorLight),
                            ),
                            content: Text(
                              'Are you sure, you want to log out?',
                              style: GoogleFonts.prompt(
                                  fontSize: 15.0, color: themeColorLight),
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  'CANCEL',
                                  style: GoogleFonts.prompt(
                                      color: themeColorLight),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  'YES',
                                  style: GoogleFonts.prompt(
                                      color: themeColorLight),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: themeColorLight,
                  ))
            ],
          ),
          backgroundColor: themeColorWhite,
          body: SingleChildScrollView(
              child: Column(
            children: [
              const Divider(
                thickness: 1.5,
                color: themeColorDark,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundColor: themeColorLight,
                    child: Image(
                      image: NetworkImage(
                          'https://cdn4.iconfinder.com/data/icons/social-messaging-ui-color-and-shapes-3/177800/129-512.png'),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                              label: Text('Name'),
                              prefixIcon: Icon(LineAwesomeIcons.user)),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          decoration: const InputDecoration(
                              label: Text('Email'),
                              prefixIcon: Icon(LineAwesomeIcons.envelope_1)),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          decoration: const InputDecoration(
                              label: Text('Mobile'),
                              prefixIcon: Icon(LineAwesomeIcons.phone)),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            label: const Text('Password'),
                            prefixIcon: const Icon(Icons.fingerprint),
                            suffixIcon: IconButton(
                                icon: const Icon(LineAwesomeIcons.eye_slash),
                                onPressed: () {}),
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: themeColorLight,
                                side: BorderSide.none,
                                shape: const StadiumBorder()),
                            child: Text("Edit Profile",
                                style:
                                    GoogleFonts.prompt(color: themeColorWhite)),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                    color: themeColorLight,
                                    borderRadius:
                                        BorderRadius.circular((10.0))),
                                child: Column(children: [
                                  Icon(
                                    Icons.settings,
                                    color: Colors.white,
                                  ),
                                  SizedBox(height: 10),
                                  Text('Your Tools',
                                      style: GoogleFonts.notoSansJavanese(
                                        color: themeColorWhite,
                                      )),
                                ]),
                              ),
                              SizedBox(width: 30),
                              Container(
                                padding: EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                    color: themeColorLight,
                                    borderRadius:
                                        BorderRadius.circular((10.0))),
                                child: Column(children: [
                                  Icon(
                                    Icons.settings,
                                    color: Colors.white,
                                  ),
                                  SizedBox(height: 10),
                                  Text('Your Lands',
                                      style: GoogleFonts.notoSansJavanese(
                                        color: themeColorWhite,
                                      )),
                                ]),
                              )
                            ])
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ))),
    );
  }
}
