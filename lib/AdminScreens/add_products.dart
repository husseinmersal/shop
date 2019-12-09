import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop/Tools/app_data.dart';
import 'package:shop/Tools/app_methods.dart';
import 'package:shop/Tools/app_tools.dart';
import 'package:shop/Tools/firebase_methods.dart';

class AddProducts extends StatefulWidget {
  @override
  _AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  //File image;
  /*Cam() async {
  File img = await ImagePicker.pickImage(source: ImageSource.camera);
//    File img = await ImagePicker.pickImage(source: ImageSource.gallery);
  if (img != null) {
  image = img;
  setState(() {});
  }
}*/

  List<DropdownMenuItem<String>> dropDownColors;

  String selectedColor;
  List<String> colorList = new List();

  List<DropdownMenuItem<String>> dropDownSizes;
  String selectedSize;
  List<String> sizeList = new List();

  List<DropdownMenuItem<String>> dropDownCategories;
  String selectedCategory;
  List<String> categoryList = new List();

  Map<int, File> imagesMap = new Map();

  TextEditingController productTitleController = new TextEditingController();
  TextEditingController productPriceController = new TextEditingController();
  TextEditingController productDescController = new TextEditingController();

  final scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    colorList = new List.from(localColors);
    sizeList = new List.from(localSizes);
    categoryList = new List.from(localCatgeories);
    dropDownColors = buildAndGetDropDownItems(colorList);
    dropDownSizes = buildAndGetDropDownItems(sizeList);
    dropDownCategories = buildAndGetDropDownItems(categoryList);
    selectedColor = dropDownColors[0].value;
    selectedSize = dropDownSizes[0].value;
    selectedCategory = dropDownCategories[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.red[300],
      appBar: AppBar(
        backgroundColor: Colors.red[300],
        title: Text("App Products"),
        centerTitle: false,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: RaisedButton.icon(
                color: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                onPressed: () async {
                  File file =
                      await ImagePicker.pickImage(source: ImageSource.gallery);
                  if (file != null) {
                    //imagesMap[imagesMap.length] = file;
                    List<File> imageFile = List();
                    imageFile.add(file);
                    //imageList = new List.from(imageFile);
                    if (imageList == null) {
                      imageList = List.from(imageFile, growable: true);
                    } else {
                      for (int s = 0; s < imageFile.length; s++) {
                        imageList.add(file);
                      }
                    }
                    setState(() {});
                  }
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                label: Text(
                  "Add Images",
                  style: TextStyle(color: Colors.white),
                )),
          ),

        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            //image == null ? new Text('No Image to Show ') : new Image.file(image),
            MultiImagePickerList(imageList: imageList, removeNewImage: (index) {removeImage(index);}),
            SizedBox(
              height: 10.0,
            ),
            productTextField(
                textTitle: "Product Title", textHint: "Enter Product Title",controller: productTitleController),
            SizedBox(
              height: 10.0,
            ),
            productTextField(
                textTitle: "Product Price",
                textHint: "Enter Product Price",
                textType: TextInputType.number,
                controller: productPriceController),
            SizedBox(
              height: 10.0,
            ),
            productTextField(
                textTitle: "Product Description",
                textHint: "Enter Description",
                controller: productDescController,
                maxLines: 4,
                height: 100.0),
            SizedBox(
              height: 10.0,
            ),
            productDropDown(
                textTitle: "Product Category",
                selectedItem: selectedCategory,
                dropDownItems: dropDownCategories,
                changedDropDownItems: changedDropDownCategory),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                productDropDown(
                    textTitle: "Color",
                    selectedItem: selectedColor,
                    dropDownItems: dropDownColors,
                    changedDropDownItems: changedDropDownColor),
                productDropDown(
                    textTitle: "Size",
                    selectedItem: selectedSize,
                    dropDownItems: dropDownSizes,
                    changedDropDownItems: changedDropDownSize),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            AppButton(
                btnTxt: "Add Product",
                onbtnclicked: addNewProducts,
                btnPadding: 20.0,
                btnBackColor: Theme.of(context).primaryColor),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor:Colors.green ,
        onPressed: (){},
        child: new Icon(Icons.camera_alt),
      ),
    );
  }

  void changedDropDownCategory(String selectedSize) {
    setState(() {
      selectedCategory = selectedSize;
    });
  }

  void changedDropDownColor(String selectedSize) {
    setState(() {
      selectedColor = selectedSize;
    });
  }

  void changedDropDownSize(String selected) {
    setState(() {
      selectedSize = selected;
    });
  }

  List<File> imageList;
  Map<int, File> imageMap = Map();

  pickImage() async {
    File file = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      //imagesMap[imagesMap.length] = file;
      List<File> imageFile = List();
      imageFile.add(file);
      //imageList = new List.from(imageFile);
      if (imageList == null) {
        imageList = List.from(imageFile, growable: true);
      } else {
        for (int s = 0; s < imageFile.length; s++) {
          imageList.add(file);
        }
      }
      setState(() {});
    }
  }


  removeImage(int index) async {
    //imagesMap.remove(index);
    imageList.removeAt(index);
    setState(() {});
  }

  AppMethods appMethod = FirebaseMethods();

  addNewProducts() async {
    if (imageList == null || imageList.isEmpty) {
      showSnackBar("Product Images cannot be empty", scaffoldKey);
      return;
    }

    if (productTitleController.text == "") {
      showSnackBar("Product Title cannot be empty", scaffoldKey);
      return;
    }

    if (productPriceController.text == "") {
      showSnackBar("Product Price cannot be empty", scaffoldKey);
      return;
    }

    if (productDescController.text == "") {
      showSnackBar("Product Description cannot be empty", scaffoldKey);
      return;
    }

    if (selectedCategory == "Select Product category") {
      showSnackBar("Please select a category", scaffoldKey);
      return;
    }

    if (selectedColor == "Select a color") {
      showSnackBar("Please select a color", scaffoldKey);
      return;
    }

    if (selectedSize == "Select a size") {
      showSnackBar("Please select a size", scaffoldKey);
      return;
    }

    //show the progress dialog
    displayProgressDialog(context);
    //get text from the individual controllers title,price, description,category,color,size
    Map<String, dynamic> newProduct = {
      productTitle:productTitleController.text,
      productPrice:productPriceController.text,
      productDesc:productDescController.text,
      productCat:selectedCategory,
      productColor:selectedColor,
      productSize:selectedSize,
    };

    //add information to firebase
    String productID = await appMethod.addNewProduct(newProduct:newProduct);

    //upload images to firebase
    List <String> imagesURL=await appMethod.uploadProductImages(docID: productID,imageList: imageList);

    // check if error occurred while dding image to firebase,if occurred terminate

    if(imagesURL.contains(error)){
      closeProgressDialog(context);
      showSnackBar("Image Upload Error, Contact developer.", scaffoldKey);
    }
    //update information after upload image fil to the storage
    bool result =await appMethod.updateProductImages(docID: productID,data:imagesURL);

    if(result != null && result==true){
      closeProgressDialog(context);
      resetEverything();
      showSnackBar("Product added successfully", scaffoldKey);

    }else{
      closeProgressDialog(context);
      showSnackBar("An Error Occurred contact developer ", scaffoldKey);
    }

  }

  void resetEverything() {
    imageList.clear();
    productTitleController.text="";
    productPriceController.text="";
    productDescController.text="";
    selectedCategory="select product category";
    selectedColor="select a color";
    selectedSize="select a size";
    setState(() {

    });
  }
}





















