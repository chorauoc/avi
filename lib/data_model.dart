/// value : "a"
/// status : false

class DataModel {
  DataModel({
    String? value,
    bool? status,
  }) {
    _value = value;
    _status = status;
  }

  DataModel.fromJson(dynamic json) {
    _value = json['value'];
    _status = json['status'];
  }
  String? _value;
  bool? _status;


  set status(bool? value) {
    _status = value;
  }

  DataModel copyWith({
    String? value,
    bool? status,
  }) =>
      DataModel(
        value: value ?? _value,
        status: status ?? _status,
      );
  String? get value => _value;
  bool? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = _value;
    map['status'] = _status;
    return map;
  }
}
