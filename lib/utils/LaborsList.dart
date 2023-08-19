import 'package:flutter/material.dart';
import 'package:goagrics/auth_database/Api.dart';
import 'package:goagrics/utils/vertical_labor.dart';

import '../models/get_all_labors.dart';

class LaborsList extends StatefulWidget {
  const LaborsList({super.key});

  @override
  State<LaborsList> createState() => _LaborsListState();
}

class _LaborsListState extends State<LaborsList> {
  List<GetAllLabors> labors = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllLabors();
  }

  void fetchAllLabors() async {
    labors = await Api.getLabors();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return laborListCard(labors[index]);
          },
          itemCount: labors.length,
          shrinkWrap: true,
        ),
      ),
    );
  }
}
