import 'package:flutter/material.dart';
import 'package:muhammad_uzair_flutter_trainee_test/constants/dimension_resource.dart';
import 'package:muhammad_uzair_flutter_trainee_test/constants/style_constants.dart';

class RatingBar extends StatelessWidget {
  final double rating;
  final int ratingCount;

  const RatingBar({Key? key, required this.rating, required this.ratingCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int numberOfStars = rating.round();

    List<Widget> filledStars = List.generate(
      numberOfStars,
      (index) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
    );

    List<Widget> unfilledStars = List.generate(
      5 - numberOfStars,
      (index) => const Icon(
        Icons.star,
        color: Colors.black45,
      ),
    );

    List<Widget> mergedStars = [...filledStars, ...unfilledStars];

    return Row(
      children: [
        ...mergedStars,
        const SizedBox(width: DimensionResource.D_5),
        Text(
          '(${ratingCount.toString()})',
          style: StyleConstants.SUB_HEADING2,
        )
      ],
    );
  }
}
