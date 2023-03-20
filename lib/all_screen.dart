import 'package:animation_app/projects/animation_list/AniationList.dart';
import 'package:animation_app/projects/coffee_app/coffee_app.dart';
import 'package:animation_app/projects/slider/HomeSlider.dart';
import 'package:animation_app/projects/transform_widgiet/transform_widgiet.dart';
import 'package:animation_app/screen_projects/screen_1.dart';
import 'package:flutter/material.dart';

class AllScreen extends StatefulWidget {
  const AllScreen({Key? key}) : super(key: key);

  @override
  State<AllScreen> createState() => _AllScreenState();
}

class _AllScreenState extends State<AllScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("All Screen"),),

      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 22,right: 22),
        child: Column(
          children: [

            const SizedBox(height: 12,),

            ElevatedButton(
                onPressed: (){
                  Navigator.push(context,  MaterialPageRoute(builder: (ctx) => const Screen1()),);
                },
                child:  const Center(
                  child: Text("animation_route"),
                )
            ),




            ElevatedButton(
                onPressed: (){
                  Navigator.push(context,  MaterialPageRoute(builder: (ctx) => const CoffeeApp()),);
                },
                child:  const Center(
                  child: Text("CoffeeApp"),
                )
            ),


            ElevatedButton(
                onPressed: (){
                  Navigator.push(context,  MaterialPageRoute(builder: (ctx) => const HomeSlider()),);
                },
                child:  const Center(
                  child: Text("Slider"),
                )
            ),


            ElevatedButton(
                onPressed: (){
                  Navigator.push(context,  MaterialPageRoute(builder: (ctx) => const TransformWidget()),);
                },
                child:  const Center(
                  child: Text("transform_widget"),
                )
            ),


            ElevatedButton(
                onPressed: (){
                  Navigator.push(context,  MaterialPageRoute(builder: (ctx) => const AnimationTwoList()),);
                },
                child:  const Center(
                  child: Text("Animation List"),
                )
            ),
            



          ],
        ),
      ),
    );
  }
}
