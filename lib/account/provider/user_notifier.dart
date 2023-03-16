
import 'package:demorivermod/account/adapter/user_hive.dart';
import 'package:demorivermod/account/respository/user_detail_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../model/user_model.dart';
import 'user_state.dart';


class UserController extends StateNotifier<UserState> {
  final String idOrder;

  UserController(this.idOrder) : super(UserState()) {

    initUser();
  }

  late final _boxUser;

  // void _init() async {
  //   final UserModel user = await UserService.instance.getUser(idOrder);
  //   state = state.copyWith(listUser: [user]);
  //
  // }

  initUser() async {

    state = state.copyWith(isLoading: true);
    _boxUser = Hive.box('user');
    final listUser = _boxUser.toMap();

    List<UserModel> listTemp = [];
    if (listUser.isNotEmpty && listUser.length > 0) {
      listUser.forEach((key, value) {
        final user = value as UserHive;
        listTemp.add(UserModel(
          id: user.id,
          username: user.username,
          password: user.password,
          avatar: user.avatar,
          fullname: user.fullname,
          email: user.email,
          phone: user.phone,
          birthday: user.birthday,
          address: user.address
        ));
      });
    }
    state = state.copyWith(isLoading: false, listUser: listTemp);
  }

  checkLogin() async {
    state = state.copyWith(isLoading: true);
    final UserModel user = await UserService.instance.getUser(idOrder);

    state.listUser!.add(user);
    updateUserLocalStorage();
    state = state.copyWith(isLoading: false);
  }

  editUser(UserModel item, String avatar) async {
    state = state.copyWith(isLoading: true);
    final viTri =
    state.listUser!.indexWhere((element) => element.id == item.id);
    if (viTri > -1) {
      state.listUser![viTri] =
          state.listUser![viTri].copyWith(avatar: avatar);
      updateUserLocalStorage();
    }
    state = state.copyWith(isLoading: false);
  }

  updateUserLocalStorage() async {
    await _boxUser.clear();
    if (state.listUser!.isNotEmpty) {
      for (var element in state.listUser!) {
        UserHive item = UserHive(
            id: element.id,
            username: element.username,
            password: element.password,
            avatar: element.avatar,
            fullname: element.fullname,
            email: element.email,
            phone: element.phone,
            birthday: element.birthday,
            address: element.address);
        _boxUser.add(item);
      }
    }
  }

}

