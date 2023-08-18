import 'package:flutter/material.dart';
import 'package:goagrics/auth_database/Api.dart';
import 'package:goagrics/models/get_single_farmer.dart';
import 'package:goagrics/models/get_all_farmers.dart';

import 'package:lottie/lottie.dart';

import 'LandList_dealer.dart';

class FarmersList extends StatefulWidget {
  const FarmersList({
    super.key,
  });

  @override
  State<FarmersList> createState() => _FarmersListState();
}

class _FarmersListState extends State<FarmersList> {
  List<GetAllFarmers>? farmers = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchFarmers();
  }

  void fetchFarmers() async {
    farmers = await Api.getFarmers();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // print(farmers![0].fname);
    return farmers!.isEmpty
        ? Lottie.asset('assets/animate/farm_animate.json')
        : Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: ListView(
                shrinkWrap: true,
                children: [
                  for (var data in farmers!)
                    for (var items in data.landDetails!)
                      LandList(items, data.address!, data.fname!,
                          data.phoneNo!.toString(), data.sId!, context)
                ],
              ),
            ),
          );
  }
}

// Widget ShowFarmers(GetAllFarmers farmer) {
//   // print("Farmer is ${farmer.fname}");

//   return Card(
//     child: Container(
//       padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
//       child: const Column(
//         children: [
//           Text(),
//           SizedBox(
//             height: 10,
//           ),
//           Text("Hello"),
//         ],
//       ),
//     ),
//   );
// }
