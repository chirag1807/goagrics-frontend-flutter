import 'dart:io';

import 'package:flutter/material.dart';
import 'package:goagrics/auth_database/AuthServices.dart';
import 'package:goagrics/screens/pages/farmer_dash.dart';
import 'package:goagrics/utils/TextField.dart';
import 'package:goagrics/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/prefs.dart';
import '../pages/Labor/labor_dash.dart';

class RegistrationScreen extends StatefulWidget {
  String phone;
  RegistrationScreen({Key? key, required this.phone}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pinCodeController = TextEditingController();

  // final TextEditingController _mobNoController = TextEditingController();

  String _selectedRole = "";
  var items = ["Farmer", "Labor", "Dealer"];

  File? _pickedImage;

  void _getImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        _pickedImage = File(pickedImage.path);
      }
    });
  }

  void _getImageFromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedImage != null) {
        _pickedImage = File(pickedImage.path);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // _nameController.dispose();
    // _addressController.dispose();
    // _mobNoController.dispose();
    // _pinCodeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FocusNode myFocusNode = FocusNode();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 50)
                .copyWith(bottom: 50),
            child: Text(
              'Sign Up',
              style: GoogleFonts.notoSans(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: themeColorDark),
            ),
          ),
        ),
        body: SafeArea(
          child: InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _pickedImage == null
                                ? Container(
                                    height: 150,
                                    color: Colors.grey[200],
                                    alignment: Alignment.center,
                                    child: IconButton(
                                      icon: const Icon(Icons.add_a_photo),
                                      onPressed: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Container(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  ListTile(
                                                    leading: const Icon(
                                                        Icons.camera_alt),
                                                    title: const Text('Camera'),
                                                    onTap: () {
                                                      _getImageFromCamera();
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                  ListTile(
                                                    leading: const Icon(
                                                        Icons.photo_library),
                                                    title:
                                                        const Text('Gallery'),
                                                    onTap: () {
                                                      _getImageFromGallery();
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  )
                                : Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: FileImage(
                                                File(_pickedImage?.path ?? "")),
                                            fit: BoxFit.fitHeight)),
                                  ),
                            const SizedBox(height: 20),
                            GoTextField(
                                label: 'Name', controller: _nameController),
                            const SizedBox(height: 20),
                            DropdownButtonFormField<String>(
                              value: _selectedRole != "" ? _selectedRole : null,
                              focusNode: myFocusNode,
                              decoration: InputDecoration(
                                labelText: 'Role',
                                labelStyle: GoogleFonts.urbanist(
                                    fontSize: 16.0,
                                    color: myFocusNode.hasFocus
                                        ? themeColorLight
                                        : themeColorDark),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: const BorderSide(
                                    color: themeColorLight,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(
                                    color: themeColorBlack,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              items: items.map((role) {
                                return DropdownMenuItem<String>(
                                  value: role,
                                  child: Text(
                                    role,
                                    style: GoogleFonts.urbanist(fontSize: 12.0),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedRole = value!;
                                });
                              },
                            ),
                            const SizedBox(height: 20),
                            GoTextField(
                                label: 'Address',
                                controller: _addressController),
                            const SizedBox(
                              height: 20,
                            ),
                            GoTextField(
                                label: 'Pincode',
                                controller: _pinCodeController),
                            // const SizedBox(
                            //   height: 20,
                            // ),
                            // GoTextField(
                            //     label: 'Mobile No',
                            //     controller: _mobNoController),
                            const SizedBox(
                              height: 20,
                            ),
                            // GoTextField(
                            //     label: 'City', controller: _cityController),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: themeColorDark),
                              onPressed: () async {
                                // _getCurrentAddress();
                                if (_formKey.currentState!.validate()) {
                                  if (_pickedImage == null) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                        "Please Provide Image...",
                                        style: GoogleFonts.notoSans(
                                          fontSize: 16,
                                          color: themeColorWhite,
                                        ),
                                      ),
                                      backgroundColor: themeColorSnackBarRed,
                                    ));
                                  } else {
                                    var status = await AuthServices()
                                        .registration(
                                            _pickedImage,
                                            _nameController.text,
                                            _selectedRole,
                                            _addressController.text,
                                            _pinCodeController.text,
                                            widget.phone);
                                    if (status) {
                                      showSnackBar("Registration Done Successfully", context, themeColorSnackBarGreen);
                                      String? category = Prefs.getInstance().getString(CATEGORY);
                                      if(category == "Farmer"){
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const FarmerDash()));
                                      }
                                      else if(category == "Labor"){
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LaborDash()));
                                      }
                                      else if(category == "Dealer"){
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const FarmerDash()));
                                      }
                                      else{
                                        showSnackBar("Something Went Wrong...Please Try Again Later...", context, themeColorSnackBarRed);
                                      }
                                    } else {
                                      showSnackBar("Something went Wrong...", context, themeColorSnackBarRed);
                                    }
                                  }
                                }
                              },
                              child: Text(
                                'Submit',
                                style: GoogleFonts.prompt(
                                  fontSize: 16.0,
                                  color: themeColorWhite,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
