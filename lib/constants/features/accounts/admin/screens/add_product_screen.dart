import 'package:amazonclone/common/widgets/custom_button.dart';
import 'package:amazonclone/common/widgets/custom_textfiled.dart';
import 'package:amazonclone/constants/utils.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import '../../../../global_variables.dart';

class AddProduct extends StatefulWidget {
  static const String routeName = '/add-product';
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController DescrptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  String Category = 'Mobiles';

  // ignore: non_constant_identifier_names
  List<String> ProductCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion'
  ];
  List<File> images = [];

  void selectimages() async {
    var res = await pickimages();
    setState(() {
      images = res;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
    productNameController.dispose();
    DescrptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Add Product',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
              child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: selectimages,
                  child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(10),
                      dashPattern: const [10, 4],
                      child: Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.folder_open_outlined,
                              size: 40,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Add product Image',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            )
                          ],
                        ),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    controller: productNameController, text: 'Product Name'),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: DescrptionController,
                  text: 'Product Description',
                  MaxLines: 8,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    controller: priceController, text: 'Product Price'),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    controller: quantityController, text: 'Product Quantity'),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: double.infinity,
                    child: DropdownButton(
                      value: Category,
                      items: ProductCategories.map((String item) {
                        return DropdownMenuItem(
                          child: Text(item),
                          value: item,
                        );
                      }).toList(),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      onChanged: (String? newValue) {
                        setState(() {
                          Category = newValue!;
                        });
                      },
                    )),
                SizedBox(
                  child: CustomButton(
                    text: 'Sell',
                    ontap: () {},
                  ),
                )
              ],
            ),
          )),
        ));
  }
}
