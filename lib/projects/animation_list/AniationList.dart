import 'package:flutter/material.dart';


class AnimationTwoList extends StatefulWidget {
  const AnimationTwoList({Key? key}) : super(key: key);

  @override
  State<AnimationTwoList> createState() => _AnimationTwoListState();
}

class _AnimationTwoListState extends State<AnimationTwoList> {

  ScrollController  scrollController1=ScrollController();
  ScrollController  scrollController=ScrollController();
  double x=0;

  bool heightscrollController=false;
  @override
  void initState() {
    super.initState();
    try{
      scrollController.addListener(() {
        setState(() {
          print(scrollController.offset);
          heightscrollController=scrollController.offset>150;
          x=scrollController.offset/101;
        });
      });
    }catch(_){}

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body:Column(
          children: [




            AnimatedOpacity(opacity: heightscrollController==true?0:1,
                duration: const Duration(seconds: 1),
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  height: heightscrollController==true?0:200,
                  // height: scrollController.initialScrollOffset>150?0:200,
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: 200,
                    child: ListView.builder(
                      controller: scrollController1,
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context,index){
                        return Container(
                          height: 150,
                          width: 150,
                          margin: const EdgeInsets.only(left: 11,right: 11),
                          decoration: BoxDecoration(
                              color: Color(int.tryParse("0xff""$index"" 123df")??0xff0123df),
                              borderRadius: BorderRadius.circular(15)
                          ),
                        );
                      },
                    ),
                  ),
                )
            ),




            const SizedBox(height: 22,),

            Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: scrollController,
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (context,index){
                    var scale=1.0;
                    if(x>.5){
                      scale=index+.5 -x;
                      // if(scale<0){
                      //     scale=0.0;
                      //
                      // }else{
                      //     scale=1.0;
                      // }
                      if (scale < 0) {
                        scale = 0;
                      } else if (scale > 1) {
                        scale = 1;
                      }
                    }
                    return Transform(
                      transform:Matrix4.identity()
                      ..scale(scale)
                      ..setEntry(3, 2, .001)
                      ,
                    child: Align(
                      heightFactor: 0.7,
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(left: 11,right: 11,top: 11,bottom: 11),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              width: .5,
                              color: Colors.grey,
                            )
                        ),
                        transform: Matrix4.identity()
                        // ..scale(.912)
                          ..setEntry(3, 2, .001),
                      ),
                    )
                      ,);
                  },
                ),
            )

          ],
        )
    );
  }
}
