import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/controllers/wholesaler_controller/addtocartcontroller.dart';
import 'package:pet/controllers/wholesaler_controller/home_controller.dart';
import 'package:pet/controllers/wholesaler_controller/notification_controller.dart';
import 'package:pet/controllers/wholesaler_controller/ourbranddetailscontroller.dart';
import 'package:pet/controllers/wholesaler_controller/productdetails_controller.dart';
import 'package:pet/controllers/wholesaler_controller/profilewhole_controller.dart';
import 'package:pet/controllers/wholesaler_controller/subcateogries_controller.dart';
import 'package:pet/controllers/wholesaler_controller/wholesalerFilterController.dart';
import 'package:pet/controllers/wholesaler_controller/wholesaler_ourbrand_filter_controller.dart';
import 'package:pet/models/wholesalerModel/bannerModel.dart' as Banner;
import 'package:pet/others/Filter.dart';
import 'package:pet/screens/wholesaler/WholeAllbrandPage.dart';
import 'package:pet/screens/wholesaler/ordersummary.dart';
import 'package:pet/screens/wholesaler/wholeSalerFilterUI.dart';
import 'package:pet/screens/wholesaler/wholeallcategory.dart';
import 'package:pet/screens/wholesaler/wholeoubranddetails.dart';
import 'package:pet/screens/wholesaler/wholesalerSearchScreen.dart';
import 'package:pet/screens/wholesaler/wholesalerdrawer.dart';
import 'package:pet/screens/wholesaler/ProductAlllistPage.dart';

import 'package:pet/screens/wholesaler/productdetails.dart';
import 'package:pet/screens/wholesaler/widget/Filter.dart';
import 'package:pet/screens/wholesaler/widget/wholeAppBar.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/ourbrand.dart';

import 'package:pet/screens/wholesaler/notification.dart';
import 'package:share_plus/share_plus.dart';

class HomeWhole extends StatefulWidget {
  HomeWhole({super.key});

  @override
  State<HomeWhole> createState() => _HomeWholeState();
}

class _HomeWholeState extends State<HomeWhole> {
  TextEditingController _searchcontroller = TextEditingController();
  final GlobalKey<ScaffoldState> _drawerkey = GlobalKey();
  WholeHomeController wholehomecontroller = Get.put(WholeHomeController());
  WholeProductDetailsController wholeproductdetailsController =
      Get.put(WholeProductDetailsController());
    
  MyCartWholeController mycartwholeController =
      Get.put(MyCartWholeController());
  WholeSubCategoryController wholesubcategorycontroller =
      Get.put(WholeSubCategoryController());
      WholeProfileController wholeProfileController = Get.put(WholeProfileController());
 final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
    GlobalKey<RefreshIndicatorState>();
    
   WholeNotificationController wholenotificationcontroller =
      Get.put(WholeNotificationController());

        OurBrandDetailsWholeController oubranddetailswholeController =
      Get.put(OurBrandDetailsWholeController());
  
  @override
  void onInit() {
  
    // notificationcontroller.init();
      mycartwholeController.init();
      wholenotificationcontroller.notifyinit();
       
  }
  @override
  Widget build(BuildContext context) {
    //  homeusercontroller.getWishList();
    wholeProfileController.myprofile();
    print("WholeSaler Id: ${GetStorage().read('wholesalerid').toString()}");
    print("WholeSaler Data: ${GetStorage().read('wholesalerData').toString()}");
    return Scaffold(
      key: _drawerkey,
      drawer: drawerWholeSaler(),
     appBar: CustomAppBarWhole(
        drawerKey: _drawerkey,
      ),
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         leading: Padding(
//           padding: const EdgeInsets.only(left: 5.0, top: 15, bottom: 15),
//           child: GestureDetector(
//             onTap: () {
//               _drawerkey.currentState!.openDrawer();
//             },
//             child: Image.asset(
//               "assets/image/menu2.png",
//             ),
//           ),
//         ),
// //           title: Center(
// // //SvgPicture.asset("assets/image/menu1.svg",height: 25,),
// // //
// //             child:Text("")
// //           ),
//         actions: [
//           InkWell(
//               onTap: () {
//                 Get.to(NotificationWhole());
//               },
//               child: SvgPicture.asset("assets/image/notification.svg")),
//           // Image.asset("assets/image/cartimg.png"),
//           SizedBox(width: 20),
//           InkWell(
//             onTap: () {
//               Get.to(OrderSummarywhole());
//             },
//             child: Padding(
//               padding: EdgeInsets.only(right: 20.0),
//               child: SvgPicture.asset("assets/image/bag.svg"),
//             ),
//           ),
//         ],
//         // shape: RoundedRectangleBorder(
//         //   borderRadius: BorderRadius.vertical(
//         //     bottom: Radius.circular(20),
//         //   ),
//         // ),
//       ),
//       // backgroundcolor:MyColors.white,

      body: Stack(
        children: [
          RefreshIndicator(
              // color: Colors.white,
              // backgroundColor: Colors.white,
// edgeOffset: 0,
// strokeWidth: 0,
key: _refreshIndicatorKey,
// displacement: -0.1,

              onRefresh: () async {
                _refreshIndicatorKey.currentState?.show(atTop: false);
            //  wholenotificationcontroller.init();
    await mycartwholeController.init();
                await wholehomecontroller.init();
                wholeProfileController.myprofile();
                 wholehomecontroller.getWishList();
                  
  //  homeusercontroller. getWishinit();
  //   homeusercontroller.fetchWishList();
                await Future.delayed(Duration(seconds: 2));
              },
            child: ListView(
               physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                primary: false,
              // shrinkWrap: true,
              children: [
                // SizedBox(height: MediaQuery.of(context).size.height*0.02,),
          
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                            "Find the pet you love on around you easily",
                            style: CustomTextStyle.popinstext,
                          )),
                          
                     GetBuilder<WholeProfileController>(
                              init: wholeProfileController,
                              builder: (_) {
                  return 
                  wholeProfileController
                                .wholemyprofilemodel == null || wholeProfileController
                                .wholemyprofilemodel!.data == null || wholeProfileController
                                .wholemyprofilemodel!.data!.isEmpty ? SizedBox() :
                  Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: CircleAvatar(
                      radius: 35,
                        backgroundColor: Colors.transparent,
                      child:ClipOval (
                        
                        child: CachedNetworkImage(
                          imageUrl: "${Constants.USERPROFILE_IMAGEPATH_URL}" +
                              wholeProfileController
                                  .wholemyprofilemodel!
                                  .data![0].image
                                  .toString(),
                            
                          fit: BoxFit.cover,
                          width: 75,
                          height: 75,
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(),
                          ), // Replace with your own placeholder widget
                          errorWidget: (context, url, error) => Icon(
                              Icons.error), // Replace with your own error widget
                        ),
                        //  Image.asset("assets/image/boyprofile3.png"),
                      ),
                    ),
                  );
                          
                  // Image.asset("assets/image/girl.png")
                              }),
                  
                      //  SvgPicture.asset("assets/image/girl.svg"),
                    ],
                  ),
                ),
          
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),

