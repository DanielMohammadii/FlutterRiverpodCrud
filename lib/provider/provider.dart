import 'package:flutter_riverpod/flutter_riverpod.dart';

final numProvider = StateNotifierProvider<NumNotifier, List<int>>((ref) {
  return NumNotifier();
});

class NumNotifier extends StateNotifier<List<int>> {
  NumNotifier() : super([1, 3]);

  void addFoo(int num) {
    state = [...state, num];
  }

  void deleteFoo(int num) {
    state = [...state.where((element) => element != num)];
  }

  void updateFoo(int num, int newNum) {
    final updateList = <int>[];
    for (var i = 0; i < state.length; i++) {
      if (state[i] == num) {
        updateList.add(newNum);
      } else {
        updateList.add(state[i]);
      }
    }
    state = updateList;
  }
}
