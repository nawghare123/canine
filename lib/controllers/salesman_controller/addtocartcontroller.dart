import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/controllers/salesman_controller/addresscontroller.dart';
import 'package:pet/controllers/salesman_controller/productdetails_controller.dart';
import 'package:pet/controllers/salesman_controller/salescoupons_controller.dart';
import 'package:pet/controllers/wholesaler_controller/addtocartcontroller.dart';
import 'package:pet/models/salesmanModel/addAddressModel.dart';

import 'package:pet/models/salesmanModel/addressdeleteModel.dart';
import 'package:pet/models/salesmanModel/salesmycartListModel.dart';
import 'package:pet/models/salesmanModel/salesmycartlistdeleteModel.dart';

import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';
import 'package:http/http.dart' as http;

class SalesMyCartController extends GetxController {
  final storage = GetStorage();
  SalesCouponsController couponsController = Get.put(SalesCouponsController());
  SalesAddressController addressController = Get.put(SalesAddressController());
var wholesellerID;
var sellerId = GetStorage().read("sellerid");
// int? itemID;
  int? additemid;
  int? disCount;
  int? addressid;
  int? price;
// var sizecount = 0;
  List sizes = [];
  bool showLoading = false;
//  var wholesellerID;
  double total = 0.0;
  
  int totalprice = 0;
  String? paymenttype;
  String? paymentStatus;
  String? orderStatus;
  int? isselected1;
    String? paymentdays1;
  String? paymentmethod1;
  bool? gst1;
   int? selectID;
  int? selectqty;
  String? selectname;
  int? selecttex;
  double? selectprice;
  int? selectdis;
  var tex;
  List<Map<String, dynamic>> cartList = [];
// void  incrementSize(){
// sizes[]++;
//     update();
//   }
  int? isselected;

  void additem(int id) {
    additemid = id;
    update();
    print("ID${additemid}");
  }

  void selectaddadress(int id) {
    addressid = id;
    update();
    print("ID${addressid}");
  }

//  void productsizes(List sizedproduct) {
//     sizes = sizedproduct;
//     update();
//     print("sizes${sizes}");
//   }
  void addpaymenttype(String type, String paymentstatus ) {
    paymenttype = type;
paymentStatus = paymentstatus;
// orderStatus = orderstatus;
    update();
    print("paymenttype: ${paymenttype},paymentstatus: ${paymentstatus}");
  }

    void addpaymentPopup(String paymentday,bool gst, String paymnetmethod ) {
    paymentdays1 = paymentday;
gst1 = gst;
    paymentmethod1  = paymnetmethod;
// orderStatus = gst;
    update();
    print("paymentdays1: ${paymentdays1},gst1: ${gst} paymentmethod: ${paymnetmethod}",);
  }
void chooseaddressID(int id) {
    isselected1 = id;
    update();
    print("Address Id ====>>>>> $isselected1");
  }
  void adddiscount(int disprice, int price) {
    disCount = disprice;
    price = price;
    tex = price * 0.5;
    update();
    print("disCount${disCount}");
  }

@override
  void onClose() {
    print("closing...");
  clearFields();
    super.onClose();
  }
void clearFields() {
    
    couponsController.couponcode = null;
     couponsController.maxAmount = null;
update();
  }
  void totalbuyNowPrice( double totalprice) {
    total = totalprice;
    update();
    print("TotalPriceBuy ====>>>>> $total");
  }
void adddata(int id, int qty, String name, int tex, double price, int dis) {
    showLoading = false;
    selectID = id;
    selectqty = qty;
    selectname = name;
    selecttex = tex;
    selectprice = price;
    selectdis = dis;

    cartList = [
      {
        "product_id": selectID.toString(),
        "quantity": selectqty.toString(),
        "variation": selectname.toString(),
        "tax_amount": selecttex.toString(),
        "discount_on_item": selectdis.toString(),
        "price": selectprice.toString()
      }
    ];

    update();
    print(
        "DataBuyNowupdated ====>>>>> $selectID   $selectname $selecttex $selectprice $selectdis");
    print(cartList);
  }

  @override
  void onInit() {
    super.onInit();

    init();
     wholesellerID = storage.read('wholesalerId');
     print("WholeSellerIDCart ==>${wholesellerID}");
       print("SellerIDCart ==>${sellerId}");
  //  wholesellerID = storage.read('wholesalerid');
  }

  incrementSize(int index) {

     if (sizes[index] <int.parse (mycartmodel!.data![index].totalQuantity!).toInt()) {
     
    print("SIzes++++${mycartmodel!.data![index].totalQuantity}");
     sizes[index]++;
       mycartmodel!.data![index].quantity = sizes[index];
      
print("Sizes after increment sales** : ${mycartmodel!.data![index].quantity}");
    //  item.price ++;
    update();
    // sizes[index]++;
    // update();

    print("SIzes${sizes}");
    // total = 0;
    // mycartmodel!.data!.forEach((element) async {
    //   total += (int.parse(element.price!) *
    //       sizes.elementAt(mycartmodel!.data!.indexOf(element) ?? 0)) as int;
    //   //  subtotal += total*sizes[0];
    //   print("total${total}");
    // });

    updateTotal();

    }
  }

  decrementSize(int index) {
    if (sizes[index] > mycartmodel!.data![index]!.minOrder) {
      sizes[index]--;
       mycartmodel!.data![index].quantity = sizes[index];
      
print("Sizes after decrement sales** : ${mycartmodel!.data![index].quantity}");
      update();
      print("SIzes--${sizes}");
    }
    updateTotal();
  
  }
  // void updateTotal() {

  //    total ;
  //   mycartmodel!.data!.forEach((element) async {
  //     total += (int.parse(element.price!) *
  //         sizes.elementAt(mycartmodel!.data!.indexOf(element) ?? 0)) as int;
  //     //  subtotal += total*sizes[0];
  //     print("total${total}");
  //   });
  // }

  void updateTotal() {
    total = 0.0;

    mycartmodel!.data!.forEach((element) {
      String priceString = element.price.toString();
 String quty = element.quantity.toString();
   double price = double.parse(priceString);
int quantity = int.parse(quty);

double priceqty = price * quantity;

try {
        double price = double.parse(priceString);
        int qtyyy = int.parse(quty);
        int sizeIndex = mycartmodel!.data!.indexOf(element) ?? 0;
        int size = sizes.elementAt(sizeIndex);
// var variansprice = productdeatilscontroller.selectedvariants?.price; int 
  int qty = (price / qtyyy).toInt();
print("Quantiy");
print(qty);

totalprice =  price .toInt();
        total +=
           (priceqty);

            print("TotalPrice ${total}");
      } catch (e) {
        print("Error parsing price: $e");
      }
    List<Map<String, dynamic>> cartJsonList1 = mycartmodel!.data!
          .map((item) => {
                "product_id": item.itemId,
                "quantity":item.quantity,
                "variation": item.variant,
                "tax_amount": "0",
                "discount_on_item":storage.read('productItemsales'),
                "price":( item.price! * item.quantity!.toInt()),
                "return_order":item.returnOrder??"no",
              })
          .toList();
print("carttt");
          print(cartJsonList1);
cartList = cartJsonList1;
    });

    print("Total: $total");
  }

  void chooseaddress(int index) {
    isselected = index;
    update();
    print("Index updated ====>>>>> $isselected");
  }

  String getUserMyCartUrl = '${Constants.GET_USER_MYCARTLIST}';
  SalesMyCartListModel? mycartmodel;
  bool cartlistLoaded = false;

  var subtotal;

  Future<void> init() async {
    // showLoading = true;
    try {
      // productdeatils
      mycartmodel = SalesMyCartListModel.fromJson(
          await ApiHelper.getApi(getUserMyCartUrl + "${storage.read('wholesalerId')}"));
      print("My====?//${getUserMyCartUrl + "${storage.read('wholesalerId')}"}");
      sizes = mycartmodel!.data!.map((e) => e.quantity).toList();
      List<Map<String, dynamic>> cartJsonList =
          mycartmodel!.data!.map((item) => {
            "product_id": item.itemId,
            "quantity":item.quantity,
            "variation":item.variant,
             "tax_amount": "0",
                "discount_on_item":storage.read('productItemsales'),
            "price":( item.price! * item.quantity!.toInt()),
            "return_order":item.returnOrder ,
          }).toList();
      cartList = cartJsonList;
      

// mycartmodel!.data!.forEach((element) async {
      //   total += (int.parse(element.price!) *
      //       sizes.elementAt(mycartmodel!.data!.indexOf(element) ?? 0)) as int;
      //   //  subtotal += total*sizes[0];
      //   print("total${total}");
      // });

      print("URL====${getUserMyCartUrl + "${storage.read('wholesalerId')}"}");
      print(mycartmodel);
      cartlistLoaded = true;
         updateTotal();
      update();
    } catch (e) {
      print('Error: $e');
     // Get.snackbar(
      //   'Error',
      //   'An error occurred: $e',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.red,
      //   colorText: Colors.white,
      // );
    }
  }

  String getUserMyCartDeleteUrl = '${Constants.GET_USER_MYCARTLISTDELETE}';
  SalesMyCartListDeleteModel? mycartdeletemodel;
  bool cartlistdeleteLoaded = false;

  Future<void> initdelete() async {
    try {
      // productdeatils
      mycartdeletemodel = SalesMyCartListDeleteModel.fromJson(
          await ApiHelper.deleteApi(getUserMyCartDeleteUrl + "$additemid"));
      print(mycartdeletemodel);
      print("delete");
      print(getUserMyCartDeleteUrl + "$additemid");
      cartlistLoaded = true;

       final SalesProductDetailsController productdetailscontroller =
          Get.put(SalesProductDetailsController());
      // await productdetailscontroller.isProductInCart();
      print("====>>>>> model: ${mycartmodel!.toJson()}");
      mycartmodel!.data!.removeWhere((element) => element.id == additemid);
      if (mycartmodel!.data!.isEmpty){
        print("mycartmodelis Empty");
        print(mycartmodel!.data!.length);
          price = 0;
        total =0; 
       couponsController.couponcode = null;
        couponsController..maxAmount = null;
clearFields();
   print("ToTal====?");
      }
      // await productdetailscontroller.isProductInCart();
        print("ToTal====?");
      update();
    } catch (e) {
      print('Error: $e');
     // Get.snackbar(
      //   'Error',
      //   'An error occurred: $e',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.red,
      //   colorText: Colors.white,
      // );
    }
  }

  String getUserAllAddressUrl = '${Constants.GET_USER_ALLADDRESSLIST}';
SalesAllAddressListModel? allAddresslistModel;
  bool addresslistLoaded = false;

  Future<void> alladdressinit() async {
    try {
      // productdeatils
      allAddresslistModel = SalesAllAddressListModel.fromJson(
          await ApiHelper.getApi(getUserAllAddressUrl + "${storage.read('wholesalerId')}"));
      print(allAddresslistModel);

      print(getUserAllAddressUrl + "${storage.read('wholesalerId')}");
      addresslistLoaded = true;
      update();
    } catch (e) {
      print('Error: $e');
     // Get.snackbar(
      //   'Error',
      //   'An error occurred: $e',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.red,
      //   colorText: Colors.white,
      // );
    }
  }

  String getUserAdressDeleteUrl = '${Constants.GET_USER_ADDRESS_DELETE}';

  SalesAddressDeleteModel? addressdeletemodel;
  bool addressdeleteLoaded = false;

