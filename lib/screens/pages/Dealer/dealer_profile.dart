import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../repositories/register_tool_dealer.dart';
import '../../../utils/TextField.dart';
import '../../../utils/constants.dart';

class DealerProfile extends StatefulWidget {
  const DealerProfile({super.key});

  @override
  State<DealerProfile> createState() => _DealerProfileState();
}

class _DealerProfileState extends State<DealerProfile> {

  final TextEditingController _toolPriceController = TextEditingController();
  File? _pickedImage;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Image(image: AssetImage('assets/images/goagrics.png')),
        backgroundColor: themeColorWhite,
        elevation: 0.0,
        title: Text(
          'GoAgrics',
          style: AppTitle,
        ),
      ),
      backgroundColor: themeColorWhite,
      body: InkWell(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
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
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      ListTile(
                                        leading:
                                        const Icon(Icons.camera_alt),
                                        title: const Text('Camera'),
                                        onTap: () {
                                          _getImageFromCamera();
                                          Navigator.pop(context);
                                        },
                                      ),
                                      ListTile(
                                        leading:
                                        const Icon(Icons.photo_library),
                                        title: const Text('Gallery'),
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
                      const SizedBox(
                        height: 20,
                      ),
                      GoTextField(
                          label: 'Tool Price',
                          controller: _toolPriceController),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: getWidth(context),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: themeColorDark),
                          onPressed: () async {
                            FocusScope.of(context).unfocus();
                            if (_formKey.currentState!.validate()) {
                              if (_pickedImage == null) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                    "Please Provide Image of Land...",
                                    style: GoogleFonts.notoSans(
                                      fontSize: 16,
                                      color: themeColorWhite,
                                    ),
                                  ),
                                  backgroundColor: themeColorSnackBarRed,
                                ));
                              } else {
                                int? a;
                                  a = await RegisterToolDealerRepo()
                                      .registerDealersTool(_pickedImage,
                                      _toolPriceController.text);
                                if (a == 1) {
                                  showSnackBar("Registration done Successfully...", context, themeColorSnackBarGreen);
                                  _toolPriceController.text = "";
                                  _pickedImage = null;
                                  setState(() {});
                                } else {
                                  showSnackBar("Something went Wrong...", context,
                                      themeColorSnackBarRed);
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
