import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/word_model.dart';

class TypeWithHintQuizController extends GetxController {
  late TextEditingController inputController;
  RxBool rxShowCheckButton = RxBool(false);
  RxBool rxIsChangeButton = RxBool(false);
  RxBool rxIsCheckButtonActive = RxBool(false);
  RxBool rxResult = RxBool(false);
  RxBool rxIsVisibleMeaning = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    inputController = TextEditingController();
  }

  @override
  void onClose() {
    inputController.dispose();
    super.onClose();
  }

  checkResult(String value, WordModel quizWord) {
    if (value.length == quizWord.word.length) {
      rxShowCheckButton.value = true;
      if (value.toLowerCase().trim() == quizWord.word) {
        rxResult.value = true;
      } else {
        rxResult.value = false;
      }
    } else {
      rxShowCheckButton.value = false;
    }
  }

  void changeButton() {
    rxIsCheckButtonActive.value = true;
    rxIsChangeButton.value = true;
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
