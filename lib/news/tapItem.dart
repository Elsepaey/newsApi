import 'package:flutter/material.dart';

import '../model/sorce_response.dart';



class TapItem extends StatelessWidget {

  Source source ;
  bool  is_selected  ;
  TapItem({super.key, required this.source,required this.is_selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
          color:is_selected?Color(0xFF66C649).withOpacity(0.5):const Color(0xFFD9D9D9).withOpacity(0.5) ),

      child: Text("${source.name}",style: TextStyle(color: Colors.black),),
    );
  }
}
