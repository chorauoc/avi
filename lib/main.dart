import 'package:avi/raw.dart';
import 'package:avi/widgets/config_row_widget.dart';
import 'package:avi/widgets/data_list_widget.dart';
import 'package:avi/widgets/horizontal_divider_widget.dart';
import 'package:avi/widgets/status_row_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'data_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', 'US')],
        path: 'assets/translations',
        fallbackLocale: Locale('en', 'US'),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<DataModel> selected = [];
  List<DataModel> selectedNumbers = [];
  List<DataModel> selectedLetters = [];
  var listSize = 0;
  var errMsg = '';
  bool isError = false;
  bool isSucess = false;
  var configOneTextEditingController = TextEditingController();
  var configTwoTextEditingController = TextEditingController();
  var configThreeTextEditingController = TextEditingController();
  var configFourTextEditingController = TextEditingController();

  @override
  void dispose() {
    configOneTextEditingController.dispose();
    configTwoTextEditingController.dispose();
    configThreeTextEditingController.dispose();
    configFourTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration:
              BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
          child: Column(
            children: <Widget>[
              buildConfigOne(context),
              const HorizontalDivider(),
              buildConfigTwo(context),
              buildConfigThree(context),
              buildConfigFour(context),
              const HorizontalDivider(),
              buildDataListSection(),
              buildStatusSection(),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget buildConfigFour(BuildContext context) {
    return ConfigRow(
      controller: configFourTextEditingController,
      text: 'key_2',
      onChanged: (s) {
        onConfigCallback(context: context, val: s, type: ConfigTypes.Four);
      },
    );
  }

  Widget buildConfigThree(BuildContext context) {
    return ConfigRow(
      controller: configThreeTextEditingController,
      text: 'key_3',
      onChanged: (s) {
        onConfigCallback(context: context, val: s, type: ConfigTypes.Three);
      },
    );
  }

  Widget buildConfigTwo(BuildContext context) {
    return ConfigRow(
      controller: configTwoTextEditingController,
      text: 'key_4',
      onChanged: (s) {
        onConfigCallback(context: context, val: s, type: ConfigTypes.Two);
      },
    );
  }

  Widget buildConfigOne(BuildContext context) {
    return ConfigRow(
      controller: configOneTextEditingController,
      text: 'key_1',
      onChanged: (s) {
        onConfigCallback(context: context, val: s, type: ConfigTypes.One);
      },
    );
  }

  Widget buildStatusSection() {
    return StatusRow(
      onClear: () {
        configOneTextEditingController.clear();
        configTwoTextEditingController.clear();
        configThreeTextEditingController.clear();
        configFourTextEditingController.clear();
        listSize = 0;
        selectedNumbers.clear();
        selectedLetters.clear();
        selected.clear();
        errMsg = '';
        isSucess = false;
        isError = false;
        setState(() {});
      },
      text: errMsg,
      isError: isError,
      isSucess: isSucess,
    );
  }

  Widget buildDataListSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: DataList(
            type: SectionTypes.Letters,
            selected: selectedLetters,
            listSize: listSize,
            data: letters,
            onChanged: (item, isRemoved) {
              isRemoved
                  ? selectedLetters.remove(item)
                  : selectedLetters.add(item);
              addToSelection(SectionTypes.Letters, item, isRemoved);
            },
          ),
        ),
        Expanded(
          child: DataList(
            type: SectionTypes.Numbers,
            selected: selectedNumbers,
            listSize: listSize,
            data: numbers,
            onChanged: (item, isRemoved) {
              isRemoved
                  ? selectedNumbers.remove(item)
                  : selectedNumbers.add(item);
              addToSelection(SectionTypes.Numbers, item, isRemoved);
            },
          ),
        ),
      ],
    );
  }

  void addToSelection(type, item, isRemoved) {
    if (isRemoved && selected.isNotEmpty) {
      selected.remove(item);
    }
    if (selectedLetters.length > 6) {
      errMsg = 'key_5';
      isError = true;
      isSucess = false;
      setState(() {});
    } else if (selectedNumbers.length > 7) {
      errMsg = 'key_6';
      isError = true;
      isSucess = false;
      setState(() {});
    } else if ((selectedLetters.length + selectedNumbers.length) > 7) {
      errMsg = 'key_7';
      isError = true;
      isSucess = false;
      setState(() {});
    } else {
      if (!isRemoved) {
        selected.add(item);
      }
      errMsg = '';
      isError = false;
      if (selectedLetters.length + selectedNumbers.length == 7) {
        isSucess = true;
      } else {
        isSucess = false;
      }
      setState(() {});
    }
  }

  void onConfigCallback({
    required ConfigTypes type,
    required BuildContext context,
    required String val,
  }) {
    try {
      var rs = int.parse(val);
      switch (type) {
        case ConfigTypes.One:
          if (rs > 11) {
            errMsg = 'key_8';
            isError = true;
            configOneTextEditingController.clear();
            listSize = 0;
            setState(() {});
          } else {
            errMsg = '';
            isError = false;
            listSize = int.parse(val);
            setState(() {});
          }
          break;
        case ConfigTypes.Two:
          if (rs > 18) {
            errMsg = 'key_9';
            isError = true;
            configTwoTextEditingController.clear();
            setState(() {});
          } else {
            errMsg = '';
            isError = false;
            setState(() {});
          }
          break;
        case ConfigTypes.Three:
          if (rs > 9) {
            errMsg = 'key_10';
            isError = true;
            configThreeTextEditingController.clear();
            setState(() {});
          } else {
            errMsg = '';
            isError = false;
            setState(() {});
          }
          break;
        case ConfigTypes.Four:
          if (rs > 9) {
            errMsg = 'key_11';
            isError = true;
            configFourTextEditingController.clear();
            setState(() {});
          } else {
            errMsg = '';
            isError = false;
            setState(() {});
          }
          break;
      }
    } catch (e) {}
  }
}
