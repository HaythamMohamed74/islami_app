import 'package:flutter/material.dart';
import 'package:quran/screens/widgets/azkar_widgets/list_of_azkar.dart';

import '../core/constants/app_strings.dart';
import '../core/helper/data_functions.dart';

class AzkarScreen extends StatefulWidget {
  const AzkarScreen({Key? key}) : super(key: key);

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  final TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            AppStrings.azkarAndDoaa,
            style: TextStyle(fontFamily: AppStrings.tajwalFont),
          )),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: controller,
              textDirection: TextDirection.rtl,
              cursorColor: Colors.blue,
              onChanged: (value) {
                setState(() {
                  searchInList(query: value);
                });
              },
              decoration: InputDecoration(
                  hintText: AppStrings.searchAboutZekr,
                  hintStyle: const TextStyle(fontFamily:AppStrings.tajwalFont),
                  hintTextDirection: TextDirection.rtl,
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(15)),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(15))),
            ),
          ),
          Expanded(
            child: ListofAzkar(controller: controller),
          ),
        ],
      ),
    );
  }
}
