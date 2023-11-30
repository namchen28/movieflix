import 'package:flutter/material.dart';
import 'package:movieflix/constants.dart';

import 'package:movieflix/model/cast_model.dart';

class CastWidget extends StatelessWidget {
  final List<CastModels> castList;
  const CastWidget({
    super.key,
    required this.castList,
  });

  @override
  Widget build(BuildContext context) {
    String blankProfilePath =
        'https://alumni.engineering.utoronto.ca/files/2022/05/Avatar-Placeholder-400x400-1.jpg';
    return SizedBox(
      height: 270,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        scrollDirection: Axis.horizontal,
        itemCount: castList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    castList[index].profilePath != null
                        ? '${Constant.imagePath}${castList[index].profilePath}'
                        : blankProfilePath,
                    height: 160,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 100,
                  child: Text(castList[index].name!,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  width: 100,
                  child: Text(castList[index].character!,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
