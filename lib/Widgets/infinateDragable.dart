import 'dart:math';

import 'package:flutter/material.dart';

class InfiniteDragableWidget extends StatefulWidget {
  const InfiniteDragableWidget({
    super.key,
  });

  @override
  State<InfiniteDragableWidget> createState() => _InfiniteDragableWidgetState();
}

class _InfiniteDragableWidgetState extends State<InfiniteDragableWidget> {
  Offset getOffset(int stack){
  return {
    0:const Offset(0,30),
    1:const Offset(-70,30),
    2:const Offset(70,30),
  }[stack]??const Offset(0, 0);
  }
  double getAngle(int stack)=> {
      0:0.0,
      1:-pi*0.1,
      2:pi*0.1,

    }[stack]??0.0;
  double getScale(int index)=>{
    0:0.6,
    1:0.9,
    2:0.93
  }[index]??1.0;
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children:List.generate(5, (index) =>  SizedBox(
          height: 300,
          child: Transform.translate(
            offset: getOffset(index),
            child: Transform.scale(scale: getScale(index),child: Transform.rotate(
              angle: getAngle(index),
              child: Container(
                          width: 200,
                          height: 280,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.transparent,
                              image: const DecorationImage(
                                  image: AssetImage("front.jpg"),
                                  fit: BoxFit.fitWidth)),
                        ),
            ),))
                    ),) 
                    // [
       
            // ),
            // child: PageView.builder(
            //     controller: PageController(
            //         initialPage: 1, viewportFraction: 0.8),
            //     itemBuilder: (_, i) => Card(
            //           color: Colors.transparent,
            //           child: Container(
            //             width: double.infinity,
            //             height: 280,
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(15),
            //                 color: Colors.transparent,
            //                 image: const DecorationImage(
            //                     image: AssetImage("front.jpg"),
            //                     fit: BoxFit.fitWidth)),
            //           ),
            //         )
            );
  }
}
