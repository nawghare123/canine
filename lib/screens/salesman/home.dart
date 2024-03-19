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
import 'package:pet/models/salesmanModel/bannerModel.dart' as Banner;
import 'package:pet/controllers/salesman_controller/addtocartcontroller.dart';
import 'package:pet/controllers/salesman_controller/homesales_controller.dart';
import 'package:pet/controllers/salesman_controller/notification_controller.dart';
import 'package:pet/controllers/salesman_controller/productdetails_controller.dart';
import 'package:pet/controllers/salesman_controller/salesmanFilterController.dart';
import 'package:pet/controllers/salesman_controller/salesourbranddetailscontroller.dart';
import 'package:pet/controllers/salesman_controller/salesprofile_controller.dart';
import 'package:pet/controllers/salesman_controller/salesreview_controller.dart';
import 'package:pet/controllers/salesman_controller/salessubcateogries_controller.dart';
// import 'package:pet/others/Filter.dart';
import 'package:pet/screens/salesman/AllShopBrandPagesales.dart';


import 'package:pet/screens/salesman/AllbrandPagesales.dart';
import 'package:pet/screens/salesman/Allservicepage.dart';
import 'package:pet/screens/salesman/AlltoysalesPage.dart';

import 'package:pet/screens/salesman/SalesProductAlllistPage.dart';
import 'package:pet/screens/salesman/drawersalesman.dart';
import 'package:pet/screens/salesman/notification.dart';
import 'package:pet/screens/salesman/orderDetails.dart';
import 'package:pet/screens/salesman/ordersummary.dart';
import 'package:pet/screens/salesman/oubranddetails.dart';
import 'package:pet/screens/salesman/productbypartnersalesdetails.dart';
import 'package:pet/screens/salesman/productdetails.dart';
import 'package:pet/screens/salesman/salesPageProductbybrand.dart';
import 'package:pet/screens/salesman/salesallcategory.dart';
import 'package:pet/screens/salesman/salesmanFilterUI.dart';
import 'package:pet/screens/salesman/salesmanSearachScreen.dart';
import 'package:pet/screens/salesman/wholesalesoubranddetails.dart';
import 'package:pet/screens/salesman/widget/Filter.dart';
import 'package:pet/screens/salesman/widget/wholeAppBar.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';


class HomeSales extends StatelessWidget {
  HomeSales({super.key, this.wholeseller});
  int? wholeseller;
 

  final GlobalKey<ScaffoldState> _drawerkey = GlobalKey();
  bool showLoading = false;
  TextEditingController _searchcontroller = TextEditingController();

  SalesProfileController salesprofilecontroller =
      Get.put(SalesProfileController());
  SalesMyCartController mycartController = Get.put(SalesMyCartController());
  final SalesSubCategoryController salessubcategorycontroller =
      Get.put(SalesSubCategoryController());
  SalesOurBrandDetailsController salesOurBrandDetailsController =
      Get.put(SalesOurBrandDetailsController());
       final HomeSalesController homesalecontroller = Get.put(HomeSalesController());
         SalesProductDetailsController salesProductDetailsController =
      Get.put(SalesProductDetailsController());
      
 SalesReviewController salesReviewController = Get.put(SalesReviewController());
       final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
    GlobalKey<RefreshIndicatorState>();
  NotificationsalesController notificationsalescontroller = Get.put(NotificationsalesController()) ;