                  wholehomecontroller == null? Center(
                                          child: SpinKitCircle(
                                            color: Colors
                                                .grey, // Color of the progress bar
                                            size:
                                                20.0, // Size of the progress bar
                                          ),
                                        ):
                
                 GetBuilder<WholeHomeController>(
                  init: wholehomecontroller,
                  builder: (_) {
                    // List<dynamic> data = homeusercontroller.userBannerModel!.data!;
if(wholehomecontroller.wholeBannerModel == null){
  return CircularProgressIndicator();
}
List<Banner.Datum> data = wholehomecontroller.wholeBannerModel!.data!;
List<Banner.Datum> filteredData = data.where((item) =>
    item.type == 'home_banner_1' ||
    item.type == 'home_banner_2' ||
    item.type == 'home_banner_3').toList();

List<Banner.Datum> filteredDataVideo = data.where((item) =>
    item.type == 'video' 
   ).toList();

    print("vvwholevvv***${filteredData.length}");

    GetStorage().write('videobanner',filteredDataVideo[0].image) ;
    print(GetStorage().read('videobanner') );
    print("kk");
    print("vvvvv***${filteredDataVideo[0].image}");
                      return  wholehomecontroller. showLoading ?
                      Center(
                                          child: SpinKitCircle(
                                            color: Colors
                                                .grey, // Color of the progress bar
                                            size:
                                                20.0, // Size of the progress bar
                                          ),
                                        ):
                      wholehomecontroller.wholeBannerModel == null
                          ? SizedBox()
                          : CarouselSlider.builder(
                              itemCount:filteredData.length,
                              options: CarouselOptions(
                                aspectRatio: 16 / 9,
                                viewportFraction: 1,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 3),
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                              ),
                                   itemBuilder: (context, index, realIdx) {


                                    // List <String> filterdata = 
          // var item = filteredData[index];
                                // var item = homeusercontroller
                                //     .userBannerModel!.data![index];
   var item = filteredData[index];
   var imagePath = "${Constants.BANNER_IMAGE_PATH}${(item.image ?? '')}";
                                // var imagePath = 
                                //     "${Constants.BANNER_IMAGE_PATH}${( item.image ?? "")}";
                                return Stack(
                                  children: [
                                    // Image.asset(item["image"]),
                                    Container(
                                      height: 140,
                                      child: CachedNetworkImage(
                                        imageUrl: imagePath, fit: BoxFit.cover,
                                        // width: 61,
                                        // height: 75,
                                        placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator(),
                                        ), // Replace with your own placeholder widget
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons
                                                .error), // Replace with your own error widget
                                      ),
                                    ),
                                    // Positioned(
                                    //   top: 30,
                                    //   left: 10,
                                    //   child: Column(
                                    //     crossAxisAlignment:
                                    //         CrossAxisAlignment.start,
                                    //     children: [
                                    //       Text(
                                    //         item.title!,
                                    //         style:
                                    //             CustomTextStyle.popinstextsmall12,
                                    //       ),
                                    //       SizedBox(
                                    //           width: MediaQuery.of(context)
                                    //                   .size
                                    //                   .width *
                                    //               0.37,
                                    //           child: Text(
                                    //             item.data!,
                                    //             style: CustomTextStyle
                                    //                 .popinstextsmall12,
                                    //           )),

                                    //       SizedBox(
                                    //         height:
                                    //             MediaQuery.of(context).size.height *
                                    //                 0.02,
                                    //       ),
                                    //       Padding(
                                    //         padding: const EdgeInsets.only(
                                    //             right: 10, bottom: 10),
                                    //         child: Container(
                                    //             width: 80,
                                    //             height: 30,
                                    //             decoration: BoxDecoration(
                                    //                 borderRadius:
                                    //                     BorderRadius.circular(15),
                                    //                 color: Color(0xffffcc00)),
                                    //             child: Center(
                                    //                 child: Text(
                                    //               "Shop  Now",
                                    //               style:
                                    //                   CustomTextStyle.popinssmall1,
                                    //             ))),
                                    //       )

                                    //     ],
                                    //   ),
                                    // ),
                                  ],
                                );

                                // Container(
                                //   child: Center(
                                //       child: Image.asset( item["image"],
                                //           fit: BoxFit.cover, )),
                                // );
                              });
                    },
                  ),

           
                // GetBuilder<WholeHomeController>(
                //   init: wholehomecontroller,
                //   builder: (_) {
                //     return wholehomecontroller.wholeBannerModel == null
                //         ? SizedBox()
                //         : CarouselSlider.builder(
                //             itemCount: wholehomecontroller
                //                 .wholeBannerModel!.data!.length,
                //             options: CarouselOptions(
                //           viewportFraction: 1,
                //                 initialPage: 0,
                //                 enableInfiniteScroll: true,
                //                 reverse: false,
                //                 autoPlay: true,
                //                 autoPlayInterval: Duration(seconds: 3),
                //                 autoPlayAnimationDuration:
                //                     Duration(milliseconds: 800),
                //                 autoPlayCurve: Curves.fastOutSlowIn,
                //                 enlargeCenterPage: true,
                //             ),
                //             itemBuilder: (context, index, realIdx) {
                //               var item = wholehomecontroller
                //                   .wholeBannerModel!.data![index];
          
                //               var imagePath =
                //                   "${Constants.BANNER_IMAGE_PATH}${item.image ?? ""}";
                //                   print("=====>>>>>> Banners: $imagePath");
                //               return Stack(
                //                 children: [
                //                   // Image.asset(item["image"]),
                //                   Container(
                //                     // width: 335,
                //                     height: 140,
                //                     //  decoration: BoxDecoration(
                //                     //   borderRadius: BorderRadius.circular(25)
                //                     //  ),
                //                     child: CachedNetworkImage(
                //                       imageUrl: imagePath, fit: BoxFit.cover,
                //                       // width: 61,
                //                       // height: 75,
                //                       placeholder: (context, url) => Center(
                //                         child: CircularProgressIndicator(),
                //                       ), // Replace with your own placeholder widget
                //                       errorWidget: (context, url, error) =>
                //                           Icon(Icons
                //                               .error), // Replace with your own error widget
                //                     ),
                //                   ),
                //                   // Positioned(
                //                   //   top: 30,
                //                   //   left: 10,
                //                   //   child: Column(
                //                   //     crossAxisAlignment:
                //                   //         CrossAxisAlignment.start,
                //                   //     children: [
                //                   //       Text(
                //                   //         item.title!,
                //                   //         style:
                //                   //             CustomTextStyle.popinstextsmall12,
                //                   //       ),
                //                   //       SizedBox(
                //                   //           width: MediaQuery.of(context)
                //                   //                   .size
                //                   //                   .width *
                //                   //               0.37,
                //                   //           child: Text(
                //                   //             item.data!,
                //                   //             style: CustomTextStyle
                //                   //                 .popinstextsmall12,
                //                   //           )),
          
                //                   //       SizedBox(
                //                   //         height:
                //                   //             MediaQuery.of(context).size.height *
                //                   //                 0.02,
                //                   //       ),
                //                   //       Padding(
                //                   //         padding: const EdgeInsets.only(
                //                   //             right: 10, bottom: 10),
                //                   //         child: Container(
                //                   //             width: 80,
                //                   //             height: 30,
                //                   //             decoration: BoxDecoration(
                //                   //                 borderRadius:
                //                   //                     BorderRadius.circular(15),
                //                   //                 color: Color(0xffffcc00)),
                //                   //             child: Center(
                //                   //                 child: Text(
                //                   //               "Shop  Now",
                //                   //               style:
                //                   //                   CustomTextStyle.popinssmall1,
                //                   //             ))),
                //                   //       )
          
                //                   //     ],
                //                   //   ),
                //                   // ),
                //                 ],
                //               );
          
                //               // Container(
                //               //   child: Center(
                //               //       child: Image.asset( item["image"],
                //               //           fit: BoxFit.cover, )),
                //               // );
                //             });
                //   },
                // ),
          
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.02,
                // ),
          
                Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 45,
                        width: 265,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(17),
                          
                          // border: Border.all(color:brandcolor ),
                          
                          color: MyColors.white,
                        ),
                        child: TextFormField(
                          onTap: () {
                            wholehomecontroller.clearSearchData();
                            Get.to(WholeSalerSearchScreen());
                          },
                          readOnly: true,
                          controller: _searchcontroller,
                          style: TextStyle(
                            fontSize: 14,
                            color: MyColors.voliet,
                            fontFamily: "SF-Pro-Display",
                          ),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 15),
                              fillColor: MyColors.white,
                              focusColor: MyColors.white,
                              enabledBorder:
                                  OutlineInputBorder(borderSide: BorderSide.none
                                      // borderRadius: BorderRadius.circular(50),
                                      ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                //  borderRadius: BorderRadius.circular(50),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                //  borderRadius: BorderRadius.circular(50),
                              ),
                              hintText: "Search",
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset(
                                  "assets/image/searchnormal.png",
                                  width: 10,
                                ),
                              ),
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                          
                      //  SizedBox(width: 10,),
                      GestureDetector(
                        onTap: () {
                          WholeSalerOurBrandFilterController filtercontroller =
                              Get.put(WholeSalerOurBrandFilterController());
                          // filtercontroller.init();
                          filtercontroller.loadDefaultData();
                          filtercontroller.clearFields();
                        
                          filtercontroller.init();
                          Get.to(WholeSalerFilterScreenUI());
                          Get.to(FilterScreenWhole());
                        },
                        child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xffffcc00)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                "assets/image/filter3.png",
                              ),
                            )),
                      )
                    ],
                  ),
                ),
          
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    height: 130,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        GetBuilder<WholeHomeController>(
                            init: wholehomecontroller,
                            builder: (_) {
                              return !wholehomecontroller.categoryLoaded
                                  ? SizedBox()
                                  : ListView.builder(
                                      primary: false,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: wholehomecontroller
                                          .userCategoriesModel!.data!.length,
                                      itemBuilder: (context, index) {
                                        var item = wholehomecontroller
                                            .userCategoriesModel!.data![index];
                                        // print(item.name!);
                                        var imagePath =
                                            "${Constants.BASE_URL}${Constants.CATEGORIES_IMAGE_PATH}${item.image ?? ""}";
                                        // print(imagePath);
                          
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: InkWell(
                                            onTap: () async {
                                              wholesubcategorycontroller
                                                  .addproduct(item.id ?? 0);
                                              wholesubcategorycontroller
                                                  .currentCategory(
                                                      item.name ?? "");
                                              await wholesubcategorycontroller
                                                  .productInitByCategory();
                          
                                              Get.to(() => WholeAllcategory());
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(right:10.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    child: CachedNetworkImage(
                                                      imageUrl: imagePath,
                                                      width: 61,
                                                      height: 75,
                                                      placeholder: (context, url) =>
                                                          Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      ), // Replace with your own placeholder widget
                                                      errorWidget: (context, url,
                                                              error) =>
                                                          Icon(Icons
                                                              .error), // Replace with your own error widget
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(item.name??'',       
                                                      style: CustomTextStyle
                                                          .popinssmall)
                                                ],
                                              ),
                                            ),
                                          ),
                          
                                          //  Stack(
                                          //   children: [
                                          //     Container(
                                          //       width: 69,
                                          //       height: 75,
                                          //       decoration: BoxDecoration(
                                          //         borderRadius: BorderRadius.circular(23),
                                          //         color: item,
                                          //         boxShadow: [
                                          //           BoxShadow(
                                          //             color: Colors.grey.withOpacity(0.3),
                                          //             spreadRadius: 2,
                                          //             blurRadius: 5,
                                          //             offset: Offset(
                                          //                 0, 3), // Offset of the shadow
                                          //           ),
                                          //         ],
                                          //       ),
                                          //     ),
                                          //   ],
                                          // )
                                        );
                                      },
                                    );
                            }),
                      ],
                    ),
                  ),
                ),
          
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "New Arrivals",
                        style: CustomTextStyle.popinstext,
                      ),
                          
                      // Text("See All", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                          
                      GestureDetector(
                        onTap: () {
                          Get.to(() => ProductAlllistPagewhole());
                        },
                        child: Text('See All',
                            style: TextStyle(
                                color: MyColors.bgcolor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins")),
                      ),
                    ],
                  ),
                ),
          
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          
                Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    child: GetBuilder<WholeHomeController>(
                        init: wholehomecontroller,
                        builder: (_) {
                          return wholehomecontroller.userPropertiesModel == null
                              ? SizedBox()
                              : wholehomecontroller.propertyLoaded == null
                                  ? SizedBox()
                                  : Container(
                                      // height: 600,
                                      child: GridView.builder(
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          physics: NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  crossAxisSpacing: 15.0,
                                                  mainAxisSpacing: 15.0,
                                                  mainAxisExtent: 285),
                                          itemCount: wholehomecontroller
                                              .userPropertiesModel!.data!.length
                                              .clamp(0,
                                                  4), // Set the number of cards you want to display.
                                          itemBuilder: (context, index) {
                                            // gridDelegate:
                                            //     SliverGridDelegateWithMaxCrossAxisExtent(
                                            //         maxCrossAxisExtent: 150,
                                            //      childAspectRatio: 3 / 2,
                                            //         mainAxisExtent: 285,
                                            //         crossAxisSpacing: 15,
                                            //         mainAxisSpacing: 15),
                                            // itemCount: wholehomecontroller
                                            //     .userPropertiesModel!.data!.length
                                            //     .clamp(0, 4),
                                            // itemBuilder: (BuildContext ctx, index) {
                            
                                            var item = wholehomecontroller
                                                .userPropertiesModel!.data![index];
                                            String imagePath =
                                                Constants.PRODUCT_HOME_IMAGE_PATH +
                                                    "/${item.image!}";
                            
                                            // var imagePath =
                                            //     "${Constants.BASE_URL}${Constants.PRODUCT_IMAGE_PATH}${item.image ?? ""}";
                                            // print(imagePath);
                                            return InkWell(
                                              onTap: () async {
                                              wholeproductdetailsController.dispose() ;
                                                wholeproductdetailsController
                                                    .viewproduct(
                                                  item.id ?? 0,
                                                );
                                                print("productid${item.id ?? 0}");
                                                await wholeproductdetailsController
                                                    .init();
                                                Get.to(ProductDetailswhole(
                                                  id:item.id??0
                                                ));
                                              },
                                              child:
                                              
                                                  Container(
                                                width: 140,
                                                // height: 700,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      // _getRandomColor(),
                                                      // _getRandomColor(),
                                                      // _getRandomColor(),
                                                      // _getRandomColor(),
                                                      // MyColors.white
                                                      //     .withOpacity(0.1),
                                                      MyColors.white,
                                                      MyColors.white,
                                                      // MyColors.white,
                                                    ],
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  // color: MyColors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.3),
                                                      spreadRadius: 3,
                                                      blurRadius: 7,
                                                      offset: Offset(0,
                                                          3), // Offset of the shadow
                                                    ),
                                                  ],
                                                  // color: MyColors.white
                                                ),
                                                child: Column(
                                                  children: [
       
                                                
                  Row(
  children:[

  IconButton(
  icon: Icon(Icons.share,size:20,color:MyColors.red),
  onPressed: () {
   shareContent(item.image.toString(), item.name.toString(),  item.price.toString());

    // Share.share(itemAll.toString());
  
  },
),


Spacer(),


           

        InkWell(
                                                       onTap: () {
                                                         wholehomecontroller
                                                             .addItemToWishList(
                                                                 item.id!);
                                                       },
                                                       child: Padding(
                                                         padding:
                                                             const EdgeInsets.all(
                                                                 8.0),
                                                         child: Align(
                                                             alignment: Alignment
                                                                 .centerRight,
                                                             child: Icon(wholehomecontroller
                                                                     .wishListItemsId
                                                                     .contains(
                                                                         item.id!)
                                                                 ? Icons.favorite
                                                                 : Icons
                                                                     .favorite_border,color:Colors.red)),
                                                       ),
                                                     ),
                                      
]),

                              


                                                    Container(
                                                      height: 125,
                                                      decoration: BoxDecoration(
                                                          // gradient:
                                                          //     LinearGradient(
                                                          //   colors: [
                                                          //     _getRandomColor(),
                                                          //     _getRandomColor(),
                                                          //     _getRandomColor(),
                                                          //     _getRandomColor(),
                                                          //   ],
                                                          //   begin:
                                                          //       Alignment.topLeft,
                                                          //   end: Alignment
                                                          //       .bottomRight,
                                                          // ),
                                                          ),
                                                      // decoration: BoxDecoration(
                                                      //     borderRadius: BorderRadius.circular(30),
                                                      //     color: MyColors.white),
                                                      child: CachedNetworkImage(
                                                        imageUrl: imagePath,
                                                        // width: 61,
                                                        // height: 75,
                                                        placeholder:
                                                            (context, url) =>
                                                                Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        ), // Replace with your own placeholder widget
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons
                                                                .error), // Replace with your own error widget
                                                      ),
                                                    ),

                                                    // SizedBox(height: 15,),

                                                    Container(
                                                      // height: 140,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 10.0,
                                                                right: 5,
                                                                top: 5),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(item.name??'',
                                                           maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                                                style: CustomTextStyle
                                                                    .popinsmedium),
                                                            Text(
                                                                item.description
                                                                            .toString()
                                                                            .length <
                                                                        18
                                                                    ? item
                                                                        .description!
                                                                    : item
                                                                        .description!
                                                                        .substring(
                                                                            0,
                                                                            19),
                                                                style: CustomTextStyle
                                                                    .popinssmall0),
                                                            SizedBox(height: 5),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                           (item.discount !="0.00"&& item.discount !="0"&&item.discount !="0.0")?
                                                                  
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                            "₹" +
                                                                                item.wholePrice.toString(),
                                                                            style: CustomTextStyle.discounttext),
                                                                        SizedBox(
                                                                            width:
                                                                                2),
                                                                        // Container(
                                                                        // height:
                                                                        //     20,
                                                                        // width: 48,
                                                                        // decoration: BoxDecoration(
                                                                        //     color: MyColors
                                                                        //         .red,
                                                                        //     borderRadius: BorderRadius.circular(
                                                                        //         10),
                                                                        //     border:
                                                                        //         Border.all(color: MyColors.red)),
                                                                        // child:
                                                                        //     Center(
                                                                        //   child:
                                                                        Text(
                                                                            // item.discount.toString(),
                                                                              "Save${double.parse(item.discount??'').toStringAsFixed(0)}%",
                                                                            style:
                                                                                CustomTextStyle.popinstextsmal2222red),
                                                                        //   ),
                                                                        // ),
                                                                      ],
                                                                    ): const  SizedBox(),
                                                                   
                                                                   
                                                                    SizedBox(
                                                                        height:
                                                                            5),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        SizedBox(
                                                                          width:
                                                                              Get.width * 0.23,
                                                                          child:
                                                                              Text(
                                                                            "₹ ${((double.parse(item.wholePrice ?? '')) - ((double.parse(item.wholePrice ?? "")) * (double.parse(item.discount ?? "0")) / 100)).toDouble().toStringAsFixed(2)}",

                                                                            // "₹" +
                                                                            //     item.wholePrice!,
                                                                            style:
                                                                                CustomTextStyle.popinsmedium,
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            width:
                                                                                Get.width * 0.054),
                                                                        InkWell(
                                                                               onTap: () async{
                                                                             wholeproductdetailsController.viewproductHome(
                                                                                   item.id??0,item.name??'',"1kg",1 ,double.parse(item.wholePrice ?? ''),item.image??'',"yes");
                                                                              await wholeproductdetailsController.addProductHome();
                                                            mycartwholeController.init();
                                                                              
                                                                            },
                                                                          child: Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(right: 5.0),
                                                                            child: Container(
                                                                                width: 35,
                                                                                height: 35,
                                                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xffffcc00)),
                                                                                child: Padding(
                                                                                  padding: EdgeInsets.all(5.0),
                                                                                  child: Image.asset(
                                                                                    "assets/image/bag2.png",
                                                                                    height: 25,
                                                                                  ),
                                                                                )),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),

                                                                // Image.asset(
                                                                //   "assets/image/yellowbag.png",
                                                                //   height: 80,
                                                                // )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                         
                                 
                                              //  Container(
                                              //   width: 140,
                                              //   // height: 700,
                                              //   decoration: BoxDecoration(
                                              //     borderRadius:
                                              //         BorderRadius.circular(25),
                                              //     color: MyColors.white,
                                              //     boxShadow: [
                                              //       BoxShadow(
                                              //         color: Colors.grey
                                              //             .withOpacity(0.3),
                                              //         spreadRadius: 3,
                                              //         blurRadius: 7,
                                              //         offset: Offset(0,
                                              //             3), // Offset of the shadow
                                              //       ),
                                              //     ],
                                              //     // color: MyColors.white
                                              //   ),
                                              //   child: Column(
                                              //     children: [
                                              //       InkWell(
                                              //         onTap: () {
                                              //           wholehomecontroller
                                              //               .addItemToWishList(
                                              //                   item.id!);
                                              //         },
                                              //         child: Padding(
                                              //           padding:
                                              //               const EdgeInsets.all(
                                              //                   8.0),
                                              //           child: Align(
                                              //               alignment: Alignment
                                              //                   .centerRight,
                                              //               child: Icon(wholehomecontroller
                                              //                       .wishListItemsId
                                              //                       .contains(
                                              //                           item.id!)
                                              //                   ? Icons.favorite
                                              //                   : Icons
                                              //                       .favorite_border,color:Colors.red)),
                                              //         ),
                                              //       ),
                            
                                              //       Container(
                                              //         height: 125,
                            
                                              //         // decoration: BoxDecoration(
                                              //         //     borderRadius: BorderRadius.circular(30),
                                              //         //     color: MyColors.white),
                                              //         child: CachedNetworkImage(
                                              //           imageUrl: imagePath,
                                              //           // width: 61,
                                              //           // height: 75,
                                              //           placeholder:
                                              //               (context, url) =>
                                              //                   Center(
                                              //             child:
                                              //                 CircularProgressIndicator(),
                                              //           ), // Replace with your own placeholder widget
                                              //           errorWidget: (context, url,
                                              //                   error) =>
                                              //               Icon(Icons
                                              //                   .error), // Replace with your own error widget
                                              //         ),
                                              //       ),
                            
                                              //       // SizedBox(height: 15,),
                            
                                              //       Container(
                                              //         // height: 140,
                                              //         child: Padding(
                                              //           padding:
                                              //               const EdgeInsets.only(
                                              //                   left: 10.0,
                                              //                   right: 5,
                                              //                   top: 5),
                                              //           child: Column(
                                              //             mainAxisAlignment:
                                              //                 MainAxisAlignment
                                              //                     .start,
                                              //             crossAxisAlignment:
                                              //                 CrossAxisAlignment
                                              //                     .start,
                                              //             children: [
                                              //               Text(item.name!,
                                              //                   style: CustomTextStyle
                                              //                       .popinsmedium),
                                              //               Text(
                                              //                   item.description
                                              //                               .toString()
                                              //                               .length <
                                              //                           30
                                              //                       ? item
                                              //                           .description!
                                              //                       : item
                                              //                           .description!
                                              //                           .substring(
                                              //                               0, 19),
                                              //                   style: CustomTextStyle
                                              //                       .popinssmall0),
                                              //               SizedBox(height: 5),
                                              //               Row(
                                              //                 mainAxisAlignment:
                                              //                     MainAxisAlignment
                                              //                         .spaceBetween,
                                              //                 children: [
                                              //                   Column(
                                              //                     crossAxisAlignment:
                                              //                         CrossAxisAlignment
                                              //                             .start,
                                              //                     children: [
                                              //                       Row(
                                              //                         children: [
                                              //                           Text(
                                              //                               "₹" +
                                              //                                   item.wholePrice
                                              //                                       .toString(),
                                              //                               style: CustomTextStyle
                                              //                                   .discounttext),
                                              //                           SizedBox(
                                              //                               width:
                                              //                                   10),
                                              //                           Container(
                                              //                             height:
                                              //                                 20,
                                              //                             width: 40,
                                              //                             decoration: BoxDecoration(
                                              //                                 color: MyColors
                                              //                                     .red,
                                              //                                 borderRadius: BorderRadius.circular(
                                              //                                     10),
                                              //                                 border:
                                              //                                     Border.all(color: MyColors.red)),
                                              //                             child:
                                              //                                 Center(
                                              //                               child: Text(
                                              //                                   // item.discount.toString(),
                                              //                                     "Save${double.parse(item.discount??'').toStringAsFixed(0)}%",
                                              //                                   style: CustomTextStyle.popinstextsmal2222),
                                              //                             ),
                                              //                           ),
                                              //                         ],
                                              //                       ),
                                              //                       SizedBox(
                                              //                           height: 5),
                                              //                       Text(
                                              //                         "₹ ${((double.parse(item.wholePrice ?? '')) - ((double.parse(item.wholePrice ?? "")) * (double.parse(item.discount ?? "0")) / 100)).toDouble()}",
                            
                                              //                         // "₹" +
                                              //                         //     item.wholePrice!,
                                              //                         style: CustomTextStyle
                                              //                             .popinsmedium,
                                              //                       ),
                                              //                     ],
                                              //                   ),
                            
                                              //                   Padding(
                                              //                     padding:
                                              //                         const EdgeInsets
                                              //                                 .only(
                                              //                             right:
                                              //                                 5.0),
                                              //                     child: Container(
                                              //                         width: 35,
                                              //                         height: 35,
                                              //                         decoration: BoxDecoration(
                                              //                             borderRadius:
                                              //                                 BorderRadius.circular(
                                              //                                     10),
                                              //                             color: Color(
                                              //                                 0xffffcc00)),
                                              //                         child:
                                              //                             Padding(
                                              //                           padding:
                                              //                               EdgeInsets.all(
                                              //                                   5.0),
                                              //                           child: Image
                                              //                               .asset(
                                              //                             "assets/image/bag2.png",
                                              //                             height:
                                              //                                 25,
                                              //                           ),
                                              //                         )),
                                              //                   )
                                              //                   // Image.asset(
                                              //                   //   "assets/image/yellowbag.png",
                                              //                   //   height: 80,
                                              //                   // )
                                              //                 ],
                                              //               )
                                              //             ],
                                              //           ),
                                              //         ),
                                              //       )
                                              //     ],
                                              //   ),
                                              // ),
                                        
                                          //  
                                           
                                            );
                                          }),
                                    );
                        }),
                  ),
                ),
          
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Our Brand",
                        style: CustomTextStyle.popinstext,
                      ),
                          
                      // Text("See All", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                          
                      InkWell(
                        onTap: () {
                          Get.to(() => WholeAllbrandPage(
                            data: wholehomecontroller.wholeOurBrandModel!.data!
                                    .where((element) => element.canine == 1)
                                    .toList()));
                         
                        },
                        child: Text('See All',
                            style: TextStyle(
                                color: MyColors.bgcolor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins")),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.0),
                Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      // GetBuilder<HomeuserController>(
                      //     init: homeusercontroller,
                      //     builder: (_) {
                      //       return !homeusercontroller.categoryLoaded
                      //           ? SizedBox()
                      //           : ListView.builder(
                      //               primary: false,
                      //               scrollDirection: Axis.horizontal,
                      //               shrinkWrap: true,
                      //               itemCount:
                      //                   homeusercontroller.getOurBrandList.length,
                      //               itemBuilder: (context, index) {
                      //                 var item =
                      //                     homeusercontroller.getOurBrandList[index];
                      //                 // print(item.name!);
                      //                 // var imagePath =
                      //                 //     "${Constants.BASE_URL}${Constants.CATEGORIES_IMAGE_PATH}${item.image ?? ""}";
                      //                 // print(imagePath);
          
                      //                 return Padding(
                      //                   padding: const EdgeInsets.all(8.0),
                      //                   child: Column(
                      //                     children: [
                      //                       Container(
                      //                         height: MediaQuery.of(context)
                      //                                 .size
                      //                                 .width *
                      //                             0.55,
                      //                         width: MediaQuery.of(context)
                      //                                 .size
                      //                                 .width *
                      //                             0.46,
                      //                         decoration: BoxDecoration(
                      //                           borderRadius:
                      //                               BorderRadius.circular(30),
                      //                           // color: MyColors.white
                      //                         ),
                      //                         child: Stack(
                      //                           alignment: Alignment.topCenter,
                      //                           children: [
                      //                             // SizedBox(height: 140,),
                      //                             Container(
                      //                               height: MediaQuery.of(context)
                      //                                       .size
                      //                                       .width *
                      //                                   0.6,
                      //                               width: MediaQuery.of(context)
                      //                                       .size
                      //                                       .width *
                      //                                   0.46,
                      //                               decoration: BoxDecoration(
                      //                                   borderRadius:
                      //                                       BorderRadius.circular(
                      //                                           30),
                      //                                   color: Colors.transparent),
                      //                               child: Column(
                      //                                 children: [
                      //                                   Padding(
                      //                                     padding:
                      //                                         const EdgeInsets.only(
                      //                                             top: 25.0),
                      //                                     child: Container(
                      //                                       decoration:
                      //                                           BoxDecoration(
                      //                                         borderRadius:
                      //                                             BorderRadius
                      //                                                 .circular(30),
                      //                                         gradient:
                      //                                             LinearGradient(
                      //                                           begin: Alignment
                      //                                               .topCenter,
                      //                                           end: Alignment
                      //                                               .bottomCenter,
                      //                                           colors: [
                      //                                             Color(0xFFFFF0BA),
                      //                                             Color.fromRGBO(
                      //                                                 252,
                      //                                                 233,
                      //                                                 166,
                      //                                                 0.00),
                      //                                           ],
                      //                                         ),
                      //                                       ),
                      //                                       child: Image.asset(
                      //                                           item["image"],
                      //                                           fit: BoxFit.cover,
                      //                                           height: 135),
                      //                                     ),
                      //                                   ),
                      //                                   SizedBox(
                      //                                     height: 15,
                      //                                   ),
                      //                                   Text(item["title"],
                      //                                       style: CustomTextStyle
                      //                                           .popinssmall0)
                      //                                 ],
                      //                               ),
                      //                             ),
          
                      //                             Positioned(
                      //                               top: 3,
                      //                               child: Container(
                      //                                   height: 50,
                      //                                   width: 60,
                      //                                   decoration: BoxDecoration(
                      //                                       color: Colors.white
                      //                                           .withOpacity(0.3),
                      //                                       borderRadius:
                      //                                           BorderRadius
                      //                                               .circular(20)),
                      //                                   child: Image.asset(
                      //                                     item["logo"],
                      //                                     height: 50,
                      //                                   )),
                      //                             )
                      //                           ],
                      //                         ),
                      //                       ),
                      //                     ],
                      //                   ),
          
                      //                   //  Stack(
                      //                   //   children: [
                      //                   //     Container(
                      //                   //       width: 69,
                      //                   //       height: 75,
                      //                   //       decoration: BoxDecoration(
                      //                   //         borderRadius: BorderRadius.circular(23),
                      //                   //         color: item,
                      //                   //         boxShadow: [
                      //                   //           BoxShadow(
                      //                   //             color: Colors.grey.withOpacity(0.3),
                      //                   //             spreadRadius: 2,
                      //                   //             blurRadius: 5,
                      //                   //             offset: Offset(
                      //                   //                 0, 3), // Offset of the shadow
                      //                   //           ),
                      //                   //         ],
                      //                   //       ),
                      //                   //     ),
                      //                   //   ],
                      //                   // )
                      //                 );
                      //               },
                      //             );
                      //     }),
                      GetBuilder<WholeHomeController>(
                          init: wholehomecontroller,
                          builder: (_) {
                            return wholehomecontroller.wholeOurBrandModel ==
                                        null ||
                                    wholehomecontroller
                                            .wholeOurBrandModel!.data ==
                                        null ||
                                    wholehomecontroller
                                        .wholeOurBrandModel!.data!.isEmpty
                                ? SizedBox()
                                : ListView.builder(
                                    primary: false,
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: wholehomecontroller
                                        .wholeOurBrandModel!.data!
                                        .where((element) => element.canine == 1)
                                        .toList()
                                        .length,
                                    itemBuilder: (context, index) {
                                      var item = wholehomecontroller
                                          .wholeOurBrandModel!.data!
                                          .where(
                                              (element) => element.canine == 1)
                                          .toList()[index];
                                      // print("ItemName: ${item.id!}");
                                      var imagePath =
                                          "${Constants.BASE_URL}${Constants.BRAND_IMAGE_PATH}${item.image ?? ""}";
                                      var imageLogoPath =
                                          "${Constants.BASE_URL}${Constants.BRANDLOGO_IMAGE_PATH}${item.logo ?? ""}";
                                      // print(imagePath);
                                      return InkWell(
                                        onTap: () async{
                                             oubranddetailswholeController.addproduct(
                            item.id ?? 0, item.title ?? '', item.logo ?? '');
                        //  subcategorycontroller.addproduct(item.id??0) ;
                        await oubranddetailswholeController.ourproductinit();

                        oubranddetailswholeController.disposeController();
                        Get.to(WholeOurBrandDetails());
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.55,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.46,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  // color: MyColors.white
                                                ),
                                                child: Stack(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  children: [
                                                    // SizedBox(height: 140,),
                                                    Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.6,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.46,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                          color: Colors
                                                              .transparent),
                                                      child: Column(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 25.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30),
                                                                gradient:
                                                                    LinearGradient(
                                                                  begin: Alignment
                                                                      .topCenter,
                                                                  end: Alignment
                                                                      .bottomCenter,
                                                                  colors: [
                                                                    Color(
                                                                        0xFFFFF0BA),
                                                                    Color.fromRGBO(
                                                                        252,
                                                                        233,
                                                                        166,
                                                                        0.00),
                                                                  ],
                                                                ),
                                                              ),
                                                              child:
                                                                  CachedNetworkImage(
                                                                imageUrl:
                                                                    imagePath,
                                                                // width: 50,
                                                                height: 135,
                                                                placeholder:
                                                                    (context,
                                                                            url) =>
                                                                        Center(
                                                                  child:
                                                                      CircularProgressIndicator(),
                                                                ), // Replace with your own placeholder widget
                                                                errorWidget: (context,
                                                                        url,
                                                                        error) =>
                                                                    Icon(Icons
                                                                        .error), // Replace with your own error widget
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          Text(item.title!,
                                                              style: CustomTextStyle
                                                                  .popinssmall0)
                                                        ],
                                                      ),
                                                    ),
                                                    Positioned(
                                                      top: 3,
                                                      child: Container(
                                                        height: 50,
                                                        width: 60,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.3),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                        child:
                                                            // Image.asset(
                                                            //   item["logo"],
                                                            //   height: 50,
                                                            // ),
                                                            CachedNetworkImage(
                                                          imageUrl:
                                                              imageLogoPath,
                                                          // width: 50,
                                                          height: 50,
                                                          placeholder:
                                                              (context, url) =>
                                                                  Center(
                                                            child:
                                                                CircularProgressIndicator(),
                                                          ), // Replace with your own placeholder widget
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              Icon(Icons
                                                                  .error), // Replace with your own error widget
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          //  Stack(
                                          //   children: [
                                          //     Container(
                                          //       width: 69,
                                          //       height: 75,
                                          //       decoration: BoxDecoration(
                                          //         borderRadius: BorderRadius.circular(23),
                                          //         color: item,
                                          //         boxShadow: [
                                          //           BoxShadow(
                                          //             color: Colors.grey.withOpacity(0.3),
                                          //             spreadRadius: 2,
                                          //             blurRadius: 5,
                                          //             offset: Offset(
                                          //                 0, 3), // Offset of the shadow
                                          //           ),
                                          //         ],
                                          //       ),
                                          //     ),
                                          //   ],
                                          // )
                                        ),
                                      );
                                    },
                                  );
                          }),
                    ],
                  ),
                ),
          
                // !wholehomecontroller.propertyLoaded
                //     ? SizedBox()
                //     : GetBuilder<WholeHomeController>(
                //         init: wholehomecontroller,
                //         builder: (_) {
                //           return Container(
                //             // height: 600,
                //             child: GridView.builder(
                //                 primary: false,
                //                 shrinkWrap: true,
                //                 scrollDirection: Axis.vertical,
                //                 physics: NeverScrollableScrollPhysics(),
                //                 gridDelegate:
                //                     SliverGridDelegateWithMaxCrossAxisExtent(
                //                         maxCrossAxisExtent: 150,
                //                         childAspectRatio: 3 / 2,
                //                         mainAxisExtent: 270,
                //                         crossAxisSpacing: 15,
                //                         mainAxisSpacing: 15),
                //                 itemCount: wholehomecontroller
                //                     .userPropertiesModel!.data!.length
                //                     .clamp(0, 4),
                //                 itemBuilder: (BuildContext ctx, index) {
                //                   var item = wholehomecontroller
                //                       .userPropertiesModel!.data![index];
          
                //                   var imagePath =
                //                       "${Constants.BASE_URL}${Constants.PRODUCT_IMAGE_PATH}${item.image ?? ""}";
                //                   print(imagePath);
                //                   return InkWell(
                //                     onTap: () {
                //                       Navigator.push(
                //                           context,
                //                           MaterialPageRoute(
                //                               builder: (context) =>
                //                                   ProductDetailswhole(
                //                                     itemdetails: item,
                //                                   )));
                //                     },
                //                     child: Container(
                //                       width: 140,
                //                       // height: 700,
                //                       decoration: BoxDecoration(
                //                         borderRadius: BorderRadius.circular(25),
                //                         color: MyColors.white,
                //                         boxShadow: [
                //                           BoxShadow(
                //                             color: Colors.grey.withOpacity(0.3),
                //                             spreadRadius: 3,
                //                             blurRadius: 7,
                //                             offset: Offset(
                //                                 0, 3), // Offset of the shadow
                //                           ),
                //                         ],
                //                         // color: MyColors.white
                //                       ),
                //                       child: Column(
                //                         children: [
                //                           Container(
                //                             height: 125,
          
                //                             // decoration: BoxDecoration(
                //                             //     borderRadius: BorderRadius.circular(30),
                //                             //     color: MyColors.white),
                //                             child: CachedNetworkImage(
                //                               imageUrl: imagePath,
                //                               width: 61,
                //                               height: 75,
                //                               placeholder: (context, url) =>
                //                                   Center(
                //                                 child:
                //                                     CircularProgressIndicator(),
                //                               ), // Replace with your own placeholder widget
                //                               errorWidget: (context, url,
                //                                       error) =>
                //                                   Icon(Icons
                //                                       .error), // Replace with your own error widget
                //                             ),
                //                           ),
          
                //                           // SizedBox(height: 15,),
          
                //                           Container(
                //                             height: 145,
                //                             child: Padding(
                //                               padding: const EdgeInsets.only(
                //                                   left: 10.0, right: 5, top: 5),
                //                               child: Column(
                //                                 mainAxisAlignment:
                //                                     MainAxisAlignment.start,
                //                                 crossAxisAlignment:
                //                                     CrossAxisAlignment.start,
                //                                 children: [
                //                                   Text(item.name!,
                //                                       style: CustomTextStyle
                //                                           .popinsmedium),
                //                                   Text(
                //                                       item.description.toString(),
                //                                       style: CustomTextStyle
                //                                           .popinssmall0),
                //                                   // SizedBox(height: 3),
          
                //                                   Row(
                //                                     mainAxisAlignment:
                //                                         MainAxisAlignment
                //                                             .spaceBetween,
                //                                     children: [
                //                                       Text(
                //                                         item.wholePrice!,
                //                                         style: CustomTextStyle
                //                                             .popinsmedium,
                //                                       ),
          
                //                                       Padding(
                //                                         padding:
                //                                             const EdgeInsets.only(
                //                                                 right: 5.0),
                //                                         child: Container(
                //                                             width: 35,
                //                                             height: 35,
                //                                             decoration: BoxDecoration(
                //                                                 borderRadius:
                //                                                     BorderRadius
                //                                                         .circular(
                //                                                             10),
                //                                                 color: Color(
                //                                                     0xffffcc00)),
                //                                             child: Padding(
                //                                               padding:
                //                                                   EdgeInsets.all(
                //                                                       5.0),
                //                                               child: Image.asset(
                //                                                 "assets/image/bag2.png",
                //                                                 height: 25,
                //                                               ),
                //                                             )),
                //                                       )
                //                                       // Image.asset(
                //                                       //   "assets/image/yellowbag.png",
                //                                       //   height: 80,
                //                                       // )
                //                                     ],
                //                                   )
                //                                 ],
                //                               ),
                //                             ),
                //                           )
                //                         ],
                //                       ),
                //                     ),
                //                   );
                //                 }),
                //           );
                //         }),
          
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              ],
            ),
          ),

          // GetBuilder<WholeHomeController>(
          //     init: wholehomecontroller,
          //     builder: (_) {
          //       return wholehomecontroller.showLoading
          //           ? BackdropFilter(
          //               filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          //               child: Container(
          //                 color: Colors.black.withOpacity(
          //                     0.5), // Adjust the opacity as needed
          //               ),
          //             )
          //           : SizedBox();
          //     }),
          // // Progress bar
          // GetBuilder<WholeHomeController>(
          //     init: wholehomecontroller,
          //     builder: (_) {
          //       return wholehomecontroller.showLoading
          //           ? Center(
          //               child: SpinKitCircle(
          //                 color: Colors.white, // Color of the progress bar
          //                 size: 50.0, // Size of the progress bar
          //               ),
          //             )
          //           : SizedBox();
          //     }),
       
       
        ],
      ),
    );
  }
}
void shareContent(String image , String name, String detials) {
  // Replace these with your image and text
  String imageUrl = image;
  String text = "Product Name :"+name;
  String description = "Product Price :"+detials;

  String sharedText = '${Constants.BASE_URL}/storage/app/public/product/${imageUrl ?? ""}\n$text\n$description';

  Share.share(sharedText, subject: 'Welcome Message', sharePositionOrigin: Rect.fromCenter(center: Offset(0, 0), width: 100, height: 100));

}