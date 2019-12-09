import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//my imports
import 'package:shop/Tools//product_details.dart';

//that mean products will change
class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "Men Blazer",
      "picture": "assets/images/products/blazer1.jpeg",
      "old_price": 120,
      "price": 85,
      "rating": 0.0,
      "details":
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing",
    },
    {
      "name": "Wamen Blazer",
      "picture": "assets/images/products/blazer2.jpeg",
      "old_price": 100,
      "price": 50,
      "rating": 0.0,
      "details":
          "packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like",
    },
    {
      "name": "Red Dress",
      "picture": "assets/images/products/dress1.jpeg",
      "old_price": 200,
      "price": 150,
      "rating": 0.0,
      "details":
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet",
    },
    {
      "name": "Dress",
      "picture": "assets/images/products/dress3.jpg",
      "old_price": 2000,
      "price": 1700,
      "rating": 0.0,
      "details":
          "tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
    },
    {
      "name": "Black Dress",
      "picture": "assets/images/products/dress2.jpeg",
      "old_price": 1200,
      "price": 1000,
      "rating": 0.0,
      "details":
          "comes from sections 1.10.32 and 1.10.33 of The Extremes of Good and Evil by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum comes from a line in section 1.10.32."
    },
    {
      "name": "Wamen shoe",
      "picture": "assets/images/products/hills1.jpeg",
      "old_price": 500,
      "price": 300,
      "rating": 0.0,
      "details":
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum",
    },
    {
      "name": "Red shoe",
      "picture": "assets/images/products/hills2.jpeg",
      "old_price": 400,
      "price": 225,
      "rating": 0.0,
      "details":
          "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham",
    },
    {
      "name": "Men Pant",
      "picture": "assets/images/products/pants2.jpeg",
      "old_price": 170,
      "price": 150,
      "rating": 0.0,
      "details":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
    },
    {
      "name": "Wamen Blouse",
      "picture": "assets/images/products/skt1.jpeg",
      "old_price": 700,
      "price": 600,
      "rating": 0.0,
      "details":
          "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam",
    },
    {
      "name": "pink Blouse",
      "picture": "assets/images/products/skt2.jpeg",
      "old_price": 650,
      "price": 200,
      "rating": 0.0,
      "details":
          "est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil",
    },
  ];

  @override
  Widget build(BuildContext context) {
    //make GridView from ProductList length {itemCount --> its mean num of products ,SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2) --> its mean that products will be two columns}
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Single_prod(
              prod_name: product_list[index]['name'],
              prod_picture: product_list[index]['picture'],
              prod_old_price: product_list[index]['old_price'],
              prod_price: product_list[index]['price'],
              prod_rating: product_list[index]['rating'],
              prod_details: product_list[index]['details'],
            ),
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;
  final prod_rating;
  final prod_details;

  Single_prod({
    this.prod_name,
    this.prod_picture,
    this.prod_old_price,
    this.prod_price,
    this.prod_rating,
    this.prod_details,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(alignment: FractionalOffset.topLeft, children: <Widget>[
        Hero(
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
                        product_detail_rating: prod_rating,
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
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 30.0,
              width: 50.0,
              decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5.0),
                    bottomRight: Radius.circular(5.0),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(
                    Icons.star,
                    color: Colors.yellow[800],
                  ),
                  Text(
                    "${prod_rating}",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            IconButton(icon: Icon(Icons.favorite_border,color: Colors.red,), onPressed: (){})
          ],
        ),
      ]),
    );
  }
}




























