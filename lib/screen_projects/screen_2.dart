import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Screen 2"),),

      body: Center(
        child: Column(
          children: [

            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            },
                child: const Text("One")
            )

          ],
        ),
      ),
    );
  }
}
