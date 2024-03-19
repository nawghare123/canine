import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:pet/controllers/user_controller/myPetController.dart';
import 'package:pet/screens/user/ordersummary.dart';
import 'package:pet/screens/user/widgets/userAppBar.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/Mypetdetails.dart';
import 'package:pet/screens/user/notification.dart';

class AddMypet extends StatelessWidget {
  AddMypet({super.key});
  UserMyPetController userMyPetController = Get.put(UserMyPetController());

  Future openCameraPopupProfile(
    BuildContext context,
  ) async {
    print("Taped");
    showDialog(
      barrierColor: Colors.black26,
      context: context,
      builder: (context) {
        return Dialog(
          alignment: Alignment.bottomCenter,
          insetPadding: EdgeInsets.all(0),
          elevation: 0,
          backgroundColor: Color(0xffffffff),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Container(
              height: 150,
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: IconButton(
                          icon: Icon(
                            Icons.close,
                            // color: border,
                          ),
                          onPressed: () {},
                        ),
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  FloatingActionButton(
                                    backgroundColor: Colors.black,
                                    onPressed: () async {
                                      await userMyPetController
                                          .getImageGalleryProfile();
                                      Navigator.pop(context);
                                    },
                                    tooltip: "Pick Image form gallery",
                                    child: Icon(Icons.photo),
                                  ),
                                  SizedBox(height: 5),
                                  Text('Gallery',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500))
                                ],
                              ),
                              Column(
                                children: [
                                  FloatingActionButton(
                                    backgroundColor: Colors.black,
                                    onPressed: () async {
                                      await userMyPetController
                                          .getImageCameraProfile();
                                      Navigator.pop(context);

                                      await Future.delayed(
                                          Duration(seconds: 2));
                                    },
                                    tooltip: "Pick Image from camera",
                                    child: Icon(Icons.camera_alt),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Camera',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                        ],
                      ))
                ],
              )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:CustomAppBargreen(),
      body: GetBuilder<UserMyPetController>(
          init: userMyPetController,
          // initState: (_) {},
          builder: (_) {
            return Stack(
              children: [
                ListView(
                  primary: true,
                  shrinkWrap: false,
                  physics: const BouncingScrollPhysics(),
                  children: [
                   
                    InkWell(
                     
                      child:
                          
                          Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: userMyPetController.profileFilePath == ""
                                ? AssetImage("assets/image/frame.png")
                                : FileImage(userMyPetController.profileFile!)
                                    as ImageProvider<Object>,
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                              ),
                              Text(
                                "Uplode image",
                                style: CustomTextStyle.appbartextwhite,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              InkWell(
                                onTap: () => openCameraPopupProfile(
                                  context,
                                ),
                                child: Image.asset(
                                  "assets/image/uploadimg.png",
                                  height: 25,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                            ],
                          ),
                        ),
                      ),
                     
                    ),
                    Container(
                      color: MyColors.green,
                      child: ListView(
                        primary: false,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 0.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: MyColors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 20.0, right: 20, top: 10),
                                child: Form(
                                  key: userMyPetController.formKey,
                                  child: ListView(
                                    primary: false,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    children: [
                                      

                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                      ),

                                      Text(
                                        "Pet Type",
                                        style: CustomTextStyle.popinstext,
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                      ),

                                      GetBuilder<UserMyPetController>(
                                        init: userMyPetController,
                                        builder: (_) {
                                          return userMyPetController
                                                      .categoryListModel ==
                                                  null
                                              ? Center(
                                                  child: Text(
                                                    "Unable to Load Category List",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                )
                                              : Wrap(
                                                  // shrinkWrap: true,
                                                  // scrollDirection:
                                                  //     Axis.horizontal,
                                                  children:
                                                      userMyPetController
                                                          .categoryListModel!
                                                          .data!
                                                          .map(
                                                            (e) => Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: InkWell(
                                                                onTap:
                                                                    () async {
                                                                    userMyPetController.clearFields();
                                                                    print("bbbe");
                                                                  await userMyPetController
                                                                      .changePetType(
                                                                          e.name!,
                                                                          e.id!);
                                                                  userMyPetController
                                                                      .changePetImage(
                                                                          e.image!);
                                                                  // userMyPetController
                                                                  //     .isDogMaker(
                                                                  //         true);
                                                                  print(
                                                                      "values: ${userMyPetController.petType} ${userMyPetController.isDog}");
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: 40,
                                                                  width: 90,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: userMyPetController.petType ==
                                                                            e
                                                                                .name
                                                                        ? MyColors
                                                                            .greenlight
                                                                        : Colors
                                                                            .white,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: userMyPetController.petType == e.name
                                                                          ? MyColors
                                                                              .greenlight
                                                                          : Colors
                                                                              .black26,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            5.0),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Text(
                                                                        e.name!,
                                                                        style: userMyPetController.isDog
                                                                            ? CustomTextStyle.popinssmall
                                                                            : TextStyle(
                                                                                color: Colors.black26,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                          .toList(),
                                                  
                                                );
                                        },
                                      ),

                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                      Text(
                                        "Gender",
                                        style: CustomTextStyle.popinstext,
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                      ),

                                      GetBuilder<UserMyPetController>(
                                        init: userMyPetController,
                                        // initState: (_) {},
                                        builder: (_) {
                                          return Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  userMyPetController
                                                      .changeGender("Female");
                                                  userMyPetController
                                                      .isMaleMaker(false);
                                                  print(
                                                      "values: ${userMyPetController.gender} ${userMyPetController.isMale}");
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: 90,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color:
                                                            userMyPetController
                                                                    .isMale
                                                                ? Colors.black26
                                                                : MyColors
                                                                    .greenlight,
                                                      ),
                                                      color: userMyPetController
                                                              .isMale
                                                          ? Colors.white
                                                          : MyColors.greenlight,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Center(
                                                      child: Text("Female",
                                                          style: userMyPetController
                                                                  .isMale
                                                              ? TextStyle(
                                                                  color: Colors
                                                                      .black26,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)
                                                              : CustomTextStyle
                                                                  .popinssmall),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  userMyPetController
                                                      .changeGender("Male");
                                                  userMyPetController
                                                      .isMaleMaker(true);
                                                  print(
                                                      "values: ${userMyPetController.gender} ${userMyPetController.isMale}");
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: 90,
                                                  decoration: BoxDecoration(
                                                      color: userMyPetController
                                                              .isMale
                                                          ? MyColors.greenlight
                                                          : Colors.white,
                                                      border: Border.all(
                                                          color:
                                                              userMyPetController
                                                                      .isMale
                                                                  ? MyColors
                                                                      .greenlight
                                                                  : Colors
                                                                      .black26,
                                                          width: 0.5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Center(
                                                      child: Text("Male",
                                                          style: userMyPetController
                                                                  .isMale
                                                              ? CustomTextStyle
                                                                  .popinssmall
                                                              : TextStyle(
                                                                  color: Colors
                                                                      .black26,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                      Text(
                                        "Breed",
                                        style: CustomTextStyle.popinstext,
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                      ),

                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                                color: Colors.black26,
                                                width: 0.5),
                                            color: MyColors.white),
                                        child: DropdownButtonHideUnderline(
                                          child: ButtonTheme(
                                            alignedDropdown: true,
                                            child: DropdownButton(
                                              icon: Icon(
                                                Icons.keyboard_arrow_down,
                                                color: Colors.black26,
                                              ),
                                              value: userMyPetController
                                                  .dropdownvalue, // Use directly from the controller
                                              items: userMyPetController.items
                                                  .map((String item) {
                                                return DropdownMenuItem(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: TextStyle(
                                                      color: Colors.black, 
                                                      
                                        overflow: TextOverflow.ellipsis,
                                                      fontFamily:
                                                          "SF-Pro-Display",
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (newValue) {
                                                userMyPetController
                                                    .setDropdownValue(
                                                        newValue); // Update the value in the controller
                                              },
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                      Text(
                                        "DOB",
                                        style: CustomTextStyle.popinstext,
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                      ),

                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                                color: Colors.black26,
                                                width: 0.5),
                                            color: MyColors.white),
                                        child: TextFormField(
                                          readOnly: true,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter a value';
                                            }
                                            // Add more validation rules if needed
                                            return null; // Return null for no validation errors
                                          },
                                          onTap: () {
                                            userMyPetController.selectDate(
                                                context); // Function to show date picker
                                          },
                                          controller:
                                              userMyPetController.dobController,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontFamily: "SF-Pro-Display"),
                                          decoration: InputDecoration(

                                              // contentPadding: EdgeInsets.only(left: 15),
                                              fillColor: MyColors.white,
                                              focusColor: MyColors.white,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide.none,

                                                // borderRadius: BorderRadius.circular(50),
                                              ),
                                              // contentPadding: EdgeInsets.all(10),

                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                //  borderRadius: BorderRadius.circular(50),
                                              ),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                //  borderRadius: BorderRadius.circular(50),
                                              ),
                                              hintText: "DD/MM/YYYY",
                                              suffixIcon: Icon(
                                                Icons.calendar_month_outlined,
                                                color: Colors.black26,
                                              ),
                                              hintStyle: TextStyle(
                                                  color: Colors.black26,
                                                  fontFamily: "SF-Pro-Display",
                                                  fontSize: 14)),
                                        ),
                                      ),

                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                      Text(
                                        "Age",
                                        style: CustomTextStyle.popinstext,
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                      ),
                                      Row(
                                        children: [
                                          Center(
                                            child: Container(
                                              height: 50,
                                              width: 90,
                                             
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black26,
                                                    width: 0.5),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Center(
                                                  child:
                                                     
                                                      Text(
                                                    userMyPetController
                                                            .yearController
                                                            .text +
                                                        " years",
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 15),
                                          Center(
                                            child: Container(
                                              height: 50,
                                              width: 90,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black26,
                                                    width: 0.5),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Center(
                                                  child:
                                                     
                                                      Text(
                                                    userMyPetController
                                                            .monthController
                                                            .text +
                                                        " month",
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                      Text(
                                        "Pet Name",
                                        style: CustomTextStyle.popinstext,
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                      ),

                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                                color: Colors.black26,
                                                width: 0.5),
                                            color: MyColors.white),
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter a value';
                                            }
                                            // Add more validation rules if needed
                                            return null; // Return null for no validation errors
                                          },
                                          controller: userMyPetController
                                              .petNameController,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontFamily: "SF-Pro-Display"),
                                          decoration: InputDecoration(

                                              // contentPadding: EdgeInsets.only(left: 15),
                                              fillColor: MyColors.white,
                                              focusColor: MyColors.white,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide.none,

                                                // borderRadius: BorderRadius.circular(50),
                                              ),
                                              // contentPadding: EdgeInsets.all(10),

                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                //  borderRadius: BorderRadius.circular(50),
                                              ),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                //  borderRadius: BorderRadius.circular(50),
                                              ),
                                              hintText: "Jumba",
                                              // suffixIcon: Icon(Icons.calendar_month_outlined,color: Colors.black26,),
                                              hintStyle: TextStyle(
                                                  color: Colors.black26,
                                                  fontFamily: "SF-Pro-Display",
                                                  fontSize: 14)),
                                        ),
                                      ),

                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          final storage = GetStorage();
                                           
                                          if (userMyPetController
                                              .formKey.currentState!
                                              .validate()) {
                                            // print("Tapped");
                                            // Get.snackbar(
                                            //   'Form Status',
                                            //   'Form is valid',
                                            //   duration: Duration(seconds: 3),
                                            //   backgroundColor: Colors.green,
                                            //   colorText: Colors.white,
                                            //   snackPosition:
                                            //       SnackPosition.BOTTOM,
                                            //   borderRadius: 8,
                                            // );
                                            // DateTime? parsedDob =
                                            //     DateFormat('dd-MM-yyyy').parse(
                                            //         userMyPetController
                                            //             .dobController.text);

                                            // DateFormat('dd-MM-yyyy')
                                            //       .parse(userMyPetController
                                            //           .dobController.text)
                                            //       .toString(),
                                            var body = {
                                              "user_id":
                                                  // userMyPetController.userId,
                                                  storage.read('id').toString(),
                                              "pets_type": userMyPetController
                                                  .petType
                                                  .toString(),
                                              "gender": userMyPetController
                                                  .gender
                                                  .toString(),
                                              "breeds": userMyPetController
                                                  .dropdownvalue
                                                  .toString(),
                                              "dob": DateFormat('dd-MM-yyy')
                                                  .format(userMyPetController
                                                      .pickedDate!)
                                                  .toString(),
                                              // "dob": parsedDob != null
                                              //     ? "${parsedDob.year.toString().padLeft(4, '0')}-${parsedDob.month.toString().padLeft(2, '0')}-${parsedDob.day.toString().padLeft(2, '0')}"
                                              //     : null,
                                              "age":
                                                  "${userMyPetController.yearController.text} year ${userMyPetController.monthController.text} month",
                                              "pet_name": userMyPetController
                                                  .petNameController.text
                                                  .toString(),
                                            };
                                            List<Map<String, String>>
                                                documentList = [
                                              {
                                                'value':
                                                    '${userMyPetController.profileFilePath}',
                                                'key': "image"
                                              }
                                            ];
                                            print(body);
                                            print(documentList);
                                            try {
                                            if ( userMyPetController.profileFilePath ==
                                            null){
   Get.snackbar(
                                                'Error',
                                                'Please select image',
                                                duration: Duration(seconds: 3),
                                                backgroundColor: Colors.red,
                                                colorText: Colors.white,
                                                snackPosition:
                                                    SnackPosition.BOTTOM,
                                                borderRadius: 8,
                                              );
                                           
                                            }else{
                                              await userMyPetController
                                                  .postUserData(
                                                      documentList,
                                                      body,
                                                      Constants.ADD_PET_USER);
                                              userMyPetController.clearFields();
                                              Get.snackbar(
                                                'Success',
                                                'New Pet Added',
                                                duration: Duration(seconds: 3),
                                                backgroundColor: Colors.green,
                                                colorText: Colors.white,
                                                snackPosition:
                                                    SnackPosition.BOTTOM,
                                                borderRadius: 8,
                                              );
                                            }
                                            } catch (e) {}

                                            // Form is valid, do something here
                                            // Access the validated value using _textEditingController.text
                                          } else {
                                            Get.snackbar(
                                              'Form Status',
                                              'Form is invalid',
                                              duration: Duration(seconds: 3),
                                              backgroundColor: Colors.red,
                                              colorText: Colors.white,
                                              snackPosition:
                                                  SnackPosition.BOTTOM,
                                              borderRadius: 8,
                                            );
                                          }

                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             MyPetDetails()));
                                        },
                                        child: Center(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.07,
                                            decoration: BoxDecoration(
                                                color: MyColors.yellow,
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                            child: Center(
                                                child: Text(
                                              "Add Pet",
                                              style: CustomTextStyle
                                                  .mediumtextreem,
                                            )),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                // Show Loading
                userMyPetController.showLoading
                    ? BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          color: Colors.black
                              .withOpacity(0.5), // Adjust the opacity as needed
                        ),
                      )
                    : SizedBox(),
                userMyPetController.showLoading
                    ? Center(
                        child: SpinKitCircle(
                          color: Colors.white, // Color of the progress bar
                          size: 50.0, // Size of the progress bar
                        ),
                      )
                    : SizedBox(),
              ],
            );
          }),
    );
  }
}