     @override
  void onInit() {
  
   
      mycartController.init();
       homesalecontroller. getWishinit(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerkey,
      drawer: drawerSalesMan(),
      appBar: CustomAppBarSales(drawerKey:  _drawerkey,title: "",), 
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
            // await     notificationcontroller.init();
      // await mycartController.init();
                await homesalecontroller.init();
                  
   homesalecontroller. getWishinit();
  //   homeusercontroller.fetchWishList();
                await Future.delayed(Duration(seconds: 2));
              },
            child: ListView(
              primary: true,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(height: MediaQuery.of(context).size.height*0.02,),
          
                    Padding(     padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: GetBuilder<SalesProfileController>(
                          init: salesprofilecontroller,
                          builder: (_) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: Text(
                                      "Find the pet you love on around you easily",
                                      style: CustomTextStyle.popinstext,
                                    )),
                    
                                CircleAvatar(
                                  radius: 35,
                                  backgroundColor: Colors.transparent,
                                  child:
                                                          ClipOval (
                                    child: CachedNetworkImage(
                                      imageUrl:
                                       "${Constants.SALESMAN_IMAGEPATH_URL}" +
                                              salesprofilecontroller
                                                  .salesprofilemodel!.data![0].image
                                                  .toString(),
                                                      
                                      fit: BoxFit.cover,
                                      width: 75,
                                      height: 75,
                                      placeholder: (context, url) => Center(
                                        child: CircularProgressIndicator(),
                                      ), // Replace with your own placeholder widget
                                      errorWidget: (context, url, error) => Icon(Icons
                                          .error), // Replace with your own error widget
                                    ),
                                  ),
                                ),
                    // Image.asset("assets/image/girl.png")
                                //  SvgPicture.asset("assets/image/girl.svg"),
                              ],
                            );
                          }),
                    ),
          
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    // GetBuilder<HomeSalesController>(
                    //   init: homesalecontroller,
                    //   builder: (_) {
                    //     return homesalecontroller.salesBannerModel == null
                    //         ? SizedBox()
                    //         : CarouselSlider.builder(
                    //             itemCount: homesalecontroller
                    //                 .salesBannerModel!.data!.length,
                    //             options: CarouselOptions(
                    //            viewportFraction: 1,
                    //               initialPage: 0,
                    //               enableInfiniteScroll: true,
                    //               reverse: false,
                    //               autoPlay: true,
                    //               autoPlayInterval: Duration(seconds: 3),
                    //               autoPlayAnimationDuration:
                    //                   Duration(milliseconds: 800),
                    //               autoPlayCurve: Curves.fastOutSlowIn,
                    //               enlargeCenterPage: true,
                    //             ),
                    //             itemBuilder: (context, index, realIdx) {
                    //               var item = homesalecontroller
                    //                   .salesBannerModel!.data![index];
          
                    //               var imagePath =
                    //                   "${Constants.BANNER_IMAGE_PATH}${item.image ?? ""}";
                    //               return Stack(
                    //                 children: [
                    //                   // Image.asset(item["image"]),
                    //                   Container(
                    //                     height: 140,
                    //                     child: CachedNetworkImage(
                    //                       imageUrl: imagePath,
                    //                       fit: BoxFit.cover,
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
              homesalecontroller == null? Center(
                                          child: SpinKitCircle(
                                            color: Colors
                                                .grey, // Color of the progress bar
                                            size:
                                                20.0, // Size of the progress bar
                                          ),
                                        ):
                
                     GetBuilder<HomeSalesController>(
                    init: homesalecontroller,
                    builder: (_) {
                    // List<dynamic> data = homeusercontroller.userBannerModel!.data!;
if(homesalecontroller.salesBannerModel == null){
  return Center(child: CircularProgressIndicator());
}
List<Banner.Datum> data = homesalecontroller.salesBannerModel!.data!;
List<Banner.Datum> filteredData = data.where((item) =>
    item.type == 'home_banner_1' ||
    item.type == 'home_banner_2' ||
    item.type == 'home_banner_3').toList();

List<Banner.Datum> filteredDataVideo = data.where((item) =>
    item.type == 'video' 
   ).toList();

    print("vvvvv***${filteredData.length}");

    GetStorage().write('videobannersales',filteredDataVideo[0].image) ;
    print(GetStorage().read('videobannersales') );
    print("kk");
    print("vvvvv***${filteredDataVideo[0].image}");
                      return  homesalecontroller. showLoading ?
                      Center(
                                          child: SpinKitCircle(
                                            color: Colors
                                                .grey, // Color of the progress bar
                                            size:
                                                20.0, // Size of the progress bar
                                          ),
                                        ):
                       homesalecontroller.salesBannerModel == null
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

   var item = filteredData[index];
   var imagePath = "${Constants.BANNER_IMAGE_PATH}${(item.image ?? '')}";
                               
                                return Stack(
                                  children: [
                                   
                                    Container(
                                      height: 140,
                                      child: CachedNetworkImage(
                                        imageUrl: imagePath, fit: BoxFit.cover,
                                     
                                        placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator(),
                                        ), // Replace with your own placeholder widget
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons
                                                .error), // Replace with your own error widget
                                      ),
                                    ),
                                   
                                  ],
                                );

                              });
                    },
                  ),

                 
                    
                    
                    // SizedBox(height: MediaQuery.of(context).size.height*0.02,),
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
                            child: TextFormField( onTap: () {
                            homesalecontroller.clearSearchData();
                            Get.to(SalesManSearchScreen());
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
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
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
                           
                          SalesManFilterController filtercontroller =
                              Get.put(SalesManFilterController());
                         
                          filtercontroller.loadDefaultData();
                          filtercontroller.clearFields();
                        
                          Get.to(SalesManFilterScreenUI());
                        Get.to(  FilterScreenWholeseller());
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
                            GetBuilder<HomeSalesController>(
                                init: homesalecontroller,
                                builder: (_) {
                                  return !homesalecontroller.categoryLoaded
                                      ? SizedBox()
                                      : ListView.builder(
                                          primary: false,
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemCount: homesalecontroller
                                              .salesCategoriesModel!.data!.length,
                                          itemBuilder: (context, index) {
                                            var item = homesalecontroller
                                                .salesCategoriesModel!
                                                .data![index];
                                            // print(item.name!);
                                            var imagePath =
                                                "${Constants.BASE_URL}${Constants.CATEGORIES_IMAGE_PATH}${item.image ?? ""}";
                                            print(imagePath);
                    
                                            return Padding(
                                              padding: const EdgeInsets.only(right:10.0),
                                              child: InkWell(
                                                onTap: () {
                                                  salessubcategorycontroller
                                                      .addproduct(item.id ?? 0);
                                                  salessubcategorycontroller.init();
                                                  // salessubcategorycontroller.productinit();
                                                     salessubcategorycontroller
                                                      .currentCategory(
                                                          item.name ?? "");
                                                   salessubcategorycontroller
                                                      .productInitByCategory();
                                                  Get.to(() => SalesAllcategory());
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        child: CachedNetworkImage(
                                                          imageUrl: imagePath,
                                                          width: 61,
                                                          height: 75,
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
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(item.name!,
                                                          style: CustomTextStyle
                                                              .popinssmall)
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
                                              ),
                                            );
                                          },
                                        );
                                }),
                          ],
                        ),
                      ),
                    ),
          
          //             SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //    child: Row(
          
          //     children: [
          //   Column(
          //     children: [
          //       Container(child: Image.asset("assets/image/dog.png",width: 61,
          // height: 75,)),
          
          // SizedBox(height: 10,),
          // Text("Dog",style:  CustomTextStyle.popinssmall)
          
          //     ],
          //   ),
          
          // SizedBox(width: 25,),
          
          //  Column(
          //    children: [
          //        Image.asset("assets/image/rabbit.png",width: 61,
          // height: 75,),
          // SizedBox(height: 10,),
          // Text("Rabbit",style:  CustomTextStyle.popinssmall)
          
          //    ],
          //  ),
          
          // SizedBox(width: 25,),
          
          //  Column(
          //    children: [
          //      Image.asset("assets/image/rat.png",width: 61,
          // height: 75,),
          // SizedBox(height: 10,),
          // Text("Hamster",style: CustomTextStyle.popinssmall)
          
          //    ],
          //  ),
          
          // SizedBox(width: 25,),
          
          //  Column(
          //    children: [
          //      Image.asset("assets/image/cat.png",width: 61,
          // height: 75),
          // SizedBox(height: 10,),
          // Text("Cat",style:  CustomTextStyle.popinssmall)
          
          //    ],
          //  ),
          
          //    ],),
          //  ),
          
                    // SizedBox(height: MediaQuery.of(context).size.height*0.03),
          
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
                    
                          InkWell(
                            onTap: () {
                              Get.to(SalesProductAlllistPage());
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
                        child: GetBuilder<HomeSalesController>(
                            init: homesalecontroller,
                            builder: (_) {
                              return homesalecontroller.salesPropertiesModel == null
                                  ? SizedBox()
                                  : homesalecontroller.propertyLoaded == null
                                      ? SizedBox()
                                      : Container(
                                          // height: 600,
                                          child: GridView.builder(
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,
                                                      crossAxisSpacing: 15.0,
                                                      mainAxisSpacing: 15.0,
                                                      mainAxisExtent: 285),
                                              itemCount: homesalecontroller
                                                  .salesPropertiesModel!
                                                  .data!
                                                  .length
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
                                                // itemCount: homeusercontroller
                                                //     .userPropertiesModel!.data!.length
                                                //     .clamp(0, 4),
                                                // itemBuilder: (BuildContext ctx, index) {
                      
                                                var item = homesalecontroller
                                                    .salesPropertiesModel!
                                                    .data![index];
                                                String imagePath = Constants
                                                        .PRODUCT_HOME_IMAGE_PATH +
                                                    "/${item.image!}";
                      
                                                // var imagePath =
                                                //     "${Constants.BASE_URL}${Constants.PRODUCT_IMAGE_PATH}${item.image ?? ""}";
                                                
                                                return InkWell(
                                                  onTap: () async {
                                                      salesProductDetailsController.dispose();
                                                    salesProductDetailsController
                                                        .viewproduct(
                                                      item.id ?? 0,
                                                    );
                                                    // print(
                                                    //     "productid${item.id ?? 0}");
                                                    await salesProductDetailsController
                                                        .init();

                                                          salesReviewController.reviewAdd(
                                                      item.id ?? 0, 0);

                                                await salesReviewController
                                                    .init();
                                                    Get.to(ProductDetailssale(id:item.id??0));
                                                    // Get.to( ProductDetails());
                                                    // Navigator.push(
                                                    //     context,
                                                    //     MaterialPageRoute(
                                                    //         builder: (context) =>
                                                    //           ));
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
                      
                      
                         GetBuilder<HomeSalesController>(
                        init: homesalecontroller,
                        builder: (_) {
                           return InkWell(
                                                              onTap: () {
                                                                homesalecontroller
                                                                    .fethUserId();
                                                                homesalecontroller
                                                                    .addItemToWishList(
                                                                        item.id!);
                                                                         

                                                            homesalecontroller.init();
                                                              },
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(8.0),
                                                                child: Align(
                                                                    alignment: Alignment
                                                                        .centerRight,
                                                                    child: Icon(homesalecontroller
                                                                            .wishListItemsId
                                                                            .contains(
                                                                                item
                                                                                    .id!)
                                                                        ? Icons.favorite
                                                                        : Icons
                                                                            .favorite_border,color:Colors.red)),
                                                              ),
                                                            );
                         }
                       ),
                      
                            //  InkWell(
                            //                                                 onTap: () {
                            //                                                   wholehomecontroller
                            //                                                       .addItemToWishList(
                            //                                                           item.id!);
                            //                                                 },
                            //                                                 child: Padding(
                            //                                                   padding:
                            //                                                       const EdgeInsets.all(
                            //                                                           8.0),
                            //                                                   child: Align(
                            //                                                       alignment: Alignment
                            //                                                           .centerRight,
                            //                                                       child: Icon(wholehomecontroller
                            //                                                               .wishListItemsId
                            //                                                               .contains(
                            //                                                                   item.id!)
                            //                                                           ? Icons.favorite
                            //                                                           : Icons
                            //                                                               .favorite_border,color:Colors.red)),
                            //                                                 ),
                            //                                               ),
                                      
                                                    
                                                    
                      
                      
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
                                                                Text(item.name!,
                                                                
                                                                                    maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                                                    style: CustomTextStyle
                                                                        .popinsmedium),
                                            Text(
  item.description!.length < 20
      ? item.description!
      : item.description!.substring(0, item.description!.length),
  maxLines: 1,
  overflow: TextOverflow.ellipsis,
  style: CustomTextStyle.popinssmall0,
),  SizedBox(height: 5),
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
                                                               
                                                                        // Row(
                                                                        //   children: [
                                                                        //     Text(
                                                                        //         "₹" +
                                                                        //             item.wholePrice.toString(),
                                                                        //         style: CustomTextStyle.discounttext),
                                                                        //     SizedBox(
                                                                        //         width:
                                                                        //             2),
                                                                        //     // Container(
                                                                        //     // height:
                                                                        //     //     20,
                                                                        //     // width: 48,
                                                                        //     // decoration: BoxDecoration(
                                                                        //     //     color: MyColors
                                                                        //     //         .red,
                                                                        //     //     borderRadius: BorderRadius.circular(
                                                                        //     //         10),
                                                                        //     //     border:
                                                                        //     //         Border.all(color: MyColors.red)),
                                                                        //     // child:
                                                                        //     //     Center(
                                                                        //     //   child:
                                                                        //      SizedBox(width:3),
                                                                        //     Text(
                                                                        //         // item.discount.toString(),
                                                                        //           "Save${double.parse(item.discount??'').toStringAsFixed(0)}%",
                                                                        //         style:
                                                                        //             CustomTextStyle.popinstextsmal2222red),
                                                                        //     //   ),
                                                                        //     // ),
                                                                        //   ],
                                                                        // ),
                                                                        
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
                                                                            GestureDetector(
                                                                                   onTap: () async{
                                                                                //  salesProductDetailsController.viewproductHome(
                                                                                //  item.id??0,item.name??'',"1kg",1 ,
                                                                                //  ((double.parse(item.wholePrice ?? '')) - ((double.parse(item.wholePrice ?? "")) *
                                                                                //   (double.parse(item.discount ?? "0")) / 100))
                                                                                //  ,item.image??'',"yes");

                                                                                  salesProductDetailsController.viewproductHome(item.id??0,item.name??'',"1kg",1,double.parse(item.wholePrice ?? ''),(item.image??'').toString(),"yes");
                                                                              
                                                                              await salesProductDetailsController.addProductHome();
                                                            mycartController.init();
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
                                             
                                               
                      
                      // Container(
                      //                                                 width: 140,
                      //                                                 // height: 700,
                      //                                                 decoration: BoxDecoration(
                      //                                                   borderRadius:
                      //                                                       BorderRadius.circular(25),
                      //                                                   color: MyColors.white,
                      //                                                   boxShadow: [
                      //                                                     BoxShadow(
                      //                                                       color: Colors.grey
                      //                                                           .withOpacity(0.3),
                      //                                                       spreadRadius: 3,
                      //                                                       blurRadius: 7,
                      //                                                       offset: Offset(0,
                      //                                                           3), // Offset of the shadow
                      //                                                     ),
                      //                                                   ],
                      //                                                   // color: MyColors.white
                      //                                                 ),
                      //                                                 child: Column(
                      //                                                   children: [
                      //                                                     InkWell(
                      //                                                       onTap: () {
                      //                                                         homesalecontroller
                      //                                                             .fethUserId();
                      //                                                         homesalecontroller
                      //                                                             .addItemToWishList(
                      //                                                                 item.id!);
                      //                                                       },
                      //                                                       child: Padding(
                      //                                                         padding:
                      //                                                             const EdgeInsets
                      //                                                                 .all(8.0),
                      //                                                         child: Align(
                      //                                                             alignment: Alignment
                      //                                                                 .centerRight,
                      //                                                             child: Icon(homesalecontroller
                      //                                                                     .wishListItemsId
                      //                                                                     .contains(
                      //                                                                         item
                      //                                                                             .id!)
                      //                                                                 ? Icons.favorite
                      //                                                                 : Icons
                      //                                                                     .favorite_border,color:Colors.red)),
                      //                                                       ),
                      //                                                     ),
                      
                      //                                                     Container(
                      //                                                       height: 125,
                      
                      //                                                       // decoration: BoxDecoration(
                      //                                                       //     borderRadius: BorderRadius.circular(30),
                      //                                                       //     color: MyColors.white),
                      //                                                       child: CachedNetworkImage(
                      //                                                         imageUrl: imagePath,
                      //                                                         // width: 61,
                      //                                                         // height: 75,
                      //                                                         placeholder:
                      //                                                             (context, url) =>
                      //                                                                 Center(
                      //                                                           child:
                      //                                                               CircularProgressIndicator(),
                      //                                                         ), // Replace with your own placeholder widget
                      //                                                         errorWidget: (context,
                      //                                                                 url, error) =>
                      //                                                             Icon(Icons
                      //                                                                 .error), // Replace with your own error widget
                      //                                                       ),
                      //                                                     ),
                      
                      //                                                     // SizedBox(height: 15,),
                      
                      //                                                     Container(
                      //                                                       // height: 140,
                      //                                                       child: Padding(
                      //                                                         padding:
                      //                                                             const EdgeInsets
                      //                                                                     .only(
                      //                                                                 left: 10.0,
                      //                                                                 right: 5,
                      //                                                                 top: 5),
                      //                                                         child: Column(
                      //                                                           mainAxisAlignment:
                      //                                                               MainAxisAlignment
                      //                                                                   .start,
                      //                                                           crossAxisAlignment:
                      //                                                               CrossAxisAlignment
                      //                                                                   .start,
                      //                                                           children: [
                      //                                                             Text(item.name!,
                      //                                                                 style: CustomTextStyle
                      //                                                                     .popinsmedium),
                      //                                                             Text(
                      //                                                                 item.description
                      //                                                                             .toString()
                      //                                                                             .length <
                      //                                                                         30
                      //                                                                     ? item
                      //                                                                         .description!
                      //                                                                     : item
                      //                                                                         .description!
                      //                                                                         .substring(
                      //                                                                             0,
                      //                                                                             19),
                      //                                                                 style: CustomTextStyle
                      //                                                                     .popinssmall0),
                      //                                                             SizedBox(height: 5),
                      //                                                             Row(
                      //                                                               mainAxisAlignment:
                      //                                                                   MainAxisAlignment
                      //                                                                       .spaceBetween,
                      //                                                               children: [
                      //                                                                 Column(
                      //                                                                   crossAxisAlignment:
                      //                                                                       CrossAxisAlignment
                      //                                                                           .start,
                      //                                                                   children: [
                      //                                                                     Row(
                      //                                                                       children: [
                      //                                                                         Text(
                      //                                                                             "₹" +
                      //                                                                                 item.wholePrice.toString(),
                      //                                                                             style: CustomTextStyle.discounttext),
                      //                                                                         SizedBox(
                      //                                                                             width:
                      //                                                                                 10),
                      //                                                                         Container(
                      //                                                                           height:
                      //                                                                               20,
                      //                                                                           width:
                      //                                                                               40,
                      //                                                                           decoration: BoxDecoration(
                      //                                                                               color: MyColors.red,
                      //                                                                               borderRadius: BorderRadius.circular(10),
                      //                                                                               border: Border.all(color: MyColors.red)),
                      //                                                                           child:
                      //                                                                               Center(
                      //                                                                             child: Text(
                      //                                                                                 // item.discount.toString(),
                      //                                                                                   "Save${double.parse(item.discount??'').toStringAsFixed(0)}%",
                      //                                                                                 style: CustomTextStyle.popinstextsmal2222),
                      //                                                                           ),
                      //                                                                         ),
                      //                                                                       ],
                      //                                                                     ),
                      //                                                                     SizedBox(
                      //                                                                         height:
                      //                                                                             5),
                      //                                                                     Text(
                      //                                                                       "₹ ${((double.parse(item.wholePrice ?? '')) - ((double.parse(item.wholePrice ?? "")) * (double.parse(item.discount ?? "0")) / 100)).toDouble()}",
                      
                      //                                                                       // "₹" +
                      //                                                                       //     item.wholePrice!,
                      //                                                                       style: CustomTextStyle
                      //                                                                           .popinsmedium,
                      //                                                                     ),
                      //                                                                   ],
                      //                                                                 ),
                      
                      //                                                                 Padding(
                      //                                                                   padding: const EdgeInsets
                      //                                                                           .only(
                      //                                                                       right:
                      //                                                                           5.0),
                      //                                                                   child: Container(
                      //                                                                       width: 35,
                      //                                                                       height: 35,
                      //                                                                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xffffcc00)),
                      //                                                                       child: Padding(
                      //                                                                         padding:
                      //                                                                             EdgeInsets.all(5.0),
                      //                                                                         child: Image
                      //                                                                             .asset(
                      //                                                                           "assets/image/bag2.png",
                      //                                                                           height:
                      //                                                                               25,
                      //                                                                         ),
                      //                                                                       )),
                      //                                                                 )
                      //                                                                 // Image.asset(
                      //                                                                 //   "assets/image/yellowbag.png",
                      //                                                                 //   height: 80,
                      //                                                                 // )
                      //                                                               ],
                      //                                                             )
                      //                                                           ],
                      //                                                         ),
                      //                                                       ),
                      //                                                     )
                      //                                                   ],
                      //                                                 ),
                      //                                               ),
                                                
                                                
                                                );
                                              }),
                                        );
                            }),
                      ),
                    ),
          
                    //  GetBuilder<HomeSalesController>(
                    //         init: homesalecontroller,
                    //         builder: (_) {
                    //           return homesalecontroller.propertyLoaded == null
                    //               ? SizedBox()
                    //               :
                    //             Container(
                    //                 // height: 600,
                    //                 child: GridView.builder(
                    //                     primary: false,
                    //                     shrinkWrap: true,
                    //                     scrollDirection: Axis.vertical,
                    //                     physics: NeverScrollableScrollPhysics(),
                    //                     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    //                         maxCrossAxisExtent: 150,
                    //                         // childAspectRatio: 3 / 2,
                    //                         mainAxisExtent: 265,
                    //                         crossAxisSpacing: 15,
                    //                         mainAxisSpacing: 15),
                    //                     itemCount: homesalecontroller
                    //                         .salesPropertiesModel!.data!.length
                    //                         .clamp(0, 4)
                    //                         ,
                    //                     itemBuilder: (BuildContext ctx, index) {
                    //                       var item = homesalecontroller
                    //                           .salesPropertiesModel!.data![index];
          
                    //                       var imagePath =
                    //                           "${Constants.BASE_URL}${Constants.PRODUCT_IMAGE_PATH}${item.image ?? ""}";
                    //                       print(imagePath);
                    //                       return InkWell(
                    //                         onTap: () {
                    //                           Navigator.push(
                    //                               context,
                    //                               MaterialPageRoute(
                    //                                   builder: (context) => ProductDetailssale(
                    //                                     itemdetails: item,
                    //                                   )));
                    //                         },
                    //                         child: Container(
                    //                           width: 140,
                    //                           // height: 700,
                    //                           decoration: BoxDecoration(
                    //                             borderRadius: BorderRadius.circular(25),
                    //                             color: MyColors.white,
                    //                             boxShadow: [
                    //                               BoxShadow(
                    //                                 color: Colors.grey.withOpacity(0.3),
                    //                                 spreadRadius: 3,
                    //                                 blurRadius: 7,
                    //                                 offset:
                    //                                     Offset(0, 3), // Offset of the shadow
                    //                               ),
                    //                             ],
                    //                             // color: MyColors.white
                    //                           ),
                    //                           child: Column(
                    //                             children: [
                    //                               Container(
                    //                                 height: 125,
          
                    //                                 // decoration: BoxDecoration(
                    //                                 //     borderRadius: BorderRadius.circular(30),
                    //                                 //     color: MyColors.white),
                    //                                 child: CachedNetworkImage(
                    //                                   imageUrl: imagePath,
                    //                                   width: 61,
                    //                                   height: 75,
                    //                                   placeholder: (context, url) => Center(
                    //                                     child: CircularProgressIndicator(),
                    //                                   ), // Replace with your own placeholder widget
                    //                                   errorWidget: (context, url, error) =>
                    //                                       Icon(Icons
                    //                                           .error), // Replace with your own error widget
                    //                                 ),
                    //                               ),
          
                    //                               // SizedBox(height: 15,),
          
                    //                               Container(
                    //                                 height: 145,
                    //                                 child: Padding(
                    //                                   padding: const EdgeInsets.only(
                    //                                       left: 10.0, right: 5, top: 5),
                    //                                   child: Column(
                    //                                     mainAxisAlignment:
                    //                                         MainAxisAlignment.start,
                    //                                     crossAxisAlignment:
                    //                                         CrossAxisAlignment.start,
                    //                                     children: [
                    //                                       Text(item.name!,
                    //                                           style:
                    //                                               CustomTextStyle.popinsmedium),
                    //                                       Text(item.description.toString(),
                    //                                           style:
                    //                                               CustomTextStyle.popinssmall0),
                    //                                       // SizedBox(height: 3),
          
                    //                                       Row(
                    //                                         mainAxisAlignment:
                    //                                             MainAxisAlignment.spaceBetween,
                    //                                         children: [
                    //                                           Text(
                    //                                             item.wholePrice!,
                    //                                             style: CustomTextStyle
                    //                                                 .popinsmedium,
                    //                                           ),
          
                    //                                           Padding(
                    //                                             padding: const EdgeInsets.only(
                    //                                                 right: 5.0),
                    //                                             child: Container(
                    //                                                 width: 35,
                    //                                                 height: 35,
                    //                                                 decoration: BoxDecoration(
                    //                                                     borderRadius:
                    //                                                         BorderRadius
                    //                                                             .circular(10),
                    //                                                     color:
                    //                                                         Color(0xffffcc00)),
                    //                                                 child: Padding(
                    //                                                   padding:
                    //                                                       EdgeInsets.all(5.0),
                    //                                                   child: Image.asset(
                    //                                                     "assets/image/bag2.png",
                    //                                                     height: 25,
                    //                                                   ),
                    //                                                 )),
                    //                                           )
                    //                                           // Image.asset(
                    //                                           //   "assets/image/yellowbag.png",
                    //                                           //   height: 80,
                    //                                           // )
                    //                                         ],
                    //                                       )
                    //                                     ],
                    //                                   ),
                    //                                 ),
                    //                               )
                    //                             ],
                    //                           ),
                    //                         ),
                    //                       );
                    //                     }),
                    //               );
                    //           }
                    //         ),
          
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          
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
                              Get.to(() => AllbrandPagesales(
                                data: homesalecontroller
                                              .salesBrandModel!.data!
                                              .where((element) =>
                                                  element.canine == 1)
                                              .toList()
                              ));
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
                      child: Center(
                        child: ListView(
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            GetBuilder<HomeSalesController>(
                                init: homesalecontroller,
                                builder: (_) {
                                  return homesalecontroller.salesBrandModel == null
                                    ? SizedBox()
                                    : ListView.builder(
                                          primary: false,
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemCount: homesalecontroller
                                              .salesBrandModel!.data!
                                              .where((element) =>
                                                  element.canine == 1)
                                              .toList()
                                              .length,
                                          itemBuilder: (context, index) {
                                            var item = homesalecontroller
                                                .salesBrandModel!.data!
                                                .where((element) =>
                                                    element.canine == 1)
                                                .toList()[index];
                                            // print(item.name!);
                                            var imagePath =
                                                "${Constants.BASE_URL}${Constants.BRAND_IMAGE_PATH}${item.image ?? ""}";
                                            var imageLogoPath =
                                                "${Constants.BASE_URL}${Constants.BRANDLOGO_IMAGE_PATH}${item.logo ?? ""}";
                                
                                            return InkWell(
                                              onTap:()
                                                async{
                                            // Ourbranddetailscontroller.addproduct(
                                            //     item.id ?? 0, item.logo ?? '');
                                            //  subcategorycontroller.addproduct(item.id??0) ;
                                salesOurBrandDetailsController
                                                  .addproduct(item.id ?? 0,item.title??'',
                                                      item.logo ?? '');
                                             
                                await salesOurBrandDetailsController.ourproductinit();
                                            Get.to(WholeSalesOurBrandDetails());
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
                                                            BorderRadius.circular(
                                                                30),
                                                        // color: MyColors.white
                                                      ),
                                                      child: Stack(
                                                        alignment:
                                                            Alignment.topCenter,
                                                        children: [
                                                          // SizedBox(height: 140,),
                                                          Container(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.6,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.46,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30),
                                                                color: Colors
                                                                    .transparent),
                                                            child: Column(
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .only(
                                                                          top:
                                                                              25.0),
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
                                                                  color: Colors
                                                                      .white
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
                    ),
          
                    //  SizedBox(height: MediaQuery.of(context).size.height*0.02),
          
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          
                    Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Shop By Brand",
                            style: CustomTextStyle.popinstext,
                          ),
                    
                          // Text("See All", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                    // 
                      
                          InkWell(
                            onTap: () {
                              Get.to(() => AllShopBrandPagesales(
                                data: homesalecontroller
                                              .salesBrandModel!.data!
                                              .where((element) =>
                                                  element.canine == 0)
                                              .toList()
                              ));
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
                    // Container(
                    //   height: 250,
                    //   width: MediaQuery.of(context).size.width,
                    //   child: ListView(
                    //     primary: false,
                    //     shrinkWrap: true,
                    //     scrollDirection: Axis.horizontal,
                    //     children: [
                    //       GetBuilder<HomeSalesController>(
                    //           init: homesalecontroller,
                    //           builder: (_) {
                    //             return homesalecontroller.salesBrandModel ==
                    //                     null
                    //                 ? SizedBox()
                    //                 : ListView.builder(
                    //                     primary: false,
                    //                     scrollDirection: Axis.horizontal,
                    //                     shrinkWrap: true,
                    //                     itemCount: homesalecontroller
                    //                         .salesBrandModel!.data!.length,
                    //                     itemBuilder: (context, index) {
                    //                       var item = homesalecontroller
                    //                           .salesBrandModel!.data![index];
                    //                       // print(item.name!);
                    //                       var imagePath =
                    //                           "${Constants.BASE_URL}${Constants.BRAND_IMAGE_PATH}${item.image ?? ""}";
                    //                       var imageLogoPath =
                    //                           "${Constants.BASE_URL}${Constants.BRANDLOGO_IMAGE_PATH}${item.logo ?? ""}";
                    //                       // print(imagePath);
                    //                       return InkWell(
                    //                         onTap: () {
                    //                           salesOurBrandDetailsController
                    //                               .addproduct(item.id ?? 0,
                    //                                   item.logo ?? '');
                    //                           Get.to(OrderDetailssales());
                    //                         },
                    //                         child: Padding(
                    //                           padding:
                    //                               const EdgeInsets.all(8.0),
                    //                           child: Column(
                    //                             children: [
                    //                               Container(
                    //                                 height:
                    //                                     MediaQuery.of(context)
                    //                                             .size
                    //                                             .width *
                    //                                         0.55,
                    //                                 width:
                    //                                     MediaQuery.of(context)
                    //                                             .size
                    //                                             .width *
                    //                                         0.46,
                    //                                 decoration: BoxDecoration(
                    //                                   borderRadius:
                    //                                       BorderRadius.circular(
                    //                                           30),
                    //                                   // color: MyColors.white
                    //                                 ),
                    //                                 child: Stack(
                    //                                   alignment:
                    //                                       Alignment.topCenter,
                    //                                   children: [
                    //                                     // SizedBox(height: 140,),
                    //                                     Container(
                    //                                       height: MediaQuery.of(
                    //                                                   context)
                    //                                               .size
                    //                                               .width *
                    //                                           0.6,
                    //                                       width: MediaQuery.of(
                    //                                                   context)
                    //                                               .size
                    //                                               .width *
                    //                                           0.46,
                    //                                       decoration: BoxDecoration(
                    //                                           borderRadius:
                    //                                               BorderRadius
                    //                                                   .circular(
                    //                                                       30),
                    //                                           color: Colors
                    //                                               .transparent),
                    //                                       child: Column(
                    //                                         children: [
                    //                                           Padding(
                    //                                             padding:
                    //                                                 const EdgeInsets
                    //                                                         .only(
                    //                                                     top:
                    //                                                         25.0),
                    //                                             child:
                    //                                                 Container(
                    //                                               decoration:
                    //                                                   BoxDecoration(
                    //                                                 borderRadius:
                    //                                                     BorderRadius.circular(
                    //                                                         30),
                    //                                                 gradient:
                    //                                                     LinearGradient(
                    //                                                   begin: Alignment
                    //                                                       .topCenter,
                    //                                                   end: Alignment
                    //                                                       .bottomCenter,
                    //                                                   colors: [
                    //                                                     Color(
                    //                                                         0xFFFFF0BA),
                    //                                                     Color.fromRGBO(
                    //                                                         252,
                    //                                                         233,
                    //                                                         166,
                    //                                                         0.00),
                    //                                                   ],
                    //                                                 ),
                    //                                               ),
                    //                                               child:
                    //                                                   CachedNetworkImage(
                    //                                                 imageUrl:
                    //                                                     imagePath,
                    //                                                 // width: 50,
                    //                                                 height: 135,
                    //                                                 placeholder:
                    //                                                     (context,
                    //                                                             url) =>
                    //                                                         Center(
                    //                                                   child:
                    //                                                       CircularProgressIndicator(),
                    //                                                 ), // Replace with your own placeholder widget
                    //                                                 errorWidget: (context,
                    //                                                         url,
                    //                                                         error) =>
                    //                                                     Icon(Icons
                    //                                                         .error), // Replace with your own error widget
                    //                                               ),
                    //                                             ),
                    //                                           ),
                    //                                           SizedBox(
                    //                                             height: 15,
                    //                                           ),
                    //                                           Text(item.title!,
                    //                                               style: CustomTextStyle
                    //                                                   .popinssmall0)
                    //                                         ],
                    //                                       ),
                    //                                     ),
                    //                                     Positioned(
                    //                                       top: 3,
                    //                                       child: Container(
                    //                                         height: 50,
                    //                                         width: 60,
                    //                                         decoration: BoxDecoration(
                    //                                             color: Colors
                    //                                                 .white
                    //                                                 .withOpacity(
                    //                                                     0.3),
                    //                                             borderRadius:
                    //                                                 BorderRadius
                    //                                                     .circular(
                    //                                                         20)),
                    //                                         child:
                    //                                             // Image.asset(
                    //                                             //   item["logo"],
                    //                                             //   height: 50,
                    //                                             // ),
                    //                                             CachedNetworkImage(
                    //                                           imageUrl:
                    //                                               imageLogoPath,
                    //                                           // width: 50,
                    //                                           height: 50,
                    //                                           placeholder:
                    //                                               (context,
                    //                                                       url) =>
                    //                                                   Center(
                    //                                             child:
                    //                                                 CircularProgressIndicator(),
                    //                                           ), // Replace with your own placeholder widget
                    //                                           errorWidget: (context,
                    //                                                   url,
                    //                                                   error) =>
                    //                                               Icon(Icons
                    //                                                   .error), // Replace with your own error widget
                    //                                         ),
                    //                                       ),
                    //                                     )
                    //                                   ],
                    //                                 ),
                    //                               ),
                    //                             ],
                    //                           ),
                    //                           //  Stack(
                    //                           //   children: [
                    //                           //     Container(
                    //                           //       width: 69,
                    //                           //       height: 75,
                    //                           //       decoration: BoxDecoration(
                    //                           //         borderRadius: BorderRadius.circular(23),
                    //                           //         color: item,
                    //                           //         boxShadow: [
                    //                           //           BoxShadow(
                    //                           //             color: Colors.grey.withOpacity(0.3),
                    //                           //             spreadRadius: 2,
                    //                           //             blurRadius: 5,
                    //                           //             offset: Offset(
                    //                           //                 0, 3), // Offset of the shadow
                    //                           //           ),
                    //                           //         ],
                    //                           //       ),
                    //                           //     ),
                    //                           //   ],
                    //                           // )
                    //                         ),
                    //                       );
                    //                     },
                    //                   );
                    //           }),
                    //     ],
                    //   ),
                    // ),
                   
                    Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          GetBuilder<HomeSalesController>(
                              init: homesalecontroller,
                              builder: (_) {
                                return homesalecontroller.salesBrandModel ==
                                        null
                                    ? SizedBox()
                                    : ListView.builder(
                                        primary: false,
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                         itemCount: homesalecontroller
                                            .salesBrandModel!.data!
                                            .where((element) =>
                                                element.canine == 0)
                                            .toList()
                                            .length,
                                        itemBuilder: (context, index) {
                                          var item = homesalecontroller
                                              .salesBrandModel!.data!
                                              .where((element) =>
                                                  element.canine == 0)
                                              .toList()[index];
                                          // print(item.name!);
                                          var imagePath =
                                              "${Constants.BASE_URL}${Constants.BRAND_IMAGE_PATH}${item.image ?? ""}";
                                          var imageLogoPath =
                                              "${Constants.BASE_URL}${Constants.BRANDLOGO_IMAGE_PATH}${item.logo ?? ""}";
                                          // print(imagePath);
                                          return InkWell(
                                            onTap: () {
                                              salesOurBrandDetailsController
                                                  .addproduct(item.id ?? 0,item.title??'',
                                                      item.logo ?? '');
                                              Get.to(SalesOurBrandDetails());
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.65,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.46,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      // color: MyColors.white
                                                    ),
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      children: [
                                                        // SizedBox(height: 140,),
                                                        Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.6,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.46,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                              color: Colors
                                                                  .transparent),
                                                          child: Column(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            30.0,),
                                                                child:
                                                                    Container(
                                                                       height: 145,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
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
                                                                    height: 145,
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
                                                          top: 1,
                                                          child: Container(
                                                            height: 50,
                                                            width: 60,
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .white
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
                   
                   
                    Padding( padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Toys",
                            style: CustomTextStyle.popinstext,
                          ),
                    
                          // Text("See All", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                    
                          InkWell(
                            onTap: () {
                           salessubcategorycontroller.producttoys() ;
                              Get.to(SalesAlltoyPage());
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
                      child: GetBuilder<SalesSubCategoryController>(
                          init: salessubcategorycontroller,
                          builder: (_) {
                            return
                            salessubcategorycontroller.salestoyModel == null ||
                                salessubcategorycontroller.salestoyModel!.data ==
                                    null ||
                                salessubcategorycontroller
                                    .salestoyModel!.data!.isEmpty
                            ? SizedBox()
                            :
                             GridView.builder(
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 15.0,
                                        mainAxisSpacing: 15.0,
                                        mainAxisExtent:300),
                                      itemCount: salessubcategorycontroller
                                      .combinedList.length
                                          .clamp(0, 4),
                                itemBuilder: (BuildContext ctx, index) {
                                  var item = salessubcategorycontroller
                                      .combinedList[index];
                    print("ndjnd${item}");
                                  var imagePath =
                                      "${Constants.BASE_URL}/storage/app/public/product/${item.image ?? ""}";
                                  return salessubcategorycontroller
                                                  .salestoyModel ==
                                              null ||
                                          salessubcategorycontroller
                                                  .salestoyModel!.data ==
                                              null  
                                      ? SizedBox()
                                      : 
                                      
                                                      InkWell(
                    
                    onTap: ()async{
                       salesProductDetailsController
                                                      .viewproduct(
                                                    item.id ?? 0,
                                                  );
                                                  print(
                                                      "productid${item.id ?? 0}");
                                                  await salesProductDetailsController
                                                      .init();
                                                  Get.to(ProductDetailssale());
                    },                                                      child: Container(
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
                                                      
                                                      
                                                         GetBuilder<HomeSalesController>(
                                                                          init: homesalecontroller,
                                                                          builder: (_) {
                                                           return InkWell(
                                                              onTap: () {
                                                                homesalecontroller
                                                                    .fethUserId();
                                                                homesalecontroller
                                                                    .addItemToWishList(
                                                                        item.id!);
                                                                        homesalecontroller.init();
                                                              },
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(8.0),
                                                                child: Align(
                                                                    alignment: Alignment
                                                                        .centerRight,
                                                                    child: Icon(homesalecontroller
                                                                            .wishListItemsId
                                                                            .contains(
                                                                                item
                                                                                    .id!)
                                                                        ? Icons.favorite
                                                                        : Icons
                                                                            .favorite_border,color:Colors.red)),
                                                              ),
                                                            );
                                                         }
                                                       ),
                                                      
                                                            //  InkWell(
                                                            //                                                 onTap: () {
                                                            //                                                   wholehomecontroller
                                                            //                                                       .addItemToWishList(
                                                            //                                                           item.id!);
                                                            //                                                 },
                                                            //                                                 child: Padding(
                                                            //                                                   padding:
                                                            //                                                       const EdgeInsets.all(
                                                            //                                                           8.0),
                                                            //                                                   child: Align(
                                                            //                                                       alignment: Alignment
                                                            //                                                           .centerRight,
                                                            //                                                       child: Icon(wholehomecontroller
                                                            //                                                               .wishListItemsId
                                                            //                                                               .contains(
                                                            //                                                                   item.id!)
                                                            //                                                           ? Icons.favorite
                                                            //                                                           : Icons
                                                            //                                                               .favorite_border,color:Colors.red)),
                                                            //                                                 ),
                                                            //                                               ),
                                                                        
                                                                                                      
                                                                                                      
                                                      
                                                      
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
                                                                Text(item.name!,
                                                                                    maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                                                    style: CustomTextStyle
                                                                        .popinsmedium),
                                                                                                                     Text(
  item.description!.length < 20
      ? item.description!
      : item.description!.substring(0, item.description!.length),
  maxLines: 1,
  overflow: TextOverflow.ellipsis,
  style: CustomTextStyle.popinssmall0,
), 
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
                                                                        // Row(
                                                                        //   children: [
                                                                        //     Text(
                                                                        //         "₹" +
                                                                        //             item.wholePrice.toString(),
                                                                        //         style: CustomTextStyle.discounttext),
                                                                        //     SizedBox(
                                                                        //         width:
                                                                        //             2),
                                                                        //     // Container(
                                                                        //     // height:
                                                                        //     //     20,
                                                                        //     // width: 48,
                                                                        //     // decoration: BoxDecoration(
                                                                        //     //     color: MyColors
                                                                        //     //         .red,
                                                                        //     //     borderRadius: BorderRadius.circular(
                                                                        //     //         10),
                                                                        //     //     border:
                                                                        //     //         Border.all(color: MyColors.red)),
                                                                        //     // child:
                                                                        //     //     Center(
                                                                        //     //   child:
                                                                        //      SizedBox(width:3),
                                                                        //     Text(
                                                                        //         // item.discount.toString(),
                                                                        //           "Save${double.parse(item.discount??'').toStringAsFixed(0)}%",
                                                                        //         style:
                                                                        //             CustomTextStyle.popinstextsmal2222red),
                                                                        //     //   ),
                                                                        //     // ),
                                                                        //   ],
                                                                        // ),
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
                                                                                        salesProductDetailsController.viewproductHome(item.id??0,item.name??'',"1kg",1,double.parse(item.wholePrice ?? ''),(item.image??'').toString(),"yes");
                                                                              
                                                                                        await salesProductDetailsController.addProductHome();
                                                                                     mycartController.init();
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
                                                      );
                                           
                                      // Container(
                                      //     // height:
                                      //     //     MediaQuery.of(context).size.width *
                                      //     //         0.7,
                                      //     // width: MediaQuery.of(context).size.width * 0.46,
                                      //     decoration: BoxDecoration(
                                      //       borderRadius:
                                      //           BorderRadius.circular(25),
                                      //       color: MyColors.white,
                                      //       boxShadow: [
                                      //         BoxShadow(
                                      //           color:
                                      //               Colors.grey.withOpacity(0.3),
                                      //           spreadRadius: 3,
                                      //           blurRadius: 7,
                                      //           offset: Offset(
                                      //               0, 3), // Offset of the shadow
                                      //         ),
                                      //       ],
                                      //     ),
                                      //     child: Column(
                                      //       children: [
                                      //         Stack(
                                      //           children: [
                                      //             Container(
                                      //               height: 125,
                    
                                      //               // decoration: BoxDecoration(
                                      //               //     borderRadius: BorderRadius.circular(30),
                                      //               //     color: MyColors.white),
                                      //               child: Center(
                                      //                 child: CachedNetworkImage(
                                      //                   imageUrl: imagePath,
                                      //                   // width: 61,
                                      //                   // height: 75,
                                      //                   placeholder:
                                      //                       (context, url) =>
                                      //                           Center(
                                      //                     child:
                                      //                         CircularProgressIndicator(),
                                      //                   ), // Replace with your own placeholder widget
                                      //                   errorWidget: (context,
                                      //                           url, error) =>
                                      //                       Icon(Icons
                                      //                           .error), // Replace with your own error widget
                                      //                 ),
                                      //               ),
                                      //             ),
                                      //             InkWell(
                                      //               onTap: () {
                                      //                 homesalecontroller
                                      //                     .addItemToWishList(
                                      //                         homesalecontroller
                                      //                             .salesPropertiesModel!
                                      //                             .data![index]
                                      //                             .id!);
                                      //               },
                                      //               child: Padding(
                                      //                 padding:
                                      //                     const EdgeInsets.all(
                                      //                         8.0),
                                      //                 child: Align(
                                      //                     alignment:
                                      //                         Alignment.topRight,
                                      //                     child: Icon(homesalecontroller
                                      //                             .wishListItemsId
                                      //                             .contains(homesalecontroller
                                      //                                 .salesPropertiesModel!
                                      //                                 .data![
                                      //                                     index]
                                      //                                 .id!)
                                      //                         ? Icons.favorite
                                      //                         : Icons
                                      //                             .favorite_border,color:Colors.red)),
                                      //               ),
                                      //             ),
                                      //           ],
                                      //         ),
                    
                                      //         // SizedBox(height: 15,),
                    
                                      //         Padding(
                                      //           padding:
                                      //               const EdgeInsets.all(5.0),
                                      //           child: Column(
                                      //             mainAxisAlignment:
                                      //                 MainAxisAlignment.start,
                                      //             crossAxisAlignment:
                                      //                 CrossAxisAlignment.start,
                                      //             children: [
                                      //               Text(item.name ?? '',
                                      //                   style: CustomTextStyle
                                      //                       .popinsmedium),
                                      //               Text(
                                      //                   item.description
                                      //                       .toString(),
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
                                      //                               item.wholePrice ??
                                      //                                   '',
                                      //                               style: CustomTextStyle
                                      //                                   .discounttext),
                                      //                           SizedBox(
                                      //                               width: 10),
                                      //                           Container(
                                      //                             height: 18,
                                      //                             width: 40,
                                      //                             decoration: BoxDecoration(
                                      //                                 color:
                                      //                                     MyColors
                                      //                                         .red,
                                      //                                 borderRadius:
                                      //                                     BorderRadius.circular(
                                      //                                         10),
                                      //                                 border: Border.all(
                                      //                                     color: MyColors
                                      //                                         .red)),
                                      //                             child: Center(
                                      //                               child: Text(
                                      //                                   // item.discount.toString(),
                                      //                                   "Save${item.discount ?? ''}",
                                      //                                   style: CustomTextStyle
                                      //                                       .popinstextsmal2222),
                                      //                             ),
                                      //                           ),
                                      //                         ],
                                      //                       ),
                                      //                       SizedBox(height: 5),
                                      //                       Text(
                                      //                         "₹ ${((double.parse(item.wholePrice ?? '')) - ((double.parse(item.wholePrice ?? "")) * (double.parse(item.discount ?? "")) / 100)).toDouble()}",
                    
                                      //                         // "₹ ${((int.parse(item.wholePrice ?? '0')) - ( (int.parse(item.wholePrice ?? "0"))*(int.parse(item.discount ?? "0")) / 100)).toString()}",
                                      //                         // "₹ ${((item.wholePrice!) -((item.wholePrice!)*(item.discount!))/100).toString()}",
                                      //                         style: CustomTextStyle
                                      //                             .popinsmedium,
                                      //                       ),
                                      //                     ],
                                      //                   ),
                                      //                   Padding(
                                      //                     padding:
                                      //                         const EdgeInsets
                                      //                                 .only(
                                      //                             right: 5.0),
                                      //                     child: Container(
                                      //                         width: 35,
                                      //                         height: 35,
                                      //                         decoration: BoxDecoration(
                                      //                             borderRadius:
                                      //                                 BorderRadius
                                      //                                     .circular(
                                      //                                         10),
                                      //                             color: Color(
                                      //                                 0xffffcc00)),
                                      //                         child: Padding(
                                      //                           padding:
                                      //                               EdgeInsets
                                      //                                   .all(5.0),
                                      //                           child:
                                      //                               Image.asset(
                                      //                             "assets/image/bag2.png",
                                      //                             height: 25,
                                      //                           ),
                                      //                         )),
                                      //                   )
                                      //                 ],
                                      //               )
                                      //             ],
                                      //           ),
                                      //         )
                                      //       ],
                                      //     ),
                                      //   );
                               
                               
                                });
                          }),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          
                    Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Product By Partner",
                            style: CustomTextStyle.popinstext,
                          ),
                    
                          // Text("See All", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                    
                          InkWell(
                            onTap: () {
                              Get.to(SalesProdctbybrandPage());
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
                    Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        child: ListView(
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            GetBuilder<HomeSalesController>(
                                init: homesalecontroller,
                                builder: (_) {
                                  return !homesalecontroller.partnerLoaded
                                      ? SizedBox()
                                      : ListView.builder(
                                          primary: false,
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemCount: homesalecontroller
                                              .salesProductPartnerModel!
                                              .data!
                                              .length,
                                          itemBuilder: (context, index) {
                                            var item = homesalecontroller
                                                .salesProductPartnerModel!
                                                .data![index];
                    
                                            // print(item.name!);
                                            var imagePath =
                                                "${Constants.BASE_URL}/storage/app/public/store/cover/${item.coverPhoto ?? ""}";
                                            var imageLogoPath =
                                                "${Constants.BASE_URL}/storage/app/public/store/${item.logo ?? ""}";
                    
                                            return InkWell(
                                              onTap: ()async {
                                                homesalecontroller
                                                    .viewpartner(item.id ?? 0);
                                                await homesalecontroller
                                                    .partnerIteminit();
                                                Get.to(SalesProductByPartnerDetails(


                                                  name: item.name??"" ,
address: item.address??'',
mobileno: item.phone??'',
email: item.email??''
                                                ));
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
                                                            BorderRadius.circular(
                                                                30),
                                                        // color: MyColors.white
                                                      ),
                                                      child: Stack(
                                                        alignment:
                                                            Alignment.topCenter,
                                                        children: [
                                                          // SizedBox(height: 140,),
                                                          Container(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.6,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.46,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30),
                                                                color: Colors
                                                                    .transparent),
                                                            child: Column(
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .only(
                                                                          top:
                                                                              25.0),
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
                                                                Text(item.name!,
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
                                                                  color: Colors
                                                                      .white
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
                    ),
          
                    // Container(
                    //   height: 250,
                    //   width: MediaQuery.of(context).size.width,
                    //   child: ListView(
                    //     primary: false,
                    //     shrinkWrap: true,
                    //     scrollDirection: Axis.horizontal,
                    //     children: [
                    //       GetBuilder<HomeSalesController>(
                    //           init: homesalecontroller,
                    //           builder: (_) {
                    //             return !homesalecontroller.categoryLoaded
                    //                 ? SizedBox()
                    //                 : ListView.builder(
                    //                     primary: false,
                    //                     scrollDirection: Axis.horizontal,
                    //                     shrinkWrap: true,
                    //                     itemCount:
                    //                         homesalecontroller.getOurBrandList.length,
                    //                     itemBuilder: (context, index) {
                    //                       var item =
                    //                           homesalecontroller.getOurBrandList[index];
                    //                       // print(item.name!);
                    //                       // var imagePath =
                    //                       //     "${Constants.BASE_URL}${Constants.CATEGORIES_IMAGE_PATH}${item.image ?? ""}";
                    //                       // print(imagePath);
          
                    //                       return Padding(
                    //                         padding: const EdgeInsets.all(8.0),
                    //                         child: Column(
                    //                           children: [
                    //                             Container(
                    //                               height: MediaQuery.of(context)
                    //                                       .size
                    //                                       .width *
                    //                                   0.63,
                    //                               width: MediaQuery.of(context)
                    //                                       .size
                    //                                       .width *
                    //                                   0.46,
                    //                               decoration: BoxDecoration(
                    //                                 borderRadius:
                    //                                     BorderRadius.circular(30),
                    //                                 // color: MyColors.white
                    //                               ),
                    //                               child: Stack(
                    //                                 alignment: Alignment.topCenter,
                    //                                 children: [
                    //                                   // SizedBox(height: 140,),
                    //                                   Container(
                    //                                     height: MediaQuery.of(context)
                    //                                             .size
                    //                                             .width *
                    //                                         0.6,
                    //                                     width: MediaQuery.of(context)
                    //                                             .size
                    //                                             .width *
                    //                                         0.46,
                    //                                     decoration: BoxDecoration(
                    //                                         borderRadius:
                    //                                             BorderRadius.circular(
                    //                                                 30),
                    //                                         color: Colors.transparent),
                    //                                     child: Column(
                    //                                       children: [
                    //                                         Padding(
                    //                                           padding:
                    //                                               const EdgeInsets.only(
                    //                                                   top: 25.0),
                    //                                           child: Container(
                    //                                             decoration:
                    //                                                 BoxDecoration(
                    //                                               borderRadius:
                    //                                                   BorderRadius
                    //                                                       .circular(30),
                    //                                               gradient:
                    //                                                   LinearGradient(
                    //                                                 begin: Alignment
                    //                                                     .topCenter,
                    //                                                 end: Alignment
                    //                                                     .bottomCenter,
                    //                                                 colors: [
                    //                                                   Color(0xFFFFF0BA),
                    //                                                   Color.fromRGBO(
                    //                                                       252,
                    //                                                       233,
                    //                                                       166,
                    //                                                       0.00),
                    //                                                 ],
                    //                                               ),
                    //                                             ),
                    //                                             child: Image.asset(
                    //                                                 item["image"],
                    //                                                 fit: BoxFit.cover,
                    //                                                 height: 135),
                    //                                           ),
                    //                                         ),
                    //                                         SizedBox(
                    //                                           height: 15,
                    //                                         ),
                    //                                         Text(item["title"],
                    //                                             style: CustomTextStyle
                    //                                                 .popinssmall0)
                    //                                       ],
                    //                                     ),
                    //                                   ),
          
                    //                                   Positioned(
                    //                                     top: 3,
                    //                                     child: Container(
                    //                                         height: 50,
                    //                                         width: 60,
                    //                                         decoration: BoxDecoration(
                    //                                             color: Colors.white
                    //                                                 .withOpacity(0.3),
                    //                                             borderRadius:
                    //                                                 BorderRadius
                    //                                                     .circular(20)),
                    //                                         child: Image.asset(
                    //                                           item["logo"],
                    //                                           height: 50,
                    //                                         )),
                    //                                   )
                    //                                 ],
                    //                               ),
                    //                             ),
                    //                           ],
                    //                         ),
          
                    //                         //  Stack(
                    //                         //   children: [
                    //                         //     Container(
                    //                         //       width: 69,
                    //                         //       height: 75,
                    //                         //       decoration: BoxDecoration(
                    //                         //         borderRadius: BorderRadius.circular(23),
                    //                         //         color: item,
                    //                         //         boxShadow: [
                    //                         //           BoxShadow(
                    //                         //             color: Colors.grey.withOpacity(0.3),
                    //                         //             spreadRadius: 2,
                    //                         //             blurRadius: 5,
                    //                         //             offset: Offset(
                    //                         //                 0, 3), // Offset of the shadow
                    //                         //           ),
                    //                         //         ],
                    //                         //       ),
                    //                         //     ),
                    //                         //   ],
                    //                         // )
                    //                       );
                    //                     },
                    //                   );
                    //           }),
                    //     ],
                    //   ),
                    // ),
          
          //                  Row(
          //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //    children: [
          //      Text(
          //        "Services",
          //        style:
          //       CustomTextStyle.popinstext,
          //      ),
          
          //      // Text("See All", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
          
          //   InkWell(onTap: (){
          //     Get.to(Allservicepagesales());
          //   },
          //     child: Text(
          //                  'See All',
          //                  style: TextStyle(
          //       color:MyColors.bgcolor,
          //       fontSize: 14,
          //        fontWeight: FontWeight.w500,
          //       fontFamily: "Poppins"
          //     )
          
          //        ),
          //   ),
          //    ],
          //  ),
          
          //  SizedBox(height: MediaQuery.of(context).size.height*0.02),
          
          //  GetBuilder<HomeSalesController>(
          //                           init: homesalecontroller,
          //                           builder: (_) {
          // return  Container(
          //                             // height: 600,
          //                             child: GridView.builder(
          //                                 primary: false,
          //                                 shrinkWrap: true,
          //                                 scrollDirection: Axis.vertical,
          //                                 physics: NeverScrollableScrollPhysics(),
          //                                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //                                     crossAxisCount: 4,
          //                                     //  childAspectRatio: 4 / 4,
          //                                     crossAxisSpacing: 15,
          
          //                       mainAxisSpacing: 15,
          //                       mainAxisExtent: 100),
          //                                 itemCount: homesalecontroller
          //                                     .getServiceList!.length
          
          //                                     ,
          //                                 itemBuilder: (BuildContext ctx, index) {
          //       var item = homesalecontroller.
          //                                        getServiceList[index];
          //                                   return
          //                                     Column(
          //                       children: [
          //                         Container(
          //                           height: 60,
          //                           width: 60,
          //                           decoration: BoxDecoration(
          //                               border: Border.all(color: Colors.black26, width: 1),
          //                               borderRadius: BorderRadius.circular(25),
          //                               color: MyColors.white),
          //                         ),
          //                         Text(
          //                          item["title"],
          //                           style: CustomTextStyle.popinssmall0,
          //                         )
          //                       ],
          //                     );
          //   //
          //                                 }));
          
          //   // // GridView(
          //   //             physics: NeverScrollableScrollPhysics(),
          //   //             scrollDirection: Axis.vertical,
          //   //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //   //                 crossAxisCount: 4,
          //   //                 crossAxisSpacing: 15,
          //   //                 mainAxisSpacing: 15,
          //   //                 mainAxisExtent: 100),
          //   //             children: [
          //   //               Column(
          //   //                 children: [
          //   //                   Container(
          //   //                     height: 60,
          //   //                     width: 60,
          //   //                     decoration: BoxDecoration(
          //   //                         border: Border.all(color: Colors.black26, width: 1),
          //   //                         borderRadius: BorderRadius.circular(25),
          //   //                         color: MyColors.white),
          //   //                   ),
          //   //                   Text(
          //   //                     "Brush",
          //   //                     style: CustomTextStyle.popinssmall0,
          //   //                   )
          //   //                 ],
          //   //               ),
          //   //               Column(
          //   //                 children: [
          //   //                   Container(
          //   //                     height: 60,
          //   //                     width: 60,
          //   //                     decoration: BoxDecoration(
          //   //                         border: Border.all(color: Colors.black26, width: 1),
          //   //                         borderRadius: BorderRadius.circular(25),
          //   //                         color: MyColors.white),
          //   //                   ),
          //   //                   Text(
          //   //                     "Nail Cutter",
          //   //                     style: CustomTextStyle.popinssmall0,
          //   //                   )
          //   //                 ],
          //   //               ),
          //   //               Column(
          //   //                 children: [
          //   //                   Container(
          //   //                     height: 60,
          //   //                     width: 60,
          //   //                     decoration: BoxDecoration(
          //   //                         border: Border.all(color: Colors.black26, width: 1),
          //   //                         borderRadius: BorderRadius.circular(25),
          //   //                         color: MyColors.white),
          //   //                   ),
          //   //                   Text(
          //   //                     "Comb",
          //   //                     style: CustomTextStyle.popinssmall0,
          //   //                   )
          //   //                 ],
          //   //               ),
          //   //               Column(
          //   //                 children: [
          //   //                   Container(
          //   //                     height: 60,
          //   //                     width: 60,
          //   //                     decoration: BoxDecoration(
          //   //                         border: Border.all(color: Colors.black26, width: 1),
          //   //                         borderRadius: BorderRadius.circular(25),
          //   //                         color: MyColors.white),
          //   //                   ),
          //   //                   Text(
          //   //                     "Slicker",
          //   //                     style: CustomTextStyle.popinssmall0,
          //   //                   )
          //   //                 ],
          //   //               ),
          //   //             ],
          //   //             padding: EdgeInsets.all(5),
          //   //             shrinkWrap: true,
          //   //           );
          
          //                           })
                  ],
                ),
                Container(
                  color: Color(0xfffffae8),
                  // width: 100,
                  height: 90,
                  child: ListView(
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      GetBuilder<SalesMyCartController>(
                          init: mycartController,
                          builder: (_) {
                            return ListView.builder(
                              primary: false,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount:
                                  mycartController.mycartmodel!.data!.length,
                              itemBuilder: (context, index) {
                                var item =
                                    mycartController.mycartmodel!.data![index];
                                String imagePath =
                                    Constants.PRODUCT_HOME_IMAGE_PATH +
                                        "/${item.image!}";
          
                                return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: 69,
                                          height: 75,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(23),
                                            // color: item,
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    Colors.grey.withOpacity(0.3),
                                                spreadRadius: 2,
                                                blurRadius: 5,
                                                offset: Offset(
                                                    0, 3), // Offset of the shadow
                                              ),
                                            ],
                                          ),
                                        ),
                                        Stack(
                                          children: [
                                            CachedNetworkImage(
                                              imageUrl: imagePath,
                                              width: 65,
                                              height: 95,
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
                                            // Image.asset(
                                            //   "assets/image/image-removebg-preview.png",
                                            //   width: 67,
                                            //   height: 67,
                                            // ),
                                            Positioned(
                                              right: -0,
                                              top: 0,
                                              child: GestureDetector(
                                                onTap: () async {
                                                  mycartController
                                                      .additem(item.id ?? 0);
                                                  print("Item${item.id}");
                                                  await mycartController
                                                      .initdelete();
                                                  mycartController.init();
                                                },
                                                child: Container(
                                                  width: 19,
                                                  height: 19,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(13),
                                                    color: Color(0xffffcc00),
                                                  ),
                                                  child: Icon(
                                                    Icons.close,
                                                    size: 15,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            // Container(
                                            //   width: 10.796609878540039,
                                            //   height: 0,
                                            // ),
                                            // Container(
                                            //   width: 0,
                                            //   height: 10.796609878540039,
                                            // )
                                          ],
                                        ),
                                      ],
                                    ));
                              },
                            );
                          }),
                      InkWell(
                        onTap: () {
                          Get.to(AddToCardSales());
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            width: 69,
                            // height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(23),
                              color: Colors.yellow,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3), // Offset of the shadow
                                ),
                              ],
                            ),
                            child: Icon(Icons.shopping_cart),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

          // GetBuilder<HomeSalesController>(
          //     init: homesalecontroller,
          //     builder: (_) {
          //       return homesalecontroller.showLoading
          //           ? BackdropFilter(
          //               filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          //               child: Container(
          //                 color: Colors.black
          //                     .withOpacity(0.1), // Adjust the opacity as needed
          //               ),
          //             )
          //           : SizedBox();
          //     }),
          // // Progress bar
          // GetBuilder<HomeSalesController>(
          //     init: homesalecontroller,
          //     builder: (_) {
          //       return homesalecontroller.showLoading
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
