import 'package:flutter/material.dart';
import 'package:goagrics/auth_database/Api.dart';
import 'package:goagrics/models/get_all_labors.dart';
import 'package:goagrics/utils/constants.dart';
import 'package:goagrics/utils/vertical_labor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class LaborList extends StatefulWidget {
  const LaborList({super.key});

  @override
  State<LaborList> createState() => _LaborListState();
}

class _LaborListState extends State<LaborList> {
  List<GetAllLabors> labors = [];
  var isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isLoading = true;
    });
    fetchLabors();
  }

  void fetchLabors() async {
    List<GetAllLabors> tempLabor = await Api.getLabors();
    setState(() {
      labors = tempLabor;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: Lottie.asset("assets/animate/farm_animate.json"))
        : SafeArea(
            child: Scaffold(
              appBar: AppBar(
                  leading: const Image(
                      image: AssetImage('assets/images/goagrics.png')),
                  backgroundColor: themeColorWhite,
                  elevation: 0.0,
                  title: Text(
                    'GoAgrics',
                    style: GoogleFonts.urbanist(
                        fontSize: 18.0, color: themeColorLight),
                  )),
              backgroundColor: themeColorWhite,
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Labor Details: ',
                        style: GoogleFonts.raleway(
                            color: themeColorLight,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ListView.builder(
                        itemCount: labors.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return laborListCard(labors[index]);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
