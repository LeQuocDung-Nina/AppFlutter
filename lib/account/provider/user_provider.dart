
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'user_notifier.dart';
import 'user_state.dart';

final userProvider = StateNotifierProvider.family<UserController, UserState, String>((ref, idOrder) {
  return UserController(idOrder);
});