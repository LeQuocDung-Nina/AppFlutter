
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:demorivermod/home/model/slideshow_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:searchfield/searchfield.dart';
import '../../color.dart';
import '../model/categorie_model.dart';
import '../provider/home_provider.dart';
import '../widget/appbarhome.dart';
import '../widget/categorie.dart';
import '../widget/product_home_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _AppBar(),
      ),
      body: SingleChildScrollView(child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
              children:const [
                 SizedBox(height: 20,),
                 _Slogan(),
                 _Search(),
                 SizedBox(height: 20,),
                _TabbarHome(),

              ],
          )
        )
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const AppBarHome();
  }
}


class _Slogan extends ConsumerWidget {
  const _Slogan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Xin chào Dũng Lê",
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 16, color: color_lqd8),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "Nhiều mẫu mã đang chờ bạn thị trường thời trang",
          style: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 15, color: color_lqd14),
        ),
      ],
    );
    ;
  }
}

class _Search extends ConsumerWidget {
  const _Search({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.only(top: 25.0),
      child: SearchField(
        suggestions: [],
        hint: 'Tìm kiếm sản phẩm',
        searchInputDecoration:  InputDecoration(
            filled: true,
            fillColor: color_lqd15,
            // prefixIcon: Icon(Icons.search),
            // prefixIconColor: blackColor,
            suffixIcon: const Icon(Icons.search),
            suffixIconColor: color_lqd16,
            enabledBorder:  OutlineInputBorder(
              borderSide: const BorderSide(
                color: color_lqd15,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: color_lqd15,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(50),

            )
        ),
        searchStyle: const TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: color_lqd16),
      ),
    );
  }
}

class _TabbarHome extends ConsumerStatefulWidget {
  const _TabbarHome({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => __TabbarHomeState();
}

class __TabbarHomeState extends ConsumerState<_TabbarHome> {
  int _currentIndex = 0;
  bool _isVisibleTab1 = true;
  bool _isVisibleTab2 = false;

  late SlideshowModel slideshowModel;

  void _onTabChanged(int index) {
    setState(() {
      _currentIndex = index;
      _isVisibleTab1 = _currentIndex == 0;
      _isVisibleTab2 = _currentIndex == 1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        DefaultTabController(
          length: 2,
          child: TabBar(
            labelColor: color_lqd5,
            labelStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
            unselectedLabelColor: color_lqd5,
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 2.0,
                color: color_lqd1,
              ),
              borderRadius: BorderRadius.zero,
            ),
            onTap: (index) {
              setState(() {
                _onTabChanged(index);
              });
            },
            tabs: const [
              Tab(text: ' Home '),
              Tab(text: ' Categories '),
            ],
          ),
        ),
        IndexedStack(
          index: _currentIndex,
          children: [
            Visibility(
              visible: _isVisibleTab1,
              child: Column(
                children:  [
                  const _SlideShow(),
                  const _TitleMain(),
                  const SizedBox(height: 20,),
                  _Product(),
                ],
              ),
            ),
            Visibility(
              visible: _isVisibleTab2,
              child: Column(
                children: const [
                  SizedBox(height: 15,),
                  _Categories(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SlideShow extends ConsumerWidget {
  const _SlideShow({
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final slideshows = ref.watch(slideshowProvider);
    final slideshowList = slideshows.listSlideshows;


    final CarouselController carouselController = CarouselController();
    int currentIndex = 0;

    return (slideshowList != null && slideshowList!.isNotEmpty)
      ? Stack(
        children: [
          InkWell(
            onTap: (){
              print(currentIndex);
            },
            child: CarouselSlider(
              items: slideshowList!.map((item) => Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20), // Image border
                    child: Image.network(item.photo, fit: BoxFit.cover, width: double.maxFinite,height: 150,),
                  )
              )).toList(),
              carouselController: carouselController,
              options: CarouselOptions(
                scrollPhysics: const BouncingScrollPhysics(),
                autoPlay: true,
                aspectRatio: 2,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  currentIndex = index;
                },
              ),
            ),
          )
        ],
      )
    : const CircularProgressIndicator();
  }
}

class _TitleMain extends ConsumerWidget {
  const _TitleMain({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  [
        const Text("Hàng mới về",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 17,color: color_lqd8),),
        GestureDetector(
          onTap: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => ProductNes(),),);
          },
          child: const Text("Tất cả",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: color_lqd1),),
        ),
      ],
    );
  }
}

class _Product extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productProvider);
    return (products.listProducts != null && products.listProducts!.isNotEmpty)
        ? ValueListenableBuilder(
          valueListenable: Hive.box('favorites_v5').listenable(),
          builder: (BuildContext context, box, Widget? child) {
            return AlignedGridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                // itemCount: 6,
                itemCount: products.listProducts!.length.ceil(),
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                itemBuilder: (context, index) =>  ProductItem(product: products.listProducts![index]),
            );
          },
          )
        : const CircularProgressIndicator();
  }
}

class _Categories extends ConsumerWidget {
  const _Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlignedGridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      crossAxisCount: 1,
      mainAxisSpacing: 20,
      crossAxisSpacing: 0,
      itemBuilder: (context, index) => CategorieItem(categorie: categories[index]),
    );
  }
}
