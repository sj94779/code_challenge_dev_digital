import 'package:code_challenge_dev_digital/widgets/standard_button.dart';
import 'package:code_challenge_dev_digital/widgets/text_with_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../constants/dimens.dart';
import '../model/list_item_model.dart';
import '../module/get_controller/home_page_get_controller.dart';

class ListWidget extends StatefulWidget {
  const ListWidget({super.key});

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  HomePageGetController getController = Get.put(HomePageGetController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => Container(height: 8),
        itemCount: getController.todos.length,
        shrinkWrap: true,
        primary: false,
        itemBuilder: (context, index) {
          Task todo = getController.todos[index];

          return Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: AppColors.primaryColor),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: Get.width / 4,
                    decoration: BoxDecoration(
                      border:
                          Border.all(width: 2, color: AppColors.primaryColor),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: getController.valueController[index],
                          decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              border: InputBorder.none,
                              hintText: '60',
                              hintStyle: TextStyle(
                                  fontSize: 16, color: AppColors.primaryColor)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width / 3.5,
                    decoration: BoxDecoration(
                      border:
                          Border.all(width: 2, color: AppColors.primaryColor),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: TextWithFormat(
                        todo.duration,
                        color: AppColors.black,
                        fontSize: Dimens.fontSizeSubheading,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: StandardButton(
                      text: todo.isRunning
                          ? 'PAUSE'
                          : todo.count == 0
                              ? 'START'
                              : 'RESUME',
                      color: AppColors.primaryColor,
                      onPressed: () {
                        setState(() {
                          todo.startTime =
                              getController.valueController[index].text.isEmpty
                                  ? '60'
                                  : getController.valueController[index].text;
                          if (todo.count == 0) {
                            getController.duration[index] =
                                Duration(seconds: int.parse(todo.startTime));
                            setState(() {
                              todo = todo.copyWith(count: 1);
                              getController.todos
                                  .replaceRange(index, index + 1, [todo]);
                            });
                          }

                          if (todo.isRunning) {
                            getController.stopTimer(
                                resets: false, todo: todo, index: index);
                          } else {
                            getController.startTimer(
                                resets: false, todo: todo, index: index);
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
