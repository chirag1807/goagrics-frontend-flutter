import 'package:flutter/material.dart';
import 'package:goagrics/models/get_single_dealer.dart';
import 'package:goagrics/repositories/update_dealer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

import '../../../auth_database/Api.dart';
import '../../../utils/constants.dart';
import '../../../utils/prefs.dart';
import '../../reg_login/login_screen.dart';

class DealerProfile1 extends StatefulWidget {
  const DealerProfile1({Key? key}) : super(key: key);

  @override
  State<DealerProfile1> createState() => _DealerProfile1State();
}

class _DealerProfile1State extends State<DealerProfile1> {

  bool editing = false;
  bool isLoading = false;
  late GetSingleDealer cDealer;

  final TextEditingController pinCodeController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    fetchCurrDealer();
  }

  void fetchCurrDealer() async {
    String? id  = Prefs.getInstance().getString(ID);
    GetSingleDealer tempDealer = await Api.getDealer(id!);
    setState(() {
      cDealer = tempDealer;
      isLoading = false;
    });
    print(tempDealer.data!.dname);
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: Lottie.asset('assets/animate/farm_animate.json')) :
      SafeArea(
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
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: themeColorLight,
                      child: Image.network(cDealer.data!.avatar!.url!),
                    ),
                    const SizedBox(height: 30),
                    Form(
                      child: Column(
                        children: [
                          TextFormField(
                            enabled: editing,
                            controller: nameController,
                            decoration: InputDecoration(
                                label: editing
                                    ? Text(
                                  '',
                                  style: GoogleFonts.urbanist(
                                      color: themeColorLight),
                                )
                                    : Text(
                                  cDealer.data!.dname!,
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
                            controller: addressController,
                            decoration: InputDecoration(
                                label: editing
                                    ? Text(
                                  '',
                                  style: GoogleFonts.urbanist(
                                      color: themeColorLight),
                                )
                                    : Text(
                                  cDealer.data!.address!,
                                  style: GoogleFonts.urbanist(),
                                ),
                                prefixIcon: const Icon(
                                    LineAwesomeIcons.user,
                                    color: themeColorLight)),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            enabled: editing,
                            controller: pinCodeController,
                            decoration: InputDecoration(
                                label: editing
                                    ? Text(
                                  '',
                                  style: GoogleFonts.urbanist(
                                      color: themeColorLight),
                                )
                                    : Text(
                                  cDealer.data!.pincode.toString(),
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
                              onPressed: () async {
                                if (editing) {
                                  print("yesyesyes");
                                  int? a = await UpdateDealer()
                                      .updateDealerDetails(nameController.text, addressController.text, pinCodeController.text);
                                  print(a);
                                  if(a== 1){
                                    showSnackBar("Dealer Updated Successfully", context, themeColorSnackBarGreen);
                                  }
                                  else{
                                    showSnackBar("Something went wrong...", context, themeColorSnackBarRed);
                                  }
                                }
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
    ),
      );
  }
}
