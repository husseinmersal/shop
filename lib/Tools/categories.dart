import 'package:flutter/material.dart';



// remember that StatelessWidget never change the state
class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      child: ListView(
        // this to scroll the horizontal ListView which under the Slider
        scrollDirection: Axis.horizontal,
        //items inside ListView
        children: <Widget>[
          Category(
            image_location: "assets/images/cats/tshirt.png",
            image_caption: 'shirt',
          ),
          Category(
            image_location: "assets/images/cats/dress.png",
            image_caption: 'dress',
          ),
          Category(
            image_location: "assets/images/cats/jeans.png",
            image_caption: 'pants',
          ),
          Category(
            image_location: "assets/images/cats/formal.png",
            image_caption: 'formal',
          ),
          Category(
            image_location: "assets/images/cats/informal.png",
            image_caption: 'informal',
          ),
          Category(
            image_location: "assets/images/cats/accessories.png",
            image_caption: 'accessories',
          ),
          Category(
            image_location: "assets/images/cats/shoe.png",
            image_caption: 'shoe',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({
    this.image_location,
    this.image_caption,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        //this will be the action when i click on product
        onTap: (){},
        child: Container(
          width: 85.0,
          child: ListTile(
            title: Image.asset(
              image_location,
              width: 60.0,
              height: 40.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(
                image_caption,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
