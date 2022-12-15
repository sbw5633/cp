import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:woori_cp/const/setting_value.dart';
import 'package:woori_cp/provider/calendar/schedule_member_provider.dart';
import 'package:woori_cp/unit/component/common/render_icon.dart';

class ScheduleMember extends StatelessWidget {
  const ScheduleMember({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "참가자",
          style: pointTS.copyWith(fontSize: fontSize_bigTitle),
        ),
        SizedBox(
          width: 18,
        ),
        RenderParticipationMemberIcon(idx: 0),
        SizedBox(
          width: 8,
        ),
        RenderParticipationMemberIcon(idx: 1),
      ],
    );
  }
}

class RenderParticipationMemberIcon extends ConsumerWidget {
  final int idx;
  const RenderParticipationMemberIcon({
    super.key,
    required this.idx,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(scheduleMemberProvider);
    print("provider: $provider");
    return InkWell(
      onTap: () {
        ref
            .read(scheduleParticipationManagerProvider.notifier)
            .changeParticipation(idx: idx);
      },
      child: RenderIcon(
        child: Container(
          decoration: BoxDecoration(
              color: provider[idx] ? Colors.yellow : null,
              borderRadius: BorderRadius.circular(iconBoxSize_small)),
          child: Icon(
            idx == 0 ? Icons.man : Icons.girl,
            size: iconBoxSize_small,
          ),
        ),
        size: iconBoxSize_small,
      ),
    );
  }
}
