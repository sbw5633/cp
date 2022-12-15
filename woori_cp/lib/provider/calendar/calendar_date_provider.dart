import 'package:flutter_riverpod/flutter_riverpod.dart';

final CalendarDateProvider = StateProvider<DateTime>((ref) => DateTime.now());
