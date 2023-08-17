import 'package:flutter/material.dart';
import 'package:goagrics/auth_database/Api.dart';
import 'package:goagrics/screens/pages/Farmer/getLands.dart';
import 'package:goagrics/screens/pages/Farmer/getTools.dart';
import 'package:goagrics/screens/reg_login/login_screen.dart';
import 'package:goagrics/utils/prefs.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

import '../../models/get_single_farmer.dart';
import '../../utils/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool editing = false;
  bool isLoading = false;
  late GetSingleFarmer cfarmer;

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    fetchCurrFarmer();
  }

  void fetchCurrFarmer() async {
    GetSingleFarmer tempFarm = await Api.getFarmer();
    setState(() {
      cfarmer = tempFarm;
      isLoading = false;
    });
    print(tempFarm.data!.fname);
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: Lottie.asset('assets/animate/farm_animate.json'))
        : SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  leading: const Image(
                      image: AssetImage('assets/images/goagrics.png')),
                  backgroundColor: themeColorWhite,
                  elevation: 0.0,
                  title: Text(
                    'GoAgrics',
                    style: AppTitle,
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {
                          print("Sign Out");
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: themeColorWhite,
                                title: Text(
                                  'Log Out',
                                  style: GoogleFonts.prompt(fontSize: 16.0),
                                ),
                                content: Text(
                                  'Are you sure, you want to log out?',
                                  style: GoogleFonts.prompt(fontSize: 15.0),
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'CANCEL',
                                      style: GoogleFonts.prompt(
                                          color: themeColorLight),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      var res =
                                          await Prefs.getInstance().remove(IS_LOGGED_IN);
                                      if (res) {
                                        showSnackBar('Signed Out Sucess!', context, themeColorSnackBarGreen);
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                                      }
                                      else
                                        showSnackBar('Signed Out Failed!', context, themeColorSnackBarRed);
                                    },
                                    child: Text(
                                      'YES',
                                      style: GoogleFonts.prompt(
                                          color: themeColorSnackBarRed),
                                    ),
                                  ),
                                ],
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
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: themeColorLight,
                          backgroundImage:
                              NetworkImage(cfarmer.data!.avatar!.url!),
                        ),
                        const SizedBox(height: 30),
                        Form(
                          child: Column(
                            children: [
                              TextFormField(
                                enabled: editing,
                                decoration: InputDecoration(
                                    label: editing
                                        ? Text(
                                            '',
                                            style: GoogleFonts.urbanist(
                                                color: themeColorLight),
                                          )
                                        : Text(
                                            cfarmer.data!.fname!,
                                            style: GoogleFonts.urbanist(),
                                          ),
                                    prefixIcon: const Icon(
                                      LineAwesomeIcons.user,
                                      color: themeColorLight,
                                    )),
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                enabled: editing,
                                decoration: InputDecoration(
                                    label: editing
                                        ? Text(
                                            '',
                                            style: GoogleFonts.urbanist(
                                                color: themeColorLight),
                                          )
                                        : Text(
                                            cfarmer.data!.category!,
                                            style: GoogleFonts.urbanist(),
                                          ),
                                    prefixIcon: const Icon(
                                        LineAwesomeIcons.user,
                                        color: themeColorLight)),
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                enabled: editing,
                                decoration: InputDecoration(
                                    label: editing
                                        ? Text(
                                            '',
                                            style: GoogleFonts.urbanist(
                                                color: themeColorLight),
                                          )
                                        : Text(
                                            cfarmer.data!.phoneNo!.toString(),
                                            style: GoogleFonts.urbanist(),
                                          ),
                                    prefixIcon: const Icon(
                                        LineAwesomeIcons.phone,
                                        color: themeColorLight)),
                              ),
                              const SizedBox(height: 30),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      editing = editing ? false : true;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: themeColorLight,
                                      side: BorderSide.none,
                                      shape: const StadiumBorder()),
                                  child: editing
                                      ? Text("Save Changes",
                                          style: GoogleFonts.prompt(
                                              color: themeColorWhite))
                                      : Text("Edit Profile",
                                          style: GoogleFonts.prompt(
                                              color: themeColorWhite)),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    myCard('Your Tools', Icons.settings,
                                        context, 't'),
                                    const SizedBox(width: 30),
                                    myCard('Your Lands', Icons.settings,
                                        context, 'l'),
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

  Widget myCard(String title, IconData icon, BuildContext context, String c) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: themeColorLight, borderRadius: BorderRadius.circular((10.0))),
      child: Column(children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => c == 'l'
                  ? GetLands(farmer: cfarmer)
                  : GetTools(farmer: cfarmer),
            ));
          },
          icon: Icon(icon),
          color: Colors.white,
        ),
        const SizedBox(height: 10),
        Text(title,
            style: GoogleFonts.notoSansJavanese(
              color: themeColorWhite,
            )),
      ]),
    );
  }
}
