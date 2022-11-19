import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
Container animation(){
 return Container(
   alignment: Alignment.center,
   decoration: const BoxDecoration(
       image: DecorationImage(
         image: AssetImage('assets/bike.png'),
         fit: BoxFit.fitHeight

       )),
    width: double.infinity,
    child: Column(
       mainAxisAlignment: MainAxisAlignment.start,
      children: [
        LoadingAnimationWidget.prograssiveDots(
          color: Colors.black,
          size: 40,
        ),
        const Text(
          'Loading..',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}