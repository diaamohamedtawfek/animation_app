import 'package:animation_app/animatonApp/animation_route.dart';
import 'package:animation_app/screen_projects/screen_2.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Screen 1"),),

      body: Center(
        child: Column(
          children: [

            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                  SliderRight(const Screen2()),
              );
            },
                child: const Text("SliderRight -> Two")
            ),

            const SizedBox(height: 30,),

            ElevatedButton(onPressed: (){
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (ctx) => const Screen2()),
              // );
              Navigator.push(
                context,
                  ScalRight(const Screen2()),
              );
            },
                child: const Text("ScalRight -> Two")
            )

          ],
        ),
      ),
    );
  }
}
