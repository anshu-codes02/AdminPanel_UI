import 'package:adminpanel/Models/Brands.dart';
import 'package:adminpanel/Models/Order/Order.dart';
import 'package:adminpanel/Models/Product.dart';
import 'package:adminpanel/Models/VariantType.dart';
import 'package:adminpanel/Models/coupon.dart';
import 'package:adminpanel/Models/sub_category.dart';
import 'package:adminpanel/Models/variants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:adminpanel/Models/category.dart';

class DataProvider extends ChangeNotifier{
  List<Order> _allOrders=[
  Order(
    sId: "order_001",
    userId: UserId(
      sId: "user_001",
      name: "John Doe",
    ),
    orderDate: "2025-01-10",
    orderStatus: "Delivered",
    paymentMethod: "Cash on Delivery",
    trackingUrl: "https://track.example.com/001",
    totalPrice: 1200.0,
    items: [
      Items(
        sId: "item_001",
        productId: "prod_001",
        productName: "Flutter T-Shirt",
        quantity: 2,
        price: 400,
        variant: "Size L",
      ),
      Items(
        sId: "item_002",
        productId: "prod_002",
        productName: "Flutter Mug",
        quantity: 1,
        price: 400,
        variant: "Black",
      ),
    ],
    shippingAddress: ShippingAddress(
      phone: "9876543210",
      street: "123 Main Street",
      city: "Bangalore",
      state: "Karnataka",
      postalCode: "560001",
      country: "India",
    ),
    couponCode: CouponCode(
      sId: "coupon_001",
      couponCode: "FLUTTER10",
      discountType: "Percentage",
      discountAmount: 10,
    ),
    orderTotal: OrderTotal(
      subtotal: 1200,
      discount: 120,
      total: 1080,
    ),
    iV: 0,
  ),

  Order(
    sId: "order_002",
    userId: UserId(
      sId: "user_002",
      name: "Alice Smith",
    ),
    orderDate: "2025-01-12",
    orderStatus: "Shipped",
    paymentMethod: "UPI",
    trackingUrl: "https://track.example.com/002",
    totalPrice: 2500.0,
    items: [
      Items(
        sId: "item_003",
        productId: "prod_003",
        productName: "Wireless Headphones",
        quantity: 1,
        price: 2500,
        variant: "Black",
      ),
    ],
    shippingAddress: ShippingAddress(
      phone: "9123456780",
      street: "45 MG Road",
      city: "Mumbai",
      state: "Maharashtra",
      postalCode: "400001",
      country: "India",
    ),
    couponCode: CouponCode(
      sId: "coupon_002",
      couponCode: "NEWUSER",
      discountType: "Flat",
      discountAmount: 200,
    ),
    orderTotal: OrderTotal(
      subtotal: 2500,
      discount: 200,
      total: 2300,
    ),
    iV: 0,
  ),

  Order(
    sId: "order_003",
    userId: UserId(
      sId: "user_003",
      name: "Rahul Verma",
    ),
    orderDate: "2025-01-15",
    orderStatus: "Processed",
    paymentMethod: "Cash on Delivery",
    trackingUrl: null,
    totalPrice: 1800.0,
    items: [
      Items(
        sId: "item_004",
        productId: "prod_004",
        productName: "Running Shoes",
        quantity: 1,
        price: 1800,
        variant: "Size 9",
      ),
    ],
    shippingAddress: ShippingAddress(
      phone: "9988776655",
      street: "78 Park Avenue",
      city: "Delhi",
      state: "Delhi",
      postalCode: "110001",
      country: "India",
    ),
    couponCode: null, // No coupon applied
    orderTotal: OrderTotal(
      subtotal: 1800,
      discount: 0,
      total: 1800,
    ),
    iV: 0,
  ),
  Order(
  sId: "order_004",
  userId: UserId(
    sId: "user_004",
    name: "Priya Sharma",
  ),
  orderDate: "2025-01-18",
  orderStatus: "Pending",
  paymentMethod: "UPI",
  trackingUrl: null,
  totalPrice: 999.0,
  items: [
    Items(
      sId: "item_005",
      productId: "prod_005",
      productName: "Bluetooth Speaker",
      quantity: 1,
      price: 999,
      variant: "Blue",
    ),
  ],
  shippingAddress: ShippingAddress(
    phone: "9012345678",
    street: "12 Lake View",
    city: "Pune",
    state: "Maharashtra",
    postalCode: "411001",
    country: "India",
  ),
  couponCode: null,
  orderTotal: OrderTotal(
    subtotal: 999,
    discount: 0,
    total: 999,
  ),
  iV: 0,
),

Order(
  sId: "order_005",
  userId: UserId(
    sId: "user_005",
    name: "Amit Patel",
  ),
  orderDate: "2025-01-19",
  orderStatus: "Delivered",
  paymentMethod: "UPI",
  trackingUrl: "https://track.example.com/005",
  totalPrice: 4500.0,
  items: [
    Items(
      sId: "item_006",
      productId: "prod_006",
      productName: "Smart Watch",
      quantity: 1,
      price: 4500,
      variant: "Black Strap",
    ),
  ],
  shippingAddress: ShippingAddress(
    phone: "9871234560",
    street: "56 Ring Road",
    city: "Ahmedabad",
    state: "Gujarat",
    postalCode: "380001",
    country: "India",
  ),
  couponCode: CouponCode(
    sId: "coupon_003",
    couponCode: "WATCH500",
    discountType: "Flat",
    discountAmount: 500,
  ),
  orderTotal: OrderTotal(
    subtotal: 4500,
    discount: 500,
    total: 4000,
  ),
  iV: 0,
),

Order(
  sId: "order_006",
  userId: UserId(
    sId: "user_006",
    name: "Neha Kapoor",
  ),
  orderDate: "2025-01-20",
  orderStatus: "Processed",
  paymentMethod: "Net Banking",
  trackingUrl: null,
  totalPrice: 3200.0,
  items: [
    Items(
      sId: "item_007",
      productId: "prod_007",
      productName: "Office Chair",
      quantity: 1,
      price: 3200,
      variant: "Grey",
    ),
  ],
  shippingAddress: ShippingAddress(
    phone: "9811122233",
    street: "9 Industrial Area",
    city: "Gurgaon",
    state: "Haryana",
    postalCode: "122001",
    country: "India",
  ),
  couponCode: null,
  orderTotal: OrderTotal(
    subtotal: 3200,
    discount: 0,
    total: 3200,
  ),
  iV: 0,
),

Order(
  sId: "order_007",
  userId: UserId(
    sId: "user_007",
    name: "Rohit Mehta",
  ),
  orderDate: "2025-01-21",
  orderStatus: "Shipped",
  paymentMethod: "Cash on Delivery",
  trackingUrl: "https://track.example.com/007",
  totalPrice: 1599.0,
  items: [
    Items(
      sId: "item_008",
      productId: "prod_008",
      productName: "Backpack",
      quantity: 1,
      price: 1599,
      variant: "Olive Green",
    ),
  ],
  shippingAddress: ShippingAddress(
    phone: "9090909090",
    street: "21 Hill Road",
    city: "Shimla",
    state: "Himachal Pradesh",
    postalCode: "171001",
    country: "India",
  ),
  couponCode: null,
  orderTotal: OrderTotal(
    subtotal: 1599,
    discount: 0,
    total: 1599,
  ),
  iV: 0,
),

Order(
  sId: "order_008",
  userId: UserId(
    sId: "user_008",
    name: "Sneha Iyer",
  ),
  orderDate: "2025-01-22",
  orderStatus: "Cancelled",
  paymentMethod: "UPI",
  trackingUrl: null,
  totalPrice: 2100.0,
  items: [
    Items(
      sId: "item_009",
      productId: "prod_009",
      productName: "Yoga Mat",
      quantity: 2,
      price: 1050,
      variant: "Purple",
    ),
  ],
  shippingAddress: ShippingAddress(
    phone: "9345678901",
    street: "88 Temple Street",
    city: "Chennai",
    state: "Tamil Nadu",
    postalCode: "600001",
    country: "India",
  ),
  couponCode: CouponCode(
    sId: "coupon_004",
    couponCode: "FITNESS15",
    discountType: "Percentage",
    discountAmount: 15,
  ),
  orderTotal: OrderTotal(
    subtotal: 2100,
    discount: 315,
    total: 1785,
  ),
  iV: 0,
),

];
  final List<Order> _filteredOrders = [];
  List<Order> get orders => _filteredOrders;

 void filterOrdersByStatus(String status)
 {
    String statusLower=status.toLowerCase();
    _filteredOrders.clear();
    if(statusLower=="all orders") {
      _filteredOrders.addAll(_allOrders);
      notifyListeners();
      return;
    }
    for(var order in _allOrders) {
       if(order.orderStatus!.toLowerCase() == statusLower) {
         _filteredOrders.add(order);
       }
    }
    notifyListeners();
 }

   List<category> _allCategories = [];
  List<category> _filteredCategories = [];
  List<category> get categories => _filteredCategories;

   List<SubCategory> _allSubCategories=[];
   List<SubCategory> _filteredSubCategories=[];
   List<SubCategory> get subCategories=> _filteredSubCategories;

   List<Brand> _allBrands=[];
   List<Brand> _filteredBrands=[];
   List<Brand> get brands=> _filteredBrands;

   List<Product> _allProducts=[];
   List<Product> _filteredProducts=[];
   List<Product> get products=> _filteredProducts;

   List<Coupon> _allCoupons=[ Coupon(
    sId: "c1",
    couponCode: "SAVE200",
    discountType: "Fixed",
    discountAmount: 200,
    minimumPurchaseAmount: 1000,
    endDate: "2025-12-31",
    status: "Active",
    applicableCategory: CatRef(
      sId: "cat1",
      name: "Electronics",
    ),
    applicableSubCategory: CatRef(
      sId: "sub1",
      name: "Smart Phone",
    ),
    applicableProduct: CatRef(
      sId: "prod1",
      name: "Samsung A55 5G",
    ),
    createdAt: "2024-12-01",
    updatedAt: "2024-12-01",
    iV: 0,
  ),
];
   List<Coupon> _filteredCoupons=[];
   List<Coupon> get coupons=> _allCoupons;

   List<VariantType> _allVariantTypes=[];
   List<VariantType> _filteredVariantTypes=[];
   List<VariantType> get variantTypes=> _filteredVariantTypes;

   List<Variant> _allVariants=[];
   List<Variant> _filteredVariants=[];
   List<Variant> get variants=> _filteredVariants;

  Future<void> updatedStatus(String? orderId,String newStatus)async{
    for(var order in _allOrders){
      if(order.sId==orderId){
        order.orderStatus=newStatus;
        break;
      }
    }
    notifyListeners();
  }

  void updateCategories(List<category> newCategories) {
    _allCategories = newCategories;
    _filteredCategories = _allCategories;
    notifyListeners();
  }

  void updateSubCategories(List<SubCategory> newSubCategories) {
    _allSubCategories = newSubCategories;
    _filteredSubCategories = _allSubCategories;
    notifyListeners();
  }
}