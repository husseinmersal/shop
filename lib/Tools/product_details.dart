import 'package:flutter/material.dart';
import 'package:shop/UserScreens/cart.dart';
import 'package:shop/UserScreens/myhomepage.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_picture;
  final product_detail_old_price;
  final product_detail_price;
  final product_detail_rating;
  final product_detail_details;

  ProductDetails(
      {this.product_detail_name,
      this.product_detail_picture,
      this.product_detail_old_price,
      this.product_detail_price,
      this.product_detail_rating,
      this.product_detail_details});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  var _currencies = ['Red', 'Black', 'White', 'gray'];
  var _currentItemSelected = 'Black';

  @override
  Widget build(BuildContext context) {
    //==========to get Screen Size==============================================
    Size screenSize = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //===================To delete debug mode banner==========================
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0, // to remove AppBar shadow
          backgroundColor: Colors.red[300],
          title: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => myhomepage(),
                ),
              );
            },
            child: Text("Wear Shop"),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 300.0,
              child: GridTile(
                //==========Picture Section==========================
                child: Container(
                  color: Colors.white70,
                  // i typed widget before product_detail_picture because _ProductDetailsState is subclass from State<ProductDetails>
                  child: Image.asset(widget.product_detail_picture),
                ),
                footer: Container(
                  color: Colors.white38,
                  child: ListTile(
                    leading: Text(
                      widget.product_detail_name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    title: Row(
                      children: <Widget>[
                        // i put dollar sign to show that price is integer
                        Expanded(
                          child: Text(
                            "\$${widget.product_detail_old_price}",
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.black54,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "\$${widget.product_detail_price}",
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            new Icon(
                              Icons.star,
                              color: Colors.yellow[800],
                              size: 20.0,
                            ),
                            new SizedBox(
                              width: 5.0,
                            ),
                            new Text(
                              "${widget.product_detail_rating}",
                              style: new TextStyle(color: Colors.black),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //================Multiple Images====================
            Card(
              child: new Container(
                width: screenSize.width,
                height: 150.0,
                child: new ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return new Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          new Container(
                            margin: new EdgeInsets.only(left: 5.0, right: 5.0),
                            height: 140.0,
                            width: 100.0,
                            child:
                                new Image.asset(widget.product_detail_picture),
                          ),
                          new Container(
                            margin: new EdgeInsets.only(left: 5.0, right: 5.0),
                            height: 140.0,
                            width: 100.0,
                            decoration: new BoxDecoration(
                                color: Colors.grey.withAlpha(50)),
                          ),
                        ],
                      );
                    }),
              ),
            ),

            // =================the first buttons================
            Row(
              children: <Widget>[
                //         ========== the size button ===========
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Size"),
                            content: Text("Choose the size"),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: Text("Close"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    color: Colors.white,
                    textColor: Colors.grey,
                    elevation: 0.2,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text("Size"),
                        ),
                        Expanded(
                          child: Icon(Icons.arrow_drop_down),
                        ),
                      ],
                    ),
                  ),
                ),

//         ========== the color button ===========
                Expanded(
                  child: DropdownButton<String>(
                    items: _currencies.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    onChanged: (String newValueSelected) {
                      // Your code to execute, when a menu item is selected from drop down
                      _onDropDownItemSelected(newValueSelected);
                    },
                    value: _currentItemSelected,
                  ),
                ),

                //         ========== the Quantity button ===========
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Quantity"),
                            content: Text("Choose the quantity"),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: Text("Close"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    color: Colors.white,
                    textColor: Colors.grey,
                    elevation: 0.2,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text("Qty"),
                        ),
                        Expanded(
                          child: Icon(Icons.arrow_drop_down),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),

            // =================the second buttons================
            Row(
              children: <Widget>[
                //         ========== the buy button ===========
                Expanded(
                  child: MaterialButton(
                    onPressed: () {},
                    color: Colors.red,
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: Text("Buy Now"),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.red,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  color: Colors.red,
                  onPressed: () {},
                ),
              ],
            ),
            Divider(),
            // =================the Product Details================
            ListTile(
              title: Text("Product Details"),
              subtitle: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                child: Text(
                  widget.product_detail_details,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            // =================the Product name================
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                  child: Text(
                    'Product name:',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(widget.product_detail_name),
                ),
              ],
            ),
            // =================the Product brand================
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                  child: Text(
                    'Product brand:',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text("Brand X"),
                )
              ],
            ),
            // =================the Product state================
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                  child: Text(
                    'Product state:',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text("New"),
                )
              ],
            ),

            Divider(),
            //=====================Similar product section================
            Padding(
              padding: const EdgeInsets.fromLTRB(1.0, 0.0, 0.0, 4.0),
              child: Text("Similar Products"),
            ),
            Container(
              height: 340.0,
              child: SimilarProducts(),
            ),
          ],
        ),
        //=================floatingActionButton====================
        floatingActionButton: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            FloatingActionButton(
              backgroundColor: Colors.red[300],
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Cart(),
                ),
              ),
              child: Icon(Icons.shopping_cart),
            ),
            CircleAvatar(
              radius: 10.0,
              backgroundColor: Colors.red,
              child: Text(
                '0',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            )
          ],
        ),
        //=================floatingActionButtonLocation============
        //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }
}

class SimilarProducts extends StatefulWidget {
  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
  //===================== the products attributes ================
  var product_list = [
    {
      "name": "Men Blazer",
      "picture": "assets/images/products/blazer1.jpeg",
      "old_price": 120,
      "price": 85,
      "details":
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing",
    },
    {
      "name": "Red Dress",
      "picture": "assets/images/products/dress1.jpeg",
      "old_price": 200,
      "price": 150,
      "details":
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet",
    },
    {
      "name": "Black Dress",
      "picture": "assets/images/products/dress2.jpeg",
      "old_price": 1200,
      "price": 1000,
      "details":
          "comes from sections 1.10.32 and 1.10.33 of The Extremes of Good and Evil by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum comes from a line in section 1.10.32."
    },
    {
      "name": "Wamen shoe",
      "picture": "assets/images/products/hills1.jpeg",
      "old_price": 500,
      "price": 300,
      "details":
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum",
    },
  ];

  @override
  Widget build(BuildContext context) {
    // this class of main products
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Similar_Single_prod(
            prod_name: product_list[index]['name'],
            prod_picture: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
            prod_details: product_list[index]['details'],
          );
        });
  }
}

// this class of main products
class Similar_Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;
  final prod_details;

  Similar_Single_prod({
    this.prod_name,
    this.prod_picture,
    this.prod_old_price,
    this.prod_price,
    this.prod_details,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          // Hero tag doesn't take two names are equal OR you can name it any different name
          // tag: prod_name,
          tag: Text("SAYED"),
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  // here i pass values from product to product details
                  builder: (context) => ProductDetails(
                        product_detail_name: prod_name,
                        product_detail_picture: prod_picture,
                        product_detail_old_price: prod_old_price,
                        product_detail_price: prod_price,
                        product_detail_details: prod_details,
                      ))),
              child: GridTile(
                  footer: Container(
                      color: Colors.white30,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(0.0, 0.0, 3.0, 0.0),
                              child: Text(
                                prod_name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                            ),
                          ),
                          Text(
                            "\$$prod_price",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            "\$$prod_old_price",
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w800,
                              fontSize: 14.0,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      )),
                  // if you forget to put child you will get great error
                  child: Image.asset(
                    prod_picture,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}
