import 'package:demorivermod/account/model/user_model.dart';
import 'package:demorivermod/account/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../color.dart';
import '../../style.dart';


class AccountScreen extends ConsumerWidget {
  const AccountScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final userList = ref.watch(userProvider("1"));
    final user = userList.listUser?.first;

 print("object: ${user}");

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("Tài khoản",style: styleAppbar),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            _UserAccount(user: user!,),
            Container(
              height: 1,
              margin: EdgeInsets.symmetric(vertical: 20.0),
              color: color_lqd17,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Giỏ hàng",style: TextStyle(color: color_lqd8,fontSize: 16,fontWeight: FontWeight.w400),),
                Icon(Icons.navigate_next),
              ],
            ),
            Container(
              height: 1,
              margin: EdgeInsets.symmetric(vertical: 20.0),
              color: color_lqd17,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Đơn hàng",style: TextStyle(color: color_lqd8,fontSize: 16,fontWeight: FontWeight.w400),),
                Icon(Icons.navigate_next),
              ],
            ),
            Container(
              height: 1,
              margin: EdgeInsets.symmetric(vertical: 20.0),
              color: color_lqd17,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Phiếu giảm giá & mã khuyến mãi",style: TextStyle(color: color_lqd8,fontSize: 16,fontWeight: FontWeight.w400),),
                Icon(Icons.navigate_next),
              ],
            ),
            Container(
              height: 1,
              margin: EdgeInsets.symmetric(vertical: 20.0),
              color: color_lqd17,
            ),

            Row(
              children: [
                Expanded(child: Container(
                  decoration: BoxDecoration(
                    color: color_lqd19,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(padding:const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("10%",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: Colors.white),),
                        Text("Khi mua đơn hàng 200k",style: TextStyle(fontSize: 13,color: Colors.white),),
                      ],
                    ),
                  ),
                ),),
                const SizedBox(width: 15,),
                Expanded(child: Container(
                  decoration: BoxDecoration(
                    color: color_lqd19,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(padding:const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("50%",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: Colors.white),),
                        Text("Khi mua đơn hàng 2000k",style: TextStyle(fontSize: 13,color: Colors.white),),
                      ],
                    ),
                  ),
                ),),

              ],
            ),
            Container(
              height: 1,
              margin: EdgeInsets.symmetric(vertical: 20.0),
              color: color_lqd17,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Địa chỉ giao hàng",style: TextStyle(color: color_lqd8,fontSize: 16,fontWeight: FontWeight.w400),),
                Icon(Icons.navigate_next),
              ],
            ),
            Container(
              height: 1,
              margin: EdgeInsets.symmetric(vertical: 20.0),
              color: color_lqd17,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Hỏi đáp",style: TextStyle(color: color_lqd8,fontSize: 16,fontWeight: FontWeight.w400),),
                Icon(Icons.navigate_next),
              ],
            ),
            Container(
              height: 1,
              margin: EdgeInsets.symmetric(vertical: 20.0),
              color: color_lqd17,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Đăng xuất",style: TextStyle(color: color_lqd8,fontSize: 16,fontWeight: FontWeight.w400),),
                Icon(Icons.navigate_next),
              ],
            ),
            Container(
              height: 1,
              margin: EdgeInsets.symmetric(vertical: 20.0),
              color: color_lqd17,
            ),
          ],
        ),
      ),
    );
  }
}


class _UserAccount extends ConsumerWidget {
  const _UserAccount({required this.user,
    Key? key,
  }) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return  InkWell(
      onTap: () {
        context.push('/info-account');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 60,
                  margin: EdgeInsets.only(right: 10.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(user.avatar)),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.fullname ,style: TextStyle(color: color_lqd8,fontSize: 17,fontWeight: FontWeight.w700),),
                      const SizedBox(height: 6.0,),
                      Text("Chỉnh sửa",style: TextStyle(color: color_lqd18,fontSize: 13),),
                    ],
                  ),
                )
              ],
            ),
          ),
          const Icon(Icons.navigate_next),
        ],
      ),
    );
  }
}