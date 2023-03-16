

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../color.dart';
import '../../style.dart';


class LoginScreen extends ConsumerWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const styleText = TextStyle(color: color_lqd21, fontSize: 16,);

    return Scaffold(
      appBar: AppBar(
        title: const Align(alignment: Alignment.centerRight, child: Text("Đăng ký",style: styleAppbarLog)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Text(
              "Đăng nhập",
              style: TextStyle(color: color_lqd8, fontSize: 33),
            ),
            const SizedBox(height: 50,),
            Container(
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(width: 1,color: color_lqd22))
              ),
              child: Row(
                children: [
                  Container(
                     decoration: const BoxDecoration(
                       border: Border(right: BorderSide(width: 1,color: color_lqd22)),
                     ),
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.only(right: 10),
                    child: const Icon(Icons.email_outlined,color: color_lqd21,)
                  ),
                  Expanded(
                    child: TextField(
                      style: styleText,
                      decoration:const InputDecoration(
                        border: InputBorder.none,
                        // labelText: 'Enter Name',
                        hintText: 'Email của bạn',
                      ),
                      controller: TextEditingController(),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30,),
            Container(
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(width: 1,color: color_lqd22))
              ),
              child: Row(
                children: [
                  Container(
                      decoration: const BoxDecoration(
                        border: Border(right: BorderSide(width: 1,color: color_lqd22)),
                      ),
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.only(right: 10),
                      child: const Icon(Icons.lock_open,color: color_lqd21,)
                  ),
                  Expanded(
                    child: TextField(
                      style: styleText,
                      obscureText:true,
                      decoration:const InputDecoration(
                        border: InputBorder.none,
                        // labelText: 'Enter Name',
                        hintText: 'Mật khẩu',
                      ),
                      controller: TextEditingController(),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30,),
            const Text("Quên mật khẩu?",style: TextStyle(color: color_lqd1,fontSize: 17,decoration: TextDecoration.underline),),
            const SizedBox(height: 30,),
            SizedBox(
              width: double.maxFinite,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: color_lqd1,
                ),
                  onPressed: () {
              }, child: const Text("Đăng nhập",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),)),
            ),
          ],
        ),
      ),
    );
  }
}
