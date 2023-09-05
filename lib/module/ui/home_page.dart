import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_colors.dart';
import '../../widgets/list_widget.dart';
import '../../widgets/text_with_format.dart';
import '../get_controller/home_page_get_controller.dart';

class HomePage extends StatelessWidget {
  HomePageGetController getController = Get.put(HomePageGetController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const TextWithFormat(
              'Code Challenge DevDigital',
              color: AppColors.white,
              fontSize: 18,
              bold: true,
            ),
            backgroundColor: AppColors.primaryColor,
          ),
          body: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListWidget(),
          )),
          floatingActionButton: FloatingActionButton(
              elevation: 0.0,
              backgroundColor: AppColors.primaryColor,
              onPressed: () {
                getController.addNewTimer();
              },
              child: const Icon(Icons.add))),
    );
  }
}
