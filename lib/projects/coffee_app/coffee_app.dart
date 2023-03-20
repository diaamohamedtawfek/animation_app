import 'package:animation_app/projects/coffee_app/model/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeApp extends StatefulWidget {
  const CoffeeApp({Key? key}) : super(key: key);

  @override
  State<CoffeeApp> createState() => _CoffeeAppState();
}

class _CoffeeAppState extends State<CoffeeApp> {
  final coffeeList = Coffee.coffeeList;


  var _pageController=PageController(
    // initialPage: 0,
    viewportFraction: .45
  );


  double _currentPage=0.0;

  void coffeeScrolLisner(){
    setState(() {
      _currentPage=_pageController.page!;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController.addListener(coffeeScrolLisner);
  }
  @override
  void dispose() {
    super.dispose();
    _pageController.removeListener(coffeeScrolLisner);
    _pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [

            Container(
              height: 100,
              color: Colors.red,
            ),



            Transform.scale(
              scale: 1.6,
              alignment: Alignment.bottomCenter,
              child: PageView.builder(
                  scrollDirection: Axis.vertical,
                  controller: _pageController,
                  itemCount:coffeeList.length+1,
                  itemBuilder: (context, index) {
                    if(index==0){
                      return const SizedBox.shrink();
                    }
                    var coffee=coffeeList[index -1 ];
                    double result=_currentPage-index+1;
                    double value= -0.4 * result +1;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 42),
                      child: Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, .001)
                          ..translate(0.0,
                            MediaQuery.of(context).size.height/2.4*(1-value).abs()-65,
                          )
                          ..scale(value)

                        ,
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(coffee.pathImage),
                      ),
                    );
                  }
              ),
            ),


          ],
        ),
      ),
    );
  }
}
