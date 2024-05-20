part of '../main.dart';

class _OnBoardingTabBar extends StatelessWidget {
  const _OnBoardingTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return ListView.builder(
      itemCount: allOnboardingList(context).length,
      itemBuilder: (context, index) {
        final _data = allOnboardingList(context)[index];
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          height: 45,
          child: ElevatedButton(
            onPressed: _data.navigation,
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Text(
              _data.name ?? '',
              style: _theme.textTheme.button,
            ),
          ),
        );
      },
    );
  }
}
