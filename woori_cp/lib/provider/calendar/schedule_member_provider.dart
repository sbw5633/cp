import 'package:flutter_riverpod/flutter_riverpod.dart';

final scheduleMemberProvider = Provider<List<bool>>((ref) {
  final scheduleParticipationState =
      ref.watch(scheduleParticipationManagerProvider);

  return scheduleParticipationState;
});

final scheduleParticipationManagerProvider =
    StateNotifierProvider<ParticipationManagerProvider, List<bool>>(
        (ref) => ParticipationManagerProvider());

class ParticipationManagerProvider extends StateNotifier<List<bool>> {
  ParticipationManagerProvider() : super([false, false]);

  void changeParticipation({required int idx}) {
    int count = 0;

    state = state.map((e) {
      return count++ == idx ? !e : e;
    }).toList();
  }

  void initSetting() {
    state = [false, false];
  }
}
