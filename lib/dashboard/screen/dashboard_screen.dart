import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../account/layout_account.dart';
import '../../color.dart';
import '../../favourite/layout_favorite.dart';
import '../../home/layout_home.dart';
import '../../order_list/layout_order_list.dart';



var indexProvider = StateProvider<int> ((ref) => 0);

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(

      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 0),
        child: IndexedStack(
          index: ref.watch(indexProvider),
          children: const [
            LayoutHome(),
            LayoutFavourite(),
            Text("data 4"),
            LayoutAccount(),
            // LayoutLogin(),
            LayoutOrderList(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          ref.read(indexProvider.state).state = index ;
        },
        currentIndex: ref.watch(indexProvider),
        selectedItemColor: color_lqd1,
        unselectedItemColor: color_lqd2,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 3,

        items: const [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Favourite', icon: Icon(Icons.favorite)),
          BottomNavigationBarItem(label: 'Notification', icon: Icon(Icons.notifications)),
          BottomNavigationBarItem(label: 'Account', icon: Icon(Icons.person_outline)),
          BottomNavigationBarItem(label: 'PDF', icon: Icon(Icons.picture_as_pdf)),
        ],
      ),
    );
  }
}
