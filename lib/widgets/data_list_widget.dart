import 'package:flutter/material.dart';

import '../data_model.dart';
import '../raw.dart';

class DataList extends StatefulWidget {
  const DataList({
    Key? key,
    required this.listSize,
    required this.data,
    required this.onChanged,
    required this.type,
    required this.selected,
  }) : super(key: key);

  final SectionTypes type;
  final int listSize;
  final List<DataModel> selected;
  final List<DataModel> data;
  final void Function(DataModel item, bool isRemoved) onChanged;

  @override
  State<DataList> createState() => _DataListState();
}

class _DataListState extends State<DataList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.listSize,
      itemBuilder: (context, index) {
        var item = widget.data.elementAt(index);
        return CheckboxListTile(
          title: Text(item.value ?? ''),
          value: item.status,
          onChanged: (newValue) {
            if (widget.type == SectionTypes.Letters) {
              if (widget.selected.length <= 6 && newValue != null && newValue) {
                item.status = newValue;
                widget.onChanged(item, false);
              } else {
                item.status = false;
                widget.onChanged(item, true);
              }
            } else {
              if (widget.selected.length <= 7 && newValue != null && newValue) {
                item.status = newValue;
                widget.onChanged(item, false);
              } else {
                item.status = false;
                widget.onChanged(item, true);
              }
            }

            setState(() {});
          },
          controlAffinity:
              ListTileControlAffinity.leading, //  <-- leading Checkbox
        );
      },
    );
  }
}
