part of '../inbox_page.dart';

class _BuildSearchBox extends StatelessWidget {
  const _BuildSearchBox({
    Key? key,
    required this.searchController,
    required this.onChanged,
  }) : super(key: key);

  final TextEditingController searchController;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: 45,
      margin: const EdgeInsets.symmetric(horizontal: Const.margin),
      child: CustomTextFormField(
        controller: searchController,
        hintText: AppLocalizations.of(context)!.search_message,
        onChanged: onChanged,
        preffixIcon: Icon(
          FeatherIcons.search,
          color: _theme.primaryColor,
        ),
      ),
    );
  }
}
