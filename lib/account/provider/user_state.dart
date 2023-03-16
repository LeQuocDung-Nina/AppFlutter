
import 'package:demorivermod/account/model/user_model.dart';

class UserState {
  final List<UserModel>? listUser;
  final bool isLoading;

  UserState({this.listUser, this.isLoading = true});

  UserState copyWith(
      {List<UserModel>? listUser, bool? isLoading}) {
    return UserState(
        isLoading: isLoading ?? this.isLoading,
        listUser: listUser ?? this.listUser
    );
  }
}




