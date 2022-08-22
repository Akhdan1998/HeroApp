import 'package:flutter/material.dart';
import 'package:heroapp/model.dart';
import 'package:supercharged/supercharged.dart';

class avatar extends StatefulWidget {
  final Select? select;
  final bool? isActiv;
  final ValueChanged<String>? onSelected;

  avatar({this.select, this.isActiv = false, this.onSelected});

  @override
  State<avatar> createState() => _avatarState();
}

class _avatarState extends State<avatar> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          widget.onSelected!(widget.select!.id!);
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red.shade50,
            border: Border.all(
                color:
                    widget.isActiv == true ? 'EB5C5C'.toColor() : Colors.white,
                width: 2),
          ),
          width: 60,
          height: 60,
          alignment: Alignment.center,
          child: Container(
            height: 30,
            width: 30,
            child: Image.asset(widget.select!.image!),
          ),
        ),
      ),
    );
  }
}
