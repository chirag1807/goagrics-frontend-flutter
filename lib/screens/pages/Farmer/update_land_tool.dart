import 'dart:io';

import 'package:flutter/material.dart';
import 'package:goagrics/repositories/update_land.dart';
import 'package:goagrics/repositories/update_tool.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/TextField.dart';
import '../../../utils/constants.dart';

class UpdateLandTool extends StatefulWidget {
  final String area;
  final String type;
  final String price;
  final String toolPrice;
  final String pickedImg;
  final String landId;
  final String toolId;
  final int indicator;
  //indicator = 0 => land, indicator = 1 => tool
  const UpdateLandTool({Key? key, required this.area, required this.type, required this.price, required this.toolPrice,
  required this.pickedImg, required this.landId, required this.toolId, required this.indicator}) : super(key: key);

  @override
  State<UpdateLandTool> createState() => _UpdateLandToolState();
}

class _UpdateLandToolState extends State<UpdateLandTool> {

  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _toolPriceController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  File? _pickedImage;

  @override
  void initState() {
    super.initState();
    // _pickedImage = widget.pickedImg;
    _areaController.text = widget.area;
    _typeController.text = widget.type;
    _priceController.text = widget.price;
    _toolPriceController.text = widget.toolPrice;
  }

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
                        child: InkWell(
                          onTap: (){
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
                            child: Image.network(widget.pickedImg)
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
                      widget.indicator == 0
                          ? Column(
                        children: [
                          GoTextField(
                              label: 'Land Area',
                              controller: _areaController),
                          const SizedBox(
                            height: 20,
                          ),
                          GoTextField(
                              label: 'Land Type',
                              controller: _typeController),
                          const SizedBox(
                            height: 20,
                          ),
                          GoTextField(
                              label: 'Land Price',
                              controller: _priceController),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      )
                          : GoTextField(
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
                                if (widget.indicator == 0) {
                                  a = await UpdateLandRepo()
                                      .updateFarmersLand(
                                      _pickedImage,
                                      _typeController.text,
                                      _areaController.text,
                                      _priceController.text, widget.landId);
                                } else {
                                  a = await UpdateToolRepo()
                                      .updateFarmersTool(_pickedImage,
                                      _toolPriceController.text, widget.toolId);
                                }
                                if (a == 1) {
                                  showSnackBar(
                                      "Registration done Successfully...",
                                      context,
                                      themeColorSnackBarGreen);
                                  _typeController.text = "";
                                  _areaController.text = "";
                                  _priceController.text = "";
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
                            'Update',
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
