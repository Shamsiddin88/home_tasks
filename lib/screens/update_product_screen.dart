import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_tasks/data/models/product_model.dart';
import 'package:home_tasks/utils/project_extensions.dart';
import 'package:home_tasks/data/repositories/product_repo.dart';
import 'package:home_tasks/utils/utilities.dart';
import '../utils/colors/app_colors.dart';
import '../utils/styles/app_text_style.dart';

class UpdateProductScreen extends StatefulWidget {
  UpdateProductScreen({super.key, required this.productModel});

  ProductModel productModel;

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();


}


class _UpdateProductScreenState extends State<UpdateProductScreen> {
  // ProductModel productModel= ProductModel.initialValue;
  final ProductRepo productRepo = ProductRepo();



  @override

  Widget build(BuildContext context) {
    final TextEditingController nameController =
    TextEditingController(text: widget.productModel.productName);
    final TextEditingController descriptionController =
    TextEditingController(text: widget.productModel.description);
    final TextEditingController priceController =
    TextEditingController(text: widget.productModel.price.toString());
    final TextEditingController imageUrlController =
    TextEditingController(text: widget.productModel.imageUrl);
    final TextEditingController colorController =
    TextEditingController(text: widget.productModel.color.toString());

    return Scaffold(appBar: AppBar(title: Text("Update product screen"),),
    body: Padding(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            10.getH(),
            TextField(
              controller: nameController,
              textInputAction: TextInputAction.next,
              onChanged: (v){
                widget.productModel=widget.productModel.copyWith(productName: v);
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
              controller: priceController,
              onChanged: (v){
                widget.productModel=widget.productModel.copyWith(price: double.parse(v));
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
              controller: descriptionController,
              textInputAction: TextInputAction.next,
              onChanged: (v){
                widget.productModel=widget.productModel.copyWith(description: v);
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
              controller: colorController,
              textInputAction: TextInputAction.next,
              onChanged: (v){
                widget.productModel=widget.productModel.copyWith(color: v.toColor());
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
              controller: imageUrlController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              onTap: ()async{

                final clipPaste = await Clipboard.getData(Clipboard.kTextPlain);
                setState(() {
                  imageUrlController.text = clipPaste?.text?? '';
                });
              },

              maxLines: null,

              onChanged: (v){
                widget.productModel=widget.productModel.copyWith(imageUrl: v);
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
                    if (widget.productModel.canAddModel()){
                      showSuccessMessage("SUCCESS");
                      await productRepo.addProduct(widget.productModel);
                      Navigator.pop(context);
                      setState(() {});
                    }
                    else {
                      showErrorMessage("ERROR");
                    }
        
        
        
        
                },child: Text("Update", style: AppTextStyle.rubikMedium.copyWith(color: AppColors.white),))
        
        
          ],
        
        ),
      ),
    ),);
  }
}
