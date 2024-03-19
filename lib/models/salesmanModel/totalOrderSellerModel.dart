class TotalOrderSellerModel {
  String? status;
  List<Data>? data;
  String? message;

  TotalOrderSellerModel({this.status, this.data, this.message});

  TotalOrderSellerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  List<UserId>? userId;
  String? sellerId;
  String? orderAmount;
  String? couponDiscountAmount;
  String? couponDiscountTitle;
  String? paymentStatus;
  String? orderStatus;
  String? totalTaxAmount;
  String? paymentMethod;
  String? transactionReference;
  int? deliveryAddressId;
  Null? deliveryManId;
  String? couponCode;
  Null? orderNote;
  String? orderType;
  int? checked;
  int? storeId;
  String? createdAt;
  String? updatedAt;
  String? deliveryCharge;
  String? scheduleAt;
  Null? callback;
  String? otp;
  String? pending;
  Null? accepted;
  Null? confirmed;
  Null? processing;
  Null? handover;
  Null? pickedUp;
  String? delivered;
  Null? canceled;
  Null? refundRequested;
  Null? refunded;
  String? deliveryAddress;
  int? scheduled;
  String? storeDiscountAmount;
  String? originalDeliveryCharge;
  Null? failed;
  String? adjusment;
  int? edited;
  Null? deliveryTime;
  int? zoneId;
  int? moduleId;
  Null? orderAttachment;
  Null? parcelCategoryId;
  Null? receiverDetails;
  Null? chargePayer;
  int? distance;
  int? dmTips;
  Null? freeDeliveryBy;
  Null? refundRequestCanceled;
  int? prescriptionOrder;
  String? deliveredStatus;

  Data(
      {this.id,
      this.userId,
      this.sellerId,
      this.orderAmount,
      this.couponDiscountAmount,
      this.couponDiscountTitle,
      this.paymentStatus,
      this.orderStatus,
      this.totalTaxAmount,
      this.paymentMethod,
      this.transactionReference,
      this.deliveryAddressId,
      this.deliveryManId,
      this.couponCode,
      this.orderNote,
      this.orderType,
      this.checked,
      this.storeId,
      this.createdAt,
      this.updatedAt,
      this.deliveryCharge,
      this.scheduleAt,
      this.callback,
      this.otp,
      this.pending,
      this.accepted,
      this.confirmed,
      this.processing,
      this.handover,
      this.pickedUp,
      this.delivered,
      this.canceled,
      this.refundRequested,
      this.refunded,
      this.deliveryAddress,
      this.scheduled,
      this.storeDiscountAmount,
      this.originalDeliveryCharge,
      this.failed,
      this.adjusment,
      this.edited,
      this.deliveryTime,
      this.zoneId,
      this.moduleId,
      this.orderAttachment,
      this.parcelCategoryId,
      this.receiverDetails,
      this.chargePayer,
      this.distance,
      this.dmTips,
      this.freeDeliveryBy,
      this.refundRequestCanceled,
      this.prescriptionOrder,
      this.deliveredStatus});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['user_id'] != null) {
      userId = <UserId>[];
      json['user_id'].forEach((v) {
        userId!.add(new UserId.fromJson(v));
      });
    }
    sellerId = json['seller_id'];
    orderAmount = json['order_amount'];
    couponDiscountAmount = json['coupon_discount_amount'];
    couponDiscountTitle = json['coupon_discount_title'];
    paymentStatus = json['payment_status'];
    orderStatus = json['order_status'];
    totalTaxAmount = json['total_tax_amount'];
    paymentMethod = json['payment_method'];
    transactionReference = json['transaction_reference'];
    deliveryAddressId = json['delivery_address_id'];
    deliveryManId = json['delivery_man_id'];
    couponCode = json['coupon_code'];
    orderNote = json['order_note'];
    orderType = json['order_type'];
    checked = json['checked'];
    storeId = json['store_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deliveryCharge = json['delivery_charge'];
    scheduleAt = json['schedule_at'];
    callback = json['callback'];
    otp = json['otp'];
    pending = json['pending'];
    accepted = json['accepted'];
    confirmed = json['confirmed'];
    processing = json['processing'];
    handover = json['handover'];
    pickedUp = json['picked_up'];
    delivered = json['delivered'];
    canceled = json['canceled'];
    refundRequested = json['refund_requested'];
    refunded = json['refunded'];
    deliveryAddress = json['delivery_address'];
    scheduled = json['scheduled'];
    storeDiscountAmount = json['store_discount_amount'];
    originalDeliveryCharge = json['original_delivery_charge'];
    failed = json['failed'];
    adjusment = json['adjusment'];
    edited = json['edited'];
    deliveryTime = json['delivery_time'];
    zoneId = json['zone_id'];
    moduleId = json['module_id'];
    orderAttachment = json['order_attachment'];
    parcelCategoryId = json['parcel_category_id'];
    receiverDetails = json['receiver_details'];
    chargePayer = json['charge_payer'];
    distance = json['distance'];
    dmTips = json['dm_tips'];
    freeDeliveryBy = json['free_delivery_by'];
    refundRequestCanceled = json['refund_request_canceled'];
    prescriptionOrder = json['prescription_order'];
    deliveredStatus = json['delivered_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.userId != null) {
      data['user_id'] = this.userId!.map((v) => v.toJson()).toList();
    }
    data['seller_id'] = this.sellerId;
    data['order_amount'] = this.orderAmount;
    data['coupon_discount_amount'] = this.couponDiscountAmount;
    data['coupon_discount_title'] = this.couponDiscountTitle;
    data['payment_status'] = this.paymentStatus;
    data['order_status'] = this.orderStatus;
    data['total_tax_amount'] = this.totalTaxAmount;
    data['payment_method'] = this.paymentMethod;
    data['transaction_reference'] = this.transactionReference;
    data['delivery_address_id'] = this.deliveryAddressId;
    data['delivery_man_id'] = this.deliveryManId;
    data['coupon_code'] = this.couponCode;
    data['order_note'] = this.orderNote;
    data['order_type'] = this.orderType;
    data['checked'] = this.checked;
    data['store_id'] = this.storeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['delivery_charge'] = this.deliveryCharge;
    data['schedule_at'] = this.scheduleAt;
    data['callback'] = this.callback;
    data['otp'] = this.otp;
    data['pending'] = this.pending;
    data['accepted'] = this.accepted;
    data['confirmed'] = this.confirmed;
    data['processing'] = this.processing;
    data['handover'] = this.handover;
    data['picked_up'] = this.pickedUp;
    data['delivered'] = this.delivered;
    data['canceled'] = this.canceled;
    data['refund_requested'] = this.refundRequested;
    data['refunded'] = this.refunded;
    data['delivery_address'] = this.deliveryAddress;
    data['scheduled'] = this.scheduled;
    data['store_discount_amount'] = this.storeDiscountAmount;
    data['original_delivery_charge'] = this.originalDeliveryCharge;
    data['failed'] = this.failed;
    data['adjusment'] = this.adjusment;
    data['edited'] = this.edited;
    data['delivery_time'] = this.deliveryTime;
    data['zone_id'] = this.zoneId;
    data['module_id'] = this.moduleId;
    data['order_attachment'] = this.orderAttachment;
    data['parcel_category_id'] = this.parcelCategoryId;
    data['receiver_details'] = this.receiverDetails;
    data['charge_payer'] = this.chargePayer;
    data['distance'] = this.distance;
    data['dm_tips'] = this.dmTips;
    data['free_delivery_by'] = this.freeDeliveryBy;
    data['refund_request_canceled'] = this.refundRequestCanceled;
    data['prescription_order'] = this.prescriptionOrder;
    data['delivered_status'] = this.deliveredStatus;
    return data;
  }
}

