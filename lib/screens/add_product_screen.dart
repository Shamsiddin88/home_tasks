import 'package:flutter/material.dart';
import 'package:home_tasks/data/models/product_model.dart';
import 'package:home_tasks/utils/project_extensions.dart';
import 'package:home_tasks/data/repositories/product_repo.dart';
import 'package:home_tasks/utils/utilities.dart';
import '../utils/colors/app_colors.dart';
import '../utils/styles/app_text_style.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});


  @override
  State<AddProductScreen> createState() => _AddProductScreenState();


}

class _AddProductScreenState extends State<AddProductScreen> {
  ProductModel productModel= ProductModel.initialValue;
  final ProductRepo productRepo = ProductRepo();


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Add product screen"),),
    body: Padding(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            10.getH(),
            TextField(
              textInputAction: TextInputAction.next,
              onChanged: (v){
                productModel=productModel.copyWith(productName: v);
              },
              decoration:
              InputDecoration(
        
                  floatingLabelBehavior:
                  FloatingLabelBehavior.always,
                  fillColor: Colors.white  ,
                  filled: true,
                  hintMaxLines: 4,
        
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  hintText: "Enter product name",
                  hintStyle: TextStyle(color: Colors.black, fontSize: 14),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.black),
                      borderRadius: BorderRadius.circular(12))
              ),
            ),
            20.getH(),
            TextField(
              onChanged: (v){
                productModel=productModel.copyWith(price: double.parse(v));
              },
              textInputAction: TextInputAction.next,
              decoration:
              InputDecoration(
        
                  floatingLabelBehavior:
                  FloatingLabelBehavior.always,
                  fillColor: Colors.white  ,
                  filled: true,
                  hintMaxLines: 4,
        
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  hintText: "Enter product price",
                  hintStyle: TextStyle(color: Colors.black, fontSize: 14),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.black),
                      borderRadius: BorderRadius.circular(12))
              ),
            ),
            20.getH(),
            TextField(
              textInputAction: TextInputAction.next,
              onChanged: (v){
                productModel=productModel.copyWith(description: v);
              },
              decoration:
              InputDecoration(
        
                  floatingLabelBehavior:
                  FloatingLabelBehavior.always,
                  fillColor: Colors.white  ,
                  filled: true,
                  hintMaxLines: 4,
        
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  hintText: "Enter product description",
                  hintStyle: TextStyle(color: Colors.black, fontSize: 14),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.black),
                      borderRadius: BorderRadius.circular(12))
              ),
            ),
            20.getH(),
            TextField(
              textInputAction: TextInputAction.next,
              onChanged: (v){
                productModel=productModel.copyWith(color: v.toColor());
              },
              decoration:
              InputDecoration(
        
                  floatingLabelBehavior:
                  FloatingLabelBehavior.always,
                  fillColor: Colors.white  ,
                  filled: true,
                  hintMaxLines: 4,
        
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  hintText: "Enter product color",
                  hintStyle: TextStyle(color: Colors.black, fontSize: 14),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.black),
                      borderRadius: BorderRadius.circular(12))
              ),
            ),
            20.getH(),
            TextField(
              textInputAction: TextInputAction.done,
              onChanged: (v){
                productModel=productModel.copyWith(imageUrl: v);
              },
              decoration:
              InputDecoration(
        
        
                  floatingLabelBehavior:
                  FloatingLabelBehavior.always,
                  fillColor: Colors.white  ,
                  filled: true,
                  hintMaxLines: 4,
        
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  hintText: "Enter product image URL",
                  hintStyle: TextStyle(color: Colors.black, fontSize: 14),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.black),
                      borderRadius: BorderRadius.circular(12))
              ),
            ),
            40.getH(),
            TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                onPressed: ()async
                  {
                    if (productModel.canAddModel()){
                      showSuccessMessage("SUCCESS");

                      await productRepo.addProduct(productModel);
                      setState(() {});
                      Navigator.pop(context);

                    }
                    else {
                      showErrorMessage("ERROR");
                    }
        
        
        
        
                },child: Text("Add", style: AppTextStyle.rubikMedium.copyWith(color: AppColors.white),))
        
        
          ],
        
        ),
      ),
    ),);
  }
}
