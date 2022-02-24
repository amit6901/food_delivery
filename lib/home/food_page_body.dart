import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.8);
  var _currPageValue = 0.0;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: PageView.builder(
          itemCount: 5,
          controller: pageController,
          itemBuilder: (context, position) {
            return _buildPageItem(position);
          }),
    );
  }

  Widget _buildPageItem(int index) {
    return Stack(children: [
      Container(
        height: 220,
        margin: EdgeInsets.only(left: 15, right: 15, top: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/image/food2.jpg"))),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 130,
          margin: EdgeInsets.only(left: 40, right: 40, bottom: 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: Container(
            padding: EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(text: "Burger Cheese"),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Wrap(
                      children: List.generate(
                          5,
                          (index) => Icon(
                                Icons.star,
                                color: AppColors.mainColor,
                                size: 15,
                              )),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    SmallText(text: "4.5"),
                    SizedBox(
                      width: 20,
                    ),
                    SmallText(text: "1287"),
                    SizedBox(
                      width: 5,
                    ),
                    SmallText(text: "Comments")
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    IconAndText(
                        icon: Icons.circle_sharp,
                        text: "Normal",
                        iconColor: Colors.yellowAccent),
                    SizedBox(
                      width: 15,
                    ),
                    IconAndText(
                        icon: Icons.location_on_sharp,
                        text: "1.7 km",
                        iconColor: AppColors.mainColor),
                    SizedBox(
                      width: 15,
                    ),
                    IconAndText(
                      icon: Icons.lock_clock,
                      text: "45 min",
                      iconColor: Colors.red.shade200,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