class UserId {
  int? id;
  int? role;
  String? sellerId;
  String? fName;
  String? lName;
  String? phone;
  String? email;
  String? dateofbirth;
  String? state;
  String? city;
  String? businessName;
  String? aadharNumber;
  String? gstNumber;
  String? pincode;
  String? upload1;
  String? upload2;
  String? image;
  String? verified;
  String? payLaterTime;
  String? payLaterAmount;
  String? payLaterLimit;
  int? isPhoneVerified;
  String? emailVerifiedAt;
  String? password;
  String? rememberToken;
  String? createdAt;
  String? updatedAt;
  String? interest;
  String? cmFirebaseToken;
  int? status;
  int? orderCount;
  String? loginMedium;
  int? socialId;
  int? zoneId;
  String? walletBalance;
  String? loyaltyPoint;
  String? refCode;
  String? currentLanguageKey;

  UserId(
      {this.id,
      this.role,
      this.sellerId,
      this.fName,
      this.lName,
      this.phone,
      this.email,
      this.dateofbirth,
      this.state,
      this.city,
      this.businessName,
      this.aadharNumber,
      this.gstNumber,
      this.pincode,
      this.upload1,
      this.upload2,
      this.image,
      this.verified,
      this.payLaterTime,
      this.payLaterAmount,
      this.payLaterLimit,
      this.isPhoneVerified,
      this.emailVerifiedAt,
      this.password,
      this.rememberToken,
      this.createdAt,
      this.updatedAt,
      this.interest,
      this.cmFirebaseToken,
      this.status,
      this.orderCount,
      this.loginMedium,
      this.socialId,
      this.zoneId,
      this.walletBalance,
      this.loyaltyPoint,
      this.refCode,
      this.currentLanguageKey});

  UserId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'];
    sellerId = json['seller_id'];
    fName = json['f_name'];
    lName = json['l_name'];
    phone = json['phone'];
    email = json['email'];
    dateofbirth = json['dateofbirth'];
    state = json['state'];
    city = json['city'];
    businessName = json['business_name'];
    aadharNumber = json['aadhar_number'];
    gstNumber = json['gst_number'];
    pincode = json['pincode'];
    upload1 = json['upload_1'];
    upload2 = json['upload_2'];
    image = json['image'];
    verified = json['verified'];
    payLaterTime = json['pay_later_time'];
    payLaterAmount = json['pay_later_amount'];
    payLaterLimit = json['pay_later_limit'];
    isPhoneVerified = json['is_phone_verified'];
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    interest = json['interest'];
    cmFirebaseToken = json['cm_firebase_token'];
    status = json['status'];
    orderCount = json['order_count'];
    loginMedium = json['login_medium'];
    socialId = json['social_id'];
    zoneId = json['zone_id'];
    walletBalance = json['wallet_balance'];
    loyaltyPoint = json['loyalty_point'];
    refCode = json['ref_code'];
    currentLanguageKey = json['current_language_key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['role'] = this.role;
    data['seller_id'] = this.sellerId;
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['dateofbirth'] = this.dateofbirth;
    data['state'] = this.state;
    data['city'] = this.city;
    data['business_name'] = this.businessName;
    data['aadhar_number'] = this.aadharNumber;
    data['gst_number'] = this.gstNumber;
    data['pincode'] = this.pincode;
    data['upload_1'] = this.upload1;
    data['upload_2'] = this.upload2;
    data['image'] = this.image;
    data['verified'] = this.verified;
    data['pay_later_time'] = this.payLaterTime;
    data['pay_later_amount'] = this.payLaterAmount;
    data['pay_later_limit'] = this.payLaterLimit;
    data['is_phone_verified'] = this.isPhoneVerified;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['password'] = this.password;
    data['remember_token'] = this.rememberToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['interest'] = this.interest;
    data['cm_firebase_token'] = this.cmFirebaseToken;
    data['status'] = this.status;
    data['order_count'] = this.orderCount;
    data['login_medium'] = this.loginMedium;
    data['social_id'] = this.socialId;
    data['zone_id'] = this.zoneId;
    data['wallet_balance'] = this.walletBalance;
    data['loyalty_point'] = this.loyaltyPoint;
    data['ref_code'] = this.refCode;
    data['current_language_key'] = this.currentLanguageKey;
    return data;
  }
}