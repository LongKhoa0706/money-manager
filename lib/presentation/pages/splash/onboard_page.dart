
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class OnboardPage extends StatefulWidget {
  /// Create a OnboardPage widget.
  OnboardPage({
    Key key,
  }): super(key: key);

  /// Creates the mutable state for this widget at a given location in the tree.
  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  SwiperController swiperController = SwiperController();
  int currentIndex = 0;

  List<String> listTitle = <String>[
    'Savings Money',
    'Wallet',
    'Smart Invest',
  ];

  List<String> listImage = <String>[
    'assets/image/onboard/onboard1.png',
    'assets/image/onboard/onboard2.png',
    'assets/image/onboard/onboard3.png',
  ];

  /// Called when this state first inserted into tree.
  @override
  void initState()  {
    super.initState();
  }

  /// Called when a dependency of this state object changes.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  /// Called whenever the widget configuration changes.
  @override
  void didUpdateWidget(OnboardPage old) {
    super.didUpdateWidget(old);
  }

  /// Called when this state removed from the tree.
  @override
  void dispose() {
    super.dispose();
    swiperController.dispose();
  }

  /// Build the widget with this state.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Stack(
          children: <Widget>[
            Swiper(
              index: currentIndex,
              controller: swiperController,
              loop: false,
              pagination: SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                  color: Colors.orange,
                  activeColor: Colors.black,
                ),
              ),
              onIndexChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemCount: listTitle.length,
              itemBuilder: (context, index) {
                return IntroItem(
                  title: listTitle[index],
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
                  Navigator.of(context).pushNamed('/home');
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.75),
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class IntroItem extends StatelessWidget {
  const IntroItem({
    Key key,
    @required this.title,
    @required this.image,
  }): assert(title != null),
      assert(image != null),
      super(key: key);

  final String title;
  final String image;

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
          const SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
