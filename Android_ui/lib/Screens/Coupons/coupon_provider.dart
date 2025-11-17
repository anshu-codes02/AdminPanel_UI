import 'package:adminpanel/Models/Product.dart';
import 'package:adminpanel/Models/category.dart';
import 'package:adminpanel/Models/sub_category.dart';
import 'package:flutter/material.dart';

class CouponProvider with ChangeNotifier {
  TextEditingController couponController = TextEditingController();
  TextEditingController discountAmountController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController minimumPurchaseAmountController = TextEditingController();
  List<String> status=["Active","Inactive"];
  List<String> discountType=["Percentage","Fixed"];
  String? selectedStatus;
  String? selectedDiscountType;
  category? selectedCategory;
  SubCategory? selectedSubCategory;
  Product? selectedProduct;
}