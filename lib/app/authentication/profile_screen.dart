import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/avatar.dart';
import 'auth_controller.dart';
import 'signin_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('TÀI KHOẢN'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 120),
              Avatar(controller.rxFireStoreUser.value!.photoUrl),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 20),
                  Text('User: ${controller.rxFireStoreUser.value!.name}',
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 10),
                  Text('Email: ${controller.rxFireStoreUser.value!.email}',
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      AuthController.to.signOut();
                      Get.offAll(SignInScreen(),transition: Transition.fadeIn);
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(200, 45),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Text('Thoát tài khoản'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
