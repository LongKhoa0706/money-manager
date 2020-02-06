import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class OnBoardScreen extends StatefulWidget {
  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  final _swiperController = SwiperController();
  int currentIndex = 0;
  List<String> _listTitle = [
    "Savings Money",
    "Wallet",
    "Smart Invest",
  ];
  List<String> listImage = [
    'assets/image/onboard/onboard1.png',
    'assets/image/onboard/onboard2.png',
    'assets/image/onboard/onboard3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Stack(
          children: <Widget>[
            Swiper(
              index: currentIndex,
              controller: _swiperController,
              itemCount: 3,
              loop: false,
              pagination: SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                      color: Colors.orange, activeColor: Colors.black)),
              onIndexChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, index) {
                return IntroItem(
                  title: _listTitle[index],
                  image: listImage[index],
                );
              },
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: RaisedButton(
                color: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/homescreen');
                },
                child: Text("Skip",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 15),),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class IntroItem extends StatelessWidget {
  final String title;
  final String image;

  const IntroItem({Key key, this.title, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 22),
          )
        ],
      ),
    );
  }
}
