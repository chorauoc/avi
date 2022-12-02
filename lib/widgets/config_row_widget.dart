import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ConfigRow extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  const ConfigRow({
    Key? key,
    required this.text,
    this.onChanged,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
              maxLines: 3,
            ).tr(),
          ),
          // Note: Same code is applied for the TextFormField as well
          Container(
            width: 50,
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(2),
              ],
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.blueAccent),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
