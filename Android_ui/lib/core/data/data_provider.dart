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
  List<Order> _allOrders=[];
  List<Order> _filteredOrders=[];
  List<Order> get orders => _filteredOrders;

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

   List<Coupon> _allCoupons=[];
   List<Coupon> _filteredCoupons=[];
   List<Coupon> get coupons=> _filteredCoupons;

   List<VariantType> _allVariantTypes=[];
   List<VariantType> _filteredVariantTypes=[];
   List<VariantType> get variantTypes=> _filteredVariantTypes;

   List<Variant> _allVariants=[];
   List<Variant> _filteredVariants=[];
   List<Variant> get variants=> _filteredVariants;

  Future<void> updatedStatus(String? orderId,String newStatus)async{

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