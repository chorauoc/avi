import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class StatusRow extends StatelessWidget {
  final String text;
  final bool isError;
  final bool isSucess;
  final void Function() onClear;
  const StatusRow({
    Key? key,
    required this.text,
    required this.onClear,
    required this.isError,
    required this.isSucess,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: onClear,
            child: Container(
              height: 50,
              color: Colors.purpleAccent,
              child: const Center(
                child: Text(
                  'Reset all values',
                  style: TextStyle(fontSize: 16),
                  maxLines: 3,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            height: 50,
            color: isError
                ? Colors.red
                : isSucess
                    ? Colors.green
                    : Colors.white,
            child: Center(
              child: Text(
                isSucess
                    ? 'key_12'
                    : isError
                        ? '$text'
                        : '',
                style: TextStyle(fontSize: 16),
                maxLines: 3,
              ).tr(),
            ),
          ),
        ),
      ],
    );
  }
}
