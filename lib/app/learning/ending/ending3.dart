import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../authentication/auth_controller.dart';
import '../../home/home.dart';
import '../../quiz/notebook/selected_word.dart';

class Ending3 extends StatefulWidget {
  const Ending3({Key? key, this.indexTopic = 0}) : super(key: key);
  final int indexTopic;

  @override
  State<Ending3> createState() => _Ending3State();
}

class _Ending3State extends State<Ending3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Text("Chọn từ vựng mà bạn muốn ôn tập",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500)),
              SelectedWord(indexTopic: widget.indexTopic),
              ElevatedButton(
                onPressed: () {
                    AuthController.to.updateUserFireStore();
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(300, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: const Text('Update FS', style: TextStyle(fontSize: 20)),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    Get.offAll(const HomeUI(), transition: Transition.fadeIn);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      fixedSize: const Size(270, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text(
                    'HỌC TỪ MỚI',
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}