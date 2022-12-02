import 'data_model.dart';

List<DataModel> numbers = [
  DataModel(value: '1', status: false),
  DataModel(value: '2', status: false),
  DataModel(value: '3', status: false),
  DataModel(value: '4', status: false),
  DataModel(value: '5', status: false),
  DataModel(value: '6', status: false),
  DataModel(value: '7', status: false),
  DataModel(value: '8', status: false),
  DataModel(value: '9', status: false),
  DataModel(value: '10', status: false),
  DataModel(value: '11', status: false),
];
List<DataModel> letters = [
  DataModel(value: 'a', status: false),
  DataModel(value: 'b', status: false),
  DataModel(value: 'c', status: false),
  DataModel(value: 'd', status: false),
  DataModel(value: 'e', status: false),
  DataModel(value: 'f', status: false),
  DataModel(value: 'g', status: false),
  DataModel(value: 'h', status: false),
  DataModel(value: 'i', status: false),
  DataModel(value: 'j', status: false),
  DataModel(value: 'k', status: false),
];

enum SectionTypes{
  Numbers,
  Letters
}

enum ConfigTypes{
  One,
  Two,
  Three,
  Four
}