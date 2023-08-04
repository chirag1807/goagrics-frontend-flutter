import 'dart:io';

import 'package:flutter/material.dart';
import 'package:goagrics/utils/TextField.dart';
import 'package:goagrics/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  String _selectedRole = "";
  String _address = '';
  var items = ["Farmer", "Labour", "Contractor", "Provider"];

  XFile? _pickedImage;

  void _getImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _pickedImage = pickedImage;
    });
  }

  void _getImageFromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _pickedImage = pickedImage;
    });
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
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: themeColorDark),
                              onPressed: () {
                                // _getCurrentAddress();
                                if (_formKey.currentState!.validate()) {
                                  print('Name: ${_nameController.text}');
                                  print('Role: $_selectedRole');
                                  print('Address: $_address');
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
