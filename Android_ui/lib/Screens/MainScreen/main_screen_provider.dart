

import 'package:adminpanel/Screens/Brands/brand_screen.dart';
import 'package:adminpanel/Screens/Category/cat_provider.dart';
import 'package:adminpanel/Screens/Category/category_screen.dart';
import 'package:adminpanel/Screens/Coupons/coupon_screen.dart';
import 'package:adminpanel/Screens/DashBoard/dashBoard.dart';
import 'package:adminpanel/Screens/Products/components/product_add.dart';
import 'package:adminpanel/Screens/Products/product_provider.dart';
import 'package:adminpanel/Screens/Products/product_screen.dart';
import 'package:adminpanel/Screens/SubCategory/sub_category_provider.dart';
import 'package:adminpanel/Screens/SubCategory/sub_category_screen.dart';
import 'package:adminpanel/Screens/VariantType/variantType_screen.dart';
import 'package:adminpanel/Screens/variants/variant_screen.dart';
import 'package:adminpanel/core/data/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreenProvider extends ChangeNotifier{
   List<int> views = [20, 25, 15, 30, 20, 18, 22]; // Replace with actual data
   List<String> dates=['21','22','23','24','25','26','27'];

   Widget selectedScreen=const DashBoard();
   int selectedIndex=0;

  void updateindex(int index)
  {
      selectedIndex=index;
      notifyListeners();
  }

  void navigatetoScreen(String screenName,BuildContext context) {
    if(selectedScreen is ProductAdd)
    {
      final provider=Provider.of<ProductProvider>(context,listen: false);
      provider.clearImagePath();
    }
    switch (screenName) {
      case "DashBoard":
        selectedScreen=const DashBoard();
        break;

      case "Categories":
        selectedScreen=const categoryScreen();
        break;

      case "SubCategories":
        selectedScreen=const SubCategoryScreen();
        break;

      case "Brands":
        selectedScreen= const BrandScreen();
        break;
      case "Products":
        selectedScreen= const ProductScreen();
      case "ProductAdd":
        selectedScreen= const ProductAdd();
        break;
      case "Variant Types":
        selectedScreen= const VariantTypeScreen();
        break;
      case "Variants":
        selectedScreen= const VariantScreen();
        break;
      case "Coupons":
        selectedScreen= const CouponScreen();
        break;
      default:
      selectedScreen=const DashBoard();
    }
    notifyListeners();
  }
}