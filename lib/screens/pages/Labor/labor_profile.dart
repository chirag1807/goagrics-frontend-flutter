import 'package:flutter/material.dart';
import 'package:goagrics/models/get_single_labor.dart';
import 'package:goagrics/repositories/update_labor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

import '../../../auth_database/Api.dart';
import '../../../utils/constants.dart';

class LaborProfileScreen extends StatefulWidget {
  const LaborProfileScreen({super.key});

  @override
  _LaborProfileScreenState createState() => _LaborProfileScreenState();
}

class _LaborProfileScreenState extends State<LaborProfileScreen> {
  bool editing = false;
  bool isLoading = false;
  GetSingleLabor? cLabor;

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    fetchCurrLabor();
  }

  void fetchCurrLabor() async {
    GetSingleLabor tempLabor = await Api.getLabor();
    setState(() {
      cLabor = tempLabor;
      isLoading = false;
    });
    print(tempLabor.data!.lname);
  }

  final TextEditingController _nameController = TextEditingController();
  final List<String> _skills = [];
  double _price = 0.0;

  Widget _buildSkillInput(int index) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Skill ${index + 1}",
          prefixIcon: const Icon(
            LineAwesomeIcons.tasks,
            color: themeColorLight,
          )
      ),
      onChanged: (value){
      setState(() {
        _skills[index] = value;
      });
    },
    );
  }

  void _addSkillInput() {
    setState(() {
      _skills.add('');
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ?
    Center(child: Lottie.asset('assets/animate/farm_animate.json')) :
    Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: (){
              FocusScope.of(context).unfocus();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  enabled: editing,
                  controller: _nameController,
                  decoration: InputDecoration(
                      label: editing
                          ? Text(
                        '',
                        style: GoogleFonts.urbanist(
                            color: themeColorLight),
                      )
                          : Text(
                        cLabor!.data!.lname!,
                        style: GoogleFonts.urbanist(),
                      ),
                      prefixIcon: const Icon(
                        LineAwesomeIcons.user,
                        color: themeColorLight,
                      )),
                ),
                const SizedBox(height: 20.0),
                Column(
                  children: _skills
                      .asMap()
                      .map((index, skill) {
                    return MapEntry(
                      index,
                      Column(
                        children: <Widget>[
                          _buildSkillInput(index),
                          SizedBox(height: 8.0),
                        ],
                      ),
                    );
                  })
                      .values
                      .toList(),
                ),
                ElevatedButton(
                  onPressed: _addSkillInput,
                  child: const Text("Add Skill", style: TextStyle(color: themeColorDark),),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  enabled: editing,
                  keyboardType: TextInputType.number,
                  onChanged: (value){
                    setState(() {
                      _price = double.tryParse(value) ?? 0.0;
                    });
                  },
                  decoration: const InputDecoration(
                      labelText: 'Price',
                      prefixIcon: Icon(
                        LineAwesomeIcons.money_bill,
                        color: themeColorLight,
                      )),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if(editing){
                        print("yesyesyes");
                        int? a = await UpdateLabor().updateLaborSkillPrice(_skills, _price);
                        print(a);
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
        ),
      ),
    );
  }
}