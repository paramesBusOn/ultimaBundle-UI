part of '../reward_page.dart';


class _BuildHistoryReward extends StatelessWidget {
  const _BuildHistoryReward({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Const.margin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.history_rewards,
              style: _theme.textTheme.headline3,
            ),
            const SizedBox(height: Const.space12),
            Expanded(
              child: ListView.builder(
                itemCount: rewardList.length,
                itemBuilder: (context, index) {
                  final reward = rewardList[index];

                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      reward.coffee?.name ?? '',
                      style: _theme.textTheme.headline3,
                    ),
                    subtitle: Text(
                      DateFormat('dd MMMM | hh:mm').format(reward.dateTime!),
                      style: _theme.textTheme.subtitle2,
                    ),
                    trailing: Text(
                      '+ ${reward.point} Pts',
                      style: _theme.textTheme.headline1,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