  Future<void> addressdeleteinit() async {
    try {
      addressdeletemodel = SalesAddressDeleteModel.fromJson(
          await ApiHelper.deleteApi(getUserAdressDeleteUrl + "$addressid"));
      print(addressdeleteLoaded);
      print("delete");
      print(getUserAdressDeleteUrl + "$addressid");
      addressdeleteLoaded = true;
      update();
    } catch (e) {
      print('Error: $e');
     // Get.snackbar(
      //   'Error',
      //   'An error occurred: $e',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.red,
      //   colorText: Colors.white,
      // );
    }
  }

  Future<void> salesplaceorder() async {
    showLoading = true;
    update();

    
  MyCartWholeController mycartwholeController = Get.put(MyCartWholeController());

    String sendingAddr = "";
    int sendingAddrId = 0;
    if (mycartwholeController.wholeallAddresslistModel == null ||
        mycartwholeController.wholeallAddresslistModel!.data == null ||
        mycartwholeController.wholeallAddresslistModel!.data!.isEmpty) {
      sendingAddr = "Demo address";
    } else {
      sendingAddr =
          "${mycartwholeController.wholeallAddresslistModel!.data![mycartwholeController.isselected ?? 0].city ?? ""} ${mycartwholeController.wholeallAddresslistModel!.data![mycartwholeController.isselected ?? 0].area ?? ""} ${mycartwholeController.wholeallAddresslistModel!.data![mycartwholeController.isselected ?? 0].houseNo ?? ""} ${mycartwholeController.wholeallAddresslistModel!.data![mycartwholeController.isselected ?? 0].landmark ?? ""}";
      print(sendingAddr);
      // sendingAddrId = "${mycartwholeController.wholeallAddresslistModel!.data![mycartwholeController.isselected ?? 0]} ${mycartwholeController.wholeallAddresslistModel!.data![mycartwholeController.isselected ?? 0].area ?? ""} ${mycartwholeController.wholeallAddresslistModel!.data![mycartwholeController.isselected ?? 0].houseNo ?? ""} ${mycartwholeController.wholeallAddresslistModel!.data![mycartwholeController.isselected ?? 0].landmark ?? ""}";
      // print(sendingAddr);
    }

    Map<String, dynamic> body = {
      "user_id": storage.read('wholesalerId').toString(),
      "seller_id":sellerId.toString(),
      "coupon_discount_amount":  (couponsController.maxAmount ?? "0").toString(),
      "coupon_discount_title": couponsController.coupontitle ?? '',
      "payment_status": paymentStatus.toString(),
      "order_status": "pending",
      "payment_mode": paymentmethod1.toString(),
      "gst_bill": gst1,
      "payment_day": paymentdays1.toString(),
      "total_tax_amount":"0",
      "payment_method": paymenttype.toString(),
      "transaction_reference": "sadgash23asds",
      "delivery_address_id": 2.toString(),
      "delivery_charge": "0" ,
    "original_delivery_charge":"0" ,
      "coupon_code": couponsController.couponcode ?? '',
      "order_type": "delivery",
      "checked": 1.toString(),
      "store_id": 1.toString(),
      "zone_id": 2.toString(),
      "delivered_status": "undelivered",
      "delivery_address": sendingAddr,
      // (allAddresslistModel!
      //                               .data![isselected ?? 0]
      //                               .area ??
      //                           '').toString(),
      "item_campaign_id": "",
      "order_amount":  ((total) -
              (double.parse(couponsController.maxAmount ?? "0")))
          .toString(),
      "cart": cartList,
    };
    String PlaceOrderUrl = Constants.PLACE_ORDER;
    print(body);
    try {
      // var request = http.MultipartRequest('POST', Uri.parse(PlaceOrderUrl));
      // request.fields.addAll(body);

      await ApiHelper.postApi(body: body, url: PlaceOrderUrl);
      update();
      Get.back();
      Get.snackbar(
        'Success',
        'Order place successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      print('Error: $e');
     // Get.snackbar(
      //   'Error',
      //   'An error occurred: $e',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.red,
      //   colorText: Colors.white,
      // );
    }

    showLoading = false;
    update();
  }
}
