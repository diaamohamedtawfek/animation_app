import 'package:flutter/material.dart';


class TransformWidget extends StatefulWidget {
  const TransformWidget({Key? key}) : super(key: key);

  @override
  State<TransformWidget> createState() => _TransformWidgetState();
}

class _TransformWidgetState extends State<TransformWidget> {

  var value=.5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),



      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Row(),
            const SizedBox(height: 22,),

            const FlutterLogo(size: 100,),
            const SizedBox(height: 42,),

            Transform.scale(
              scale: value*2,
              child: Image.asset("assets/coffee_challenge/img/4.png",fit: BoxFit.fill,width: 110,height: 110,),
            ),


            Transform.translate(
              offset:  Offset(value*-100,value*100),
              filterQuality:FilterQuality.medium ,
              child: Image.asset("assets/coffee_challenge/img/4.png",fit: BoxFit.fill,width: 110,height: 110,),
            ),


            Transform.rotate(
              angle: value*10,
              child: Image.asset("assets/coffee_challenge/img/4.png",fit: BoxFit.fill,width: 110,height: 110,),
            ),


            Transform(
              transform:
              Matrix4.identity()
              ..scale(value*2)
              ..setEntry(3, 2, 0.001)
              // ..rotateX(value*100)
              ..rotateY(value*10)
              ,
              alignment: Alignment.center,
              child: Image.asset("assets/coffee_challenge/img/4.png",fit: BoxFit.fill,width: 110,height: 110,),
            ),


            // Image.asset("assets/coffee_challenge/img/4.png",fit: BoxFit.fill,width: 220,height:220 ,),
            const SizedBox(height: 22,),



            Padding(
              padding: const EdgeInsets.only(left: 22,right: 22),
              child:  Slider(
                  value: value,
                  onChanged: (e){
                    setState(() {
                      value=e;

                    });
                  }
              ),
            ),


            const SizedBox(height: 22,),

            Text("Value Is :-  ${value.toStringAsFixed(1)}"),

          ],
        ),
      ),
    );
  }
}
