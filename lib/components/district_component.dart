import 'package:flutter/material.dart';

class DistrictComponent extends StatelessWidget {
  final String? text;
  final String text1;
  final Function()? onTap;
  final Widget? child;
  const DistrictComponent({super.key, required this.text, required this.text1, this.onTap, this.child});

  @override
  Widget build(BuildContext context) {
    return Card(

      elevation: 2,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.green,width: 2)
          ),
          child: Row(
            children: [
              Text(text1,style: TextStyle(fontSize: 20,color: Colors.green.shade800,fontWeight: FontWeight.w400),),
              SizedBox(width: 20,),

              Text(text!,style: TextStyle(fontSize: 20,color: Colors.green.shade800,fontWeight: FontWeight.w400),),

            Spacer(flex: 2,),
              Expanded(flex: 1,
                child: child ?? SizedBox(),),
            ],
          ),),
      ),
    );
  }
}
