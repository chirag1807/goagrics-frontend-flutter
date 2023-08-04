import 'dart:io';

import 'package:flutter/material.dart';
import 'package:goagrics/utils/TextField.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/constants.dart';

class RegisterLand extends StatefulWidget {
  const RegisterLand({super.key});

  @override
  State<RegisterLand> createState() => _RegisterLandState();
}

class _RegisterLandState extends State<RegisterLand> {
  late double _area;
  late String _type;
  late double _pricePerDay;

  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _pickedImage == null
                        ? Container(
                      height: 200,
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
                    const SizedBox(height: 20,),
                    GoTextField(label: 'Land Area', controller: _areaController),
                    const SizedBox(height: 20,),
                    GoTextField(label: 'Land Type', controller: _typeController),
                    const SizedBox(height: 20,),
                    GoTextField(label: 'Land Price', controller: _priceController),
                    const SizedBox(height: 20,),
                    SizedBox(
                      width: getWidth(context),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: themeColorDark),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if(_pickedImage == null){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Provide Image of Land...",
                                style: GoogleFonts.notoSans(
                                fontSize: 16,
                                  color: themeColorWhite,
                              ),),
                                backgroundColor: themeColorSnackBarRed, ));
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
