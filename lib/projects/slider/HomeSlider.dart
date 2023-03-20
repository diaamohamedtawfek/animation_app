// ignore_for_file: empty_catches

import 'dart:async';

import 'package:animation_app/projects/coffee_app/model/coffee.dart';
import 'package:flutter/material.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({Key? key}) : super(key: key);

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {

  int _currentPage = 0;
  int _currentPageWithDot = 0;
  int _currentPageDot = 0;

  Timer? timer;
  var pageController=PageController(
    initialPage: 0,
    keepPage: false,
    viewportFraction: .8
  );

  var pageControllerWithDot=PageController(
    initialPage: 0,
    keepPage: false,
    viewportFraction: 0.80
  );



  @override
  void initState() {
    super.initState();


    // pageController.page!.round();
    timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      // if(_currentPage<4-1){
      if(_currentPageDot<Coffee.coffeeList.length-1) {
        _currentPageDot++;
        _currentPageWithDot++;
      }else{
        _currentPageDot=0;
        _currentPageWithDot=0;
      }
        _currentPage++;
        // _currentPageWithDot++;
      // }else{
      //     _currentPage=0;
      //     _currentPageWithDot=0;
      // }

      try {
        pageController.animateToPage(
          _currentPage,
          duration:const Duration(milliseconds: 100),
          curve: Curves.easeInCubic,
        );

        pageControllerWithDot.animateToPage(
          _currentPageWithDot,
          duration:const Duration(milliseconds: 100),
          curve: Curves.easeInCubic,
        );
      } catch (e) {
        print(e);
      }
    });

  }
  @override
  void dispose() {
    timer!.cancel();
    pageController.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Column(
            children: [


              // * PageView ----------------------------------------
              Container(
                height: 220,
                margin: const EdgeInsets.only(left: 22, right: 22),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(11),
                    child:
                    PageView.builder(
                        onPageChanged: (e) {
                          setState(() {

                          });
                        },
                        controller: pageController,
                        padEnds: true,
                        clipBehavior: Clip.hardEdge,
                        pageSnapping: true,
                        reverse: true,
                        physics: const ScrollPhysics(),
                        // physics: const ClampingScrollPhysics(),
                        allowImplicitScrolling: true,
                        itemBuilder: (context, index) {
                          var coffee = Coffee.coffeeList[index % 4];
                          return ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Container(
                                height: 200,
                                alignment: Alignment.center,
                                color: Color(int.parse(
                                    "0xff""$index""$index""31d$index")),
                                // color: Color(int.parse("0xff1233d$index")),
                                child: Image.asset(coffee.pathImage),
                              ));
                        }
                    )
                ),
              ),

              const SizedBox(height: 11,),

              // Container(
              //   height: 220,
              //   margin: const EdgeInsets.only(left: 22, right: 22),
              //   child: ClipRRect(
              //       borderRadius: BorderRadius.circular(11),
              //       child:
              //       PageView.builder(
              //           onPageChanged: (e) {
              //             // setState(() {
              //             //
              //             // });
              //           },
              //           allowImplicitScrolling: false,
              //           pageSnapping: false,
              //
              //           // controller: pageController,
              //           padEnds: true,
              //           itemCount: 4,//Coffee.coffeeList.length,
              //           itemBuilder: (context, index) {
              //             var coffee = Coffee.coffeeList[index];
              //             return  AnimatedBuilder(
              //               animation: pageController,
              //               builder: (context, widget) {
              //                 double value = 1;
              //                 if (pageController.position.haveDimensions) {
              //                   value = double.parse(pageController.page.toString()) - double.parse(index.toString());
              //                   value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
              //                 }
              //                 return Center(
              //                   child: Padding(
              //                     padding: const EdgeInsets.only(top: 125.0),
              //                     child: SizedBox(
              //                       height: Curves.easeInOut.transform(value) * 300,
              //                       width: Curves.easeInOut.transform(value) * 300,
              //                       child: widget,
              //                     ),
              //                   ),
              //                 );
              //               },
              //               child: Container(
              //                 margin: const EdgeInsets.all(2),
              //                 child: ClipRRect(
              //                     borderRadius: BorderRadius.circular(14),
              //                     child: Container(
              //                       height: 200,
              //                       alignment: Alignment.center,
              //                       color: Color(int.parse(
              //                           "0xff""$index""$index""31d$index")),
              //                       // color: Color(int.parse("0xff1233d$index")),
              //                       child: Image.asset(coffee.pathImage),
              //                     )),
              //               ),
              //             );
              //           }
              //       )
              //   ),
              // )




              // * PageView With Dot----------------------------------------

              const SizedBox(height: 11,),
              const SizedBox(height: 11,),
              Column(
                children: [
                  Container(
                    height: 220,
                    margin: const EdgeInsets.only(left: 22, right: 22),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(11),
                        child:
                        PageView.builder(
                            onPageChanged: (e) {
                              setState(() {
                              });
                            },
                            controller: pageControllerWithDot,
                            padEnds: true,
                            pageSnapping: true,
                            reverse: true,
                            physics: const ScrollPhysics(),
                            // physics: const ClampingScrollPhysics(),
                            itemCount: Coffee.coffeeList.length,
                            allowImplicitScrolling: true,
                            itemBuilder: (context, index) {
                              var coffee = Coffee.coffeeList[index % Coffee.coffeeList.length];
                              double angle =double.parse("${(_currentPageWithDot - index).abs()}");
                              if(angle>0.5){
                                angle = 1-angle;
                              }
                              return Transform(
                                transform: Matrix4.identity()
                                  ..setEntry(3, 2, .001)
                                ..rotateY(angle)
                                ..rotateX(angle),
                                alignment: Alignment.center,
                                child: Container(
                                  margin: const EdgeInsets.all(12),
                                  height: 200,
                                  decoration: BoxDecoration(
                                      color: Color(int.parse(
                                          "0xff""$index""$index""31d$index")),
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                  alignment: Alignment.center,

                                  // color: Color(int.parse("0xff1233d$index")),
                                  child: AnimatedOpacity(opacity: _currentPageWithDot == index?1:0,
                                    duration: const Duration(microseconds: 750),
                                    child: Image.asset(coffee.pathImage),
                                  ),
                                ),
                              );
                            }
                        )
                    ),
                  ),

                 const SizedBox(height: 8,),

                  SizedBox(
                    height: 12,
                    width: MediaQuery.of(context).size.width,
                    child:  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 12,
                            child:  ListView.builder(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: Coffee.coffeeList.length,
                            itemBuilder: (context, index) {
                              return Center(
                                  child:AnimatedContainer(
                                    duration: const Duration(
                                      milliseconds: 350
                                    ),
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.only(left: 5,right: 5),
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: _currentPageDot == index
                                          ? Colors.orange
                                          : Colors.grey,
                                      borderRadius: _currentPageDot==index?
                                      BorderRadius.circular(4):BorderRadius.circular(12),
                                      // shape: BoxShape.circle
                                    ),
                                    width: _currentPageDot == index  ? 22 : 11,
                                  )
                              );
                            }
                        )
                              )
                      ],
                    ),

                  ),


                ],
              ),

            ]
        )
    );
  }
}
