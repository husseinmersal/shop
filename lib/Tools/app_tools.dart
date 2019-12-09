import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop/Tools/progressdialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
Widget AppTextField({IconData textIcon, String textHint, bool isPassword, double sidePadding, TextInputType textType, TextEditingController controller, int FieldLength}) {
  //this expression mean if and else
  sidePadding == null ? sidePadding = 0.0 : sidePadding;
  textHint == null ? textHint = "" : textHint;
  FieldLength== null ? FieldLength=30 : FieldLength;
  textType== null ? textType=TextInputType.text : textType;
  return Padding(
    padding: EdgeInsets.only(left: sidePadding, right: sidePadding),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: TextField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(FieldLength),
        ],
        controller: controller,
        obscureText: isPassword == null ? false : isPassword,keyboardType:textType,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: textHint,
          prefixIcon: textIcon == null ? Container() : Icon(textIcon),
        ),
      ),
    ),
  );
}

Widget AppButton(
    {String btnTxt, double btnPadding, Color btnTxtColor, Color btnBackColor, VoidCallback onbtnclicked}) {
  btnTxt == null ? btnTxt = "App Button" : btnTxt;
  btnPadding == null ? btnPadding = 0.0 : btnPadding;
  btnTxtColor == null ? btnTxtColor = Colors.black : btnTxtColor;
  btnBackColor == null ? btnBackColor = Colors.white : btnBackColor;
  return Padding(
    padding: EdgeInsets.only(left: btnPadding, right: btnPadding),
    child: RaisedButton(
      color: btnBackColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      onPressed: onbtnclicked,
      child: Container(
        height: 60.0,
        child: Center(
          child: Text(
            btnTxt, style: TextStyle(color: btnTxtColor, fontSize: 18.0),),
        ),
      ),
    ),
  );
}

Widget productTextField({String textTitle, String textHint, double height, TextEditingController controller, TextInputType textType,int maxLines})

        {textTitle == null ? textTitle = "Enter Title" : textTitle;
        textHint == null ? textHint = "Enter Hint" : textHint;
        height == null ? height = 50.0 : height;
  //height !=null

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      new Padding(
        padding: const EdgeInsets.all(8.0),
          child: new Text(
            textTitle,
            style:
            new TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
          ),

      ),
      new Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: new Container(
          height: height,
          decoration: new BoxDecoration(
              color: Colors.white,
              border: new Border.all(color: Colors.white),
              borderRadius: new BorderRadius.all(new Radius.circular(4.0))),
          child: new Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: new TextField(
              controller: controller,
              keyboardType: textType == null ? TextInputType.text : textType,maxLines: maxLines==null ? null :maxLines,
              decoration: new InputDecoration(
                  border: InputBorder.none, hintText: textHint),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget productDropDown({String textTitle, String selectedItem, List<DropdownMenuItem<String>> dropDownItems, ValueChanged<String> changedDropDownItems}) {

  textTitle == null ? textTitle = "Enter Title" : textTitle;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      new Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Text(
          textTitle,
          style:
          new TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: Container(
          decoration: new BoxDecoration(
              color: Colors.white,
              border: new Border.all(color: Colors.white),
              borderRadius: new BorderRadius.all(new Radius.circular(4.0))),
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: new DropdownButtonHideUnderline(
                child: new DropdownButton(
                  value: selectedItem,
                  items: dropDownItems,
                  onChanged: changedDropDownItems,
                )),
          ),
        ),
      ),
    ],
  );
}



Widget MultiImagePickerMap(
    {Map<int, File> imageList,
      VoidCallback addNewImage(int position),
      VoidCallback removeNewImage(int position)}) {
  int imageLength = imageList.isEmpty ? 1 : imageList.length + 1;
  bool isNull = imageList.isEmpty ? true : false;

  print("Image length is $imageLength");

  return new Padding(
    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
    child: new SizedBox(
      height: 150.0,
      child: new ListView.builder(
          itemCount: imageLength,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return imageList.isEmpty || imageList[index] == null
                ? new Padding(
              padding: new EdgeInsets.only(left: 3.0, right: 3.0),
              child: new GestureDetector(
                onTap: () {
                  addNewImage(index);
                },
                child: new Container(
                  width: 150.0,
                  height: 150.0,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      new Icon(
                        Icons.image,
                        size: 150.0,
                        color: Theme.of(context).primaryColor,
                      ),
                      new Icon(
                        Icons.add_circle,
                        size: 25.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    new BorderRadius.all(new Radius.circular(15.0)),
                  ),
                ),
              ),
            )
                : new Padding(
              padding: new EdgeInsets.only(left: 3.0, right: 3.0),
              child: new Stack(
                children: <Widget>[
                  new Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: new BoxDecoration(
                        color: Colors.grey.withAlpha(100),
                        borderRadius: new BorderRadius.all(
                            new Radius.circular(15.0)),
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: new FileImage(imageList[index]))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: new CircleAvatar(
                      backgroundColor: Colors.red[600],
                      child: new IconButton(
                          icon: new Icon(
                            Icons.clear,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            removeNewImage(index);
                          }),
                    ),
                  )
                ],
              ),
            );
          }),
    ),
  );
}

Widget MultiImagePickerList(
    {List<File> imageList, VoidCallback removeNewImage(int position)}) {
  return new Padding(
    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
    child: imageList == null || imageList.length == 0
        ? new Container()
        : new SizedBox(
      height: 150.0,
      child: new ListView.builder(
          itemCount: imageList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return new Padding(
              padding: new EdgeInsets.only(left: 3.0, right: 3.0),
              child: new Stack(
                children: <Widget>[
                  new Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: new BoxDecoration(
                        color: Colors.grey.withAlpha(100),
                        borderRadius: new BorderRadius.all(
                            new Radius.circular(15.0)),
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: new FileImage(imageList[index]))),
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: new CircleAvatar(
                      backgroundColor: Colors.red[600],
                      child: new IconButton(
                          icon: new Icon(
                            Icons.clear,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            removeNewImage(index);
                          }),
                    ),
                  )
                ],
              ),
            );
          }),
    ),
  );
}

Widget buildImages({int index, Map imagesMap}) {
  return imagesMap.isEmpty
      ? new Container(
    width: 150.0,
    height: 150.0,
    child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        new Icon(
          Icons.image,
          size: 100.0,
          color: Colors.white,
        ),
        new Icon(
          Icons.add_circle,
          color: Colors.grey,
        ),
      ],
    ),
    decoration: new BoxDecoration(
      color: Colors.grey.withAlpha(100),
    ),
  )
      : imagesMap[index] != null
      ? new Container(
    width: 150.0,
    height: 150.0,
    decoration: new BoxDecoration(
        color: Colors.grey.withAlpha(100),
        image: new DecorationImage(
            fit: BoxFit.cover,
            image: new FileImage(imagesMap[index]))),
  )
      : new Container(
    width: 150.0,
    height: 150.0,
    child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        new Icon(
          Icons.image,
          size: 100.0,
          color: Colors.white,
        ),
        new Icon(
          Icons.add_circle,
          color: Colors.grey,
        ),
      ],
    ),
    decoration: new BoxDecoration(
      color: Colors.grey.withAlpha(100),
    ),
  );
}


List<DropdownMenuItem<String>> buildAndGetDropDownItems(List size) {
  List<DropdownMenuItem<String>> items = new List();
  for (String size in size) {
    items.add(new DropdownMenuItem(value: size, child: new Text(size)));
  }
  return items;
}

showSnackBar(String message, final scaffoldKey) {
  scaffoldKey.currentState.showSnackBar(SnackBar(backgroundColor: Colors.white,
      content: Text(message, style: TextStyle(color: Colors.redAccent),)));
}

displayProgressDialog(BuildContext context) {
  Navigator.of(context).push(new PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) {
        return new ProgressDialog();
      }));
}

closeProgressDialog(BuildContext context) {
  Navigator.of(context).pop();
}

writeDataLocally({String key, String value}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  localData.setString(key, value);
}

writeBoolDataLocally({String key, bool value}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  localData.setBool(key, value);
}

getDataLocally({String key}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  return localData.get(key);
}

getStringDataLocally({String key}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  return localData.getString(key);
}

getBoolDataLocally({String key}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  return localData.getBool(key) == null ? false : localData.getBool(key);
}

clearDataLocally() async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  localData.clear();
}


















