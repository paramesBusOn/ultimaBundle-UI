part of '../favorite_page.dart';

class _ProductCard extends StatefulWidget {
  final ProductModel? product;

  const _ProductCard({Key? key, this.product}) : super(key: key);

  @override
  State<_ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<_ProductCard> {
  bool _isFavorite = true;
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return InkWell(
      borderRadius: BorderRadius.circular(Const.margin),
      onTap: () => Get.toNamed<dynamic>(
        BellcommerceRoutes.product,
        arguments: widget.product,
      ),
      child: SizedBox(
        width: 150,
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: OctoImage(
                    image: CachedNetworkImageProvider(
                      widget.product!.image!,
                    ),
                    height: 150,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.product!.title!,
                  style: _theme.textTheme.headline5,
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    Text(
                      '\$${widget.product!.normalPrice}',
                      style: _theme
                          .textTheme
                          .headline4!
                          .copyWith(color: _theme.primaryColor),
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(width: 5),
                    if (widget.product!.isOffer!)
                      Text(
                        '\$${widget.product!.discountPrice}',
                        style: _theme
                            .textTheme
                            .subtitle2!
                            .copyWith(decoration: TextDecoration.lineThrough),
                        textAlign: TextAlign.left,
                        maxLines: 1,
                      )
                    else
                      Container(),
                  ],
                ),
                const SizedBox(height: 3),
                SmoothStarRating(
                  color: Colors.yellow[700],
                  spacing: 1,
                  size: 15,
                  rating: widget.product!.ratingValue!,
                  borderColor: _theme.disabledColor,
                ),
                const SizedBox(height: 5),
              ],
            ),
            if (widget.product!.isOffer!)
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: _theme.primaryColor.withOpacity(.8),
                  ),
                  height: 20,
                  child: Center(
                    child: Text(
                      '-50%',
                      textAlign: TextAlign.center,
                      style: _theme
                          .textTheme
                          .subtitle2!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              )
            else
              Container(),
            Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                color: Colors.red,
                icon: Icon(
                  (_isFavorite == true)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  size: 23,
                ),
                onPressed: () {
                  setState(() {
                    _isFavorite = !_isFavorite;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
