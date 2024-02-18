import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.controller,
      this.initialValue,
      this.onChanged,
      this.labelText,
      this.maxLines,
      this.hintText,
      this.stream});

  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? labelText;
  final int? maxLines;
  final String? hintText, initialValue;
  final Stream? stream;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: stream,
        builder: (context, snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(labelText!, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),),
             SizedBox(height: 8,), Container(
                margin: const EdgeInsets.only(bottom: 22), 
                child: TextFormField(
              initialValue: initialValue,
                  controller: controller,
                  onChanged: onChanged,
                 maxLines: maxLines ?? 1,
                  decoration: InputDecoration(
                    
                    hintStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w100),
                     hintText: hintText,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff503C3C)),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
