import 'package:flutter_riverpod/flutter_riverpod.dart';

final calendarTimeProvider = Provider((ref) => null);

final timeChangeProvider =
    StateNotifierProvider<CalendarTimeManagerProvider, List<DateTime>>(
        (ref) => CalendarTimeManagerProvider());

class CalendarTimeManagerProvider extends StateNotifier<List<DateTime>> {
  CalendarTimeManagerProvider() : super([DateTime(0), DateTime(0)]);

  //when: 0:start Time / 1:end Time
  void setTime({required int when, required DateTime time}) {
    state[when] = time;
  }

  void initSetting() {
    state = [DateTime(0), DateTime(0)];
  }
}
