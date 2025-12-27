class Order {
  final UserId? userId;
  final String? orderDate;
   String? orderStatus;
  final List<Items>? items;
  final String? sId;
  final double? totalPrice;
  final ShippingAddress? shippingAddress;
  final String? paymentMethod;
  final CouponCode? couponCode;
  final OrderTotal? orderTotal;
  final String? trackingUrl;
  final int? iV;

  Order({
    this.userId,
    this.orderDate,
    this.orderStatus,
    this.items,
    this.totalPrice,
    this.shippingAddress,
    this.paymentMethod,
    this.couponCode,
    this.orderTotal,
    this.trackingUrl,
    this.iV,
    this.sId,
  });

  Order.fromJson(Map<String, dynamic> json)
      : userId =
            json['userId'] != null ? UserId.fromJson(json['userId']) : null,
        orderDate = json['orderDate'],
        orderStatus = json['orderStatus'],
        items = json['items'] != null
            ? List<Items>.from(json['items'].map((x) => Items.fromJson(x)))
            : null,
        totalPrice = json['totalPrice'],
        shippingAddress = json['shippingAddress'] != null
            ? ShippingAddress.fromJson(json['shippingAddress'])
            : null,
        paymentMethod = json['paymentMethod'],
        couponCode = json['couponCode'] != null
            ? CouponCode.fromJson(json['couponCode'])
            : null,
        orderTotal = json['orderTotal'] != null
            ? OrderTotal.fromJson(json['orderTotal'])
            : null,
        trackingUrl = json['trackingUrl'],
        iV = json['__v'],
        sId = json['_id'];

  Map<String, dynamic> toJson() {
    return {
      if (userId != null) 'userId': userId!.toJson(),
      if (orderDate != null) 'orderDate': orderDate,
      if (orderStatus != null) 'orderStatus': orderStatus,
      if (items != null) 'items': items!.map((e) => e.toJson()).toList(),
      if (totalPrice != null) 'totalPrice': totalPrice,
      if (shippingAddress != null) 'shippingAddress': shippingAddress!.toJson(),
      if (paymentMethod != null) 'paymentMethod': paymentMethod,
      if (couponCode != null) 'couponCode': couponCode!.toJson(),
      if (orderTotal != null) 'orderTotal': orderTotal!.toJson(),
      if (trackingUrl != null) 'trackingUrl': trackingUrl,
      if (iV != null) '__v': iV,
      if (sId != null) '_id': sId,
    };
  }
}
class UserId {
  final String? sId;
  final String? name;

  UserId({this.sId, this.name});

  UserId.fromJson(Map<String, dynamic> json)
      : sId = json['_id'],
        name = json['name'];
                       

  Map<String, dynamic> toJson() {
    return {
      if (sId != null) '_id': sId,
      
      if (name != null) 'name': name,
    };
  }
}

class Items {
  final String? productId;
  final String? productName;
  final int? quantity;
  final int? price;
  final String? variant;
  final String? sId;

  Items({
    this.productId,
    this.productName,
    this.quantity,
    this.price,
    this.variant,
    this.sId,
  });

  Items.fromJson(Map<String, dynamic> json)
      : productId = json['productId'],
        productName = json['productName'],
        quantity = json['quantity'],
        price = json['price'],
        variant = json['variant'],
        sId = json['_id'];

  Map<String, dynamic> toJson() {
    return {
      if (productId != null) 'productId': productId,
      if (productName != null) 'productName': productName,
      if (quantity != null) 'quantity': quantity,
      if (price != null) 'price': price,
      if (variant != null) 'variant': variant,
      if (sId != null) '_id': sId,
    };
  }
}

class ShippingAddress {
  final String? phone;
  final String? street;
  final String? city;
  final String? state;
  final String? postalCode;
  final String? country;

  ShippingAddress({
    this.phone,
    this.street,
    this.city,
    this.state,
    this.postalCode,
    this.country,
  });

  ShippingAddress.fromJson(Map<String, dynamic> json)
      : phone = json['phone'],
        street = json['street'],
        city = json['city'],
        state = json['State'],
        postalCode = json['postalCode'],
        country = json['country'];

  Map<String, dynamic> toJson() {
    return {
      if (phone != null) 'phone': phone,
      if (street != null) 'street': street,
      if (city != null) 'city': city,
      if (state != null) 'State': state,
      if (postalCode != null) 'postalCode': postalCode,
      if (country != null) 'country': country,
    };
  }
}

class CouponCode {
  final String? sId;
  final String? couponCode;
  final String? discountType;
  final int? discountAmount;

  CouponCode({
    this.sId,
    this.couponCode,
    this.discountType,
    this.discountAmount,
  });

  CouponCode.fromJson(Map<String, dynamic> json)
      : sId = json['_id'],
        couponCode = json['name'],
        discountType = json['DiscountType'],
        discountAmount = json['discountAmount'];

  Map<String, dynamic> toJson() {
    return {
      if (sId != null) '_id': sId,
      if (couponCode != null) 'name': couponCode,
      if (discountType != null) 'DiscountType': discountType,
      if (discountAmount != null) 'discountAmount': discountAmount,
    };
  }
}

class OrderTotal {
  final double? subtotal;
  final double? discount;
  final double? total;

  OrderTotal({this.subtotal, this.discount, this.total});

  OrderTotal.fromJson(Map<String, dynamic> json)
      : subtotal = json['subtotal']?.toDouble(),
        discount = json['discount']?.toDouble(),
        total = json['total']?.toDouble();

  Map<String, dynamic> toJson() {
    return {
      if (subtotal != null) 'subtotal': subtotal,
      if (discount != null) 'discount': discount,
      if (total != null) 'total': total,
    };
  }
}
