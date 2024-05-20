part of '../filter_page.dart';

class LestateFilterScreen extends StatefulWidget {
  const LestateFilterScreen({Key? key}) : super(key: key);

  @override
  State<LestateFilterScreen> createState() => _LestateFilterScreenState();
}

class _LestateFilterScreenState extends State<LestateFilterScreen> {
  SfRangeValues _currentPriceRange = const SfRangeValues(0, 500);
  SfRangeValues _currentPropertySize = const SfRangeValues(500, 2080);
  bool _isLoading = false;

  int _selectedPropertyType = 0;
  final List<String> _propertyTypeList = [
    'All',
    'House',
    'Apartment',
    'Office',
    'Hotel',
  ];

  int _selectedRoom = 0;
  final List<String> _roomList = [
    'Any',
    '1',
    '2',
    '3',
    '4',
    '5+',
  ];

  int _selectedBathroom = 0;
  final List<String> _bathroomList = [
    'Any',
    '1',
    '2',
    '3',
    '4',
    '5+',
  ];

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: AppLocalizations.of(context)!.filter,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Const.margin),
            child: Text(
              AppLocalizations.of(context)!.property_type,
              style: _theme.textTheme.headline3,
            ),
          ),
          const SizedBox(height: Const.space12),
          SizedBox(
            width: double.infinity,
            height: 45,
            child: ListView.builder(
              itemCount: _propertyTypeList.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: Const.margin),
              itemBuilder: (context, index) {
                final property = _propertyTypeList[index];
                return _FilterChip(
                  selectedItem: _selectedPropertyType,
                  property: property,
                  index: index,
                  onTap: () {
                    setState(() {
                      _selectedPropertyType = index;
                    });
                  },
                );
              },
            ),
          ),
          const SizedBox(height: Const.space25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Const.margin),
            child: Text(
              AppLocalizations.of(context)!.price_range,
              style: _theme.textTheme.headline3,
            ),
          ),
          const SizedBox(height: Const.space12),
          SfRangeSlider(
            values: _currentPriceRange,
            max: 1000,
            onChanged: (v) {
              setState(() {
                _currentPriceRange = v;
              });
            },
            enableTooltip: true,
            activeColor: Const.accentColor,
            inactiveColor: Const.accentColor.withOpacity(.2),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Const.margin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  NumberFormat.currency(
                    symbol: r'$',
                    decimalDigits: 0,
                  ).format(0),
                  style: _theme.textTheme.headline3,
                ),
                Text(
                  NumberFormat.currency(
                    symbol: r'$',
                    decimalDigits: 0,
                  ).format(1000),
                  style: _theme.textTheme.headline3,
                ),
              ],
            ),
          ),
          const SizedBox(height: Const.space25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Const.margin),
            child: Text(
              AppLocalizations.of(context)!.rooms,
              style: _theme.textTheme.headline3,
            ),
          ),
          const SizedBox(height: Const.space12),
          SizedBox(
            width: double.infinity,
            height: 45,
            child: ListView.builder(
              itemCount: _roomList.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: Const.margin),
              itemBuilder: (context, index) {
                final _room = _roomList[index];
                return _FilterChip(
                  selectedItem: _selectedRoom,
                  property: _room,
                  index: index,
                  onTap: () {
                    setState(() {
                      _selectedRoom = index;
                    });
                  },
                );
              },
            ),
          ),
          const SizedBox(height: Const.space25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Const.margin),
            child: Text(
              AppLocalizations.of(context)!.bathrooms,
              style: _theme.textTheme.headline3,
            ),
          ),
          const SizedBox(height: Const.space12),
          SizedBox(
            width: double.infinity,
            height: 45,
            child: ListView.builder(
              itemCount: _bathroomList.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: Const.margin),
              itemBuilder: (context, index) {
                final _bathroom = _bathroomList[index];
                return _FilterChip(
                  selectedItem: _selectedBathroom,
                  property: _bathroom,
                  index: index,
                  onTap: () {
                    setState(() {
                      _selectedBathroom = index;
                    });
                  },
                );
              },
            ),
          ),
          const SizedBox(height: Const.space25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Const.margin),
            child: Text(
              AppLocalizations.of(context)!.property_size,
              style: _theme.textTheme.headline3,
            ),
          ),
          const SizedBox(height: Const.space12),
          SfRangeSlider(
            values: _currentPropertySize,
            max: 3000,
            min: 500,
            onChanged: (v) {
              setState(() {
                _currentPropertySize = v;
              });
            },
            enableTooltip: true,
            activeColor: Const.accentColor,
            inactiveColor: Const.accentColor.withOpacity(.2),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Const.margin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '0 sqft',
                  style: _theme.textTheme.headline3,
                ),
                Text(
                  '3000 sqft',
                  style: _theme.textTheme.headline3,
                ),
              ],
            ),
          ),
          const SizedBox(height: Const.space25),
          CustomElevatedButton(
            onTap: () {
              setState(() {
                _isLoading = true;
              });
              Future.delayed(const Duration(seconds: 2), () {
                setState(() {
                  _isLoading = false;
                  showToast(msg: AppLocalizations.of(context)!.filter_applied);
                });
              });
            },
            isLoading: _isLoading,
            label: AppLocalizations.of(context)!.apply_filter,
            labelLoading: AppLocalizations.of(context)!.applying,
            margin: const EdgeInsets.all(Const.margin),
          ),
        ],
      ),
    );
  }
}
