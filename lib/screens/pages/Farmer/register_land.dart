import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:goagrics/utils/TextField.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/constants.dart';
import '../../../repositories/register_land.dart';

class RegisterLand extends StatefulWidget {
  const RegisterLand({super.key});

  @override
  State<RegisterLand> createState() => _RegisterLandState();
}

class _RegisterLandState extends State<RegisterLand> {

  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _toolPriceController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  File? _pickedImage;

  void _getImageFromGallery() async {
    final pickedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if(pickedImage != null) {
        _pickedImage = File(pickedImage.path);
      }
    });
  }

  void _getImageFromCamera() async {
    final pickedImage =
    await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      if(pickedImage != null){
        _pickedImage = File(pickedImage.path);
      }
    });
  }

  String _selectedCategory = 'Land';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: GestureDetector(
              onTap: (){
                FocusScope.of(context).unfocus();
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Radio<String>(
                            value: 'Land',
                            groupValue: _selectedCategory,
                            onChanged: (value){
                              setState(() {
                                _selectedCategory = value!;
                              });
                            }),
                        const Text("Land"),
                        Radio<String>(
                            value: 'Tool',
                            groupValue: _selectedCategory,
                            onChanged: (value){
                              setState(() {
                                _selectedCategory = value!;
                              });
                            }),
                        const Text("Tool"),
                      ],
                    ),
                    const SizedBox(height: 20,),
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
                    _selectedCategory == 'Land' ?
                        Column(
                          children: [
                            GoTextField(label: 'Land Area', controller: _areaController),
                            const SizedBox(height: 20,),
                            GoTextField(label: 'Land Type', controller: _typeController),
                            const SizedBox(height: 20,),
                            GoTextField(label: 'Land Price', controller: _priceController),
                            const SizedBox(height: 20,),
                          ],
                        ) :
                        GoTextField(label: 'Tool Price', controller: _toolPriceController),
                        const SizedBox(height: 20,),
                    SizedBox(
                      width: getWidth(context),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: themeColorDark),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if(_pickedImage == null){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Provide Image of Land...",
                                style: GoogleFonts.notoSans(
                                fontSize: 16,
                                  color: themeColorWhite,
                              ),),
                                backgroundColor: themeColorSnackBarRed, ));
                            }
                            else{
                              int? a;
                              if(_selectedCategory == 'Land'){
                                a = await RegisterLandRepo().registerFarmersLand(_pickedImage, _typeController.text,
                                    _areaController.text, _priceController.text);
                              }
                              else{
                                // a = call registerTool Api.
                              }
                              if(a == 1){
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Land Registration done Successfully...")));
                                //success
                              }
                              else{
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Something went Wrong Successfully...")));
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
    );
  }
}
