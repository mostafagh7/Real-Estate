import 'package:flutter/material.dart';
import 'package:real_estate/core/constant/app_colors/app_colors.dart';
import '../../../core/ui/widgets/cached_image.dart';
import '../../../core/utils/Navigation/navigation.dart';
import '../data/models/realestate.dart';
import '../screen/realestate_details.dart';

class CardWid extends StatelessWidget {
  final RealestateModel realEstateModel;

  const CardWid({
    super.key,
    required this.realEstateModel,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    return InkWell(
      onTap: () => Navigation.push(RealestateDetails(
        realestateModel: realEstateModel,
      )),
      child: Card(
        color: AppColors.whiteF0,
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: screenWidth,
                  height: screenHeight * 0.25,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    child: CachedImage(
                      imageUrl: realEstateModel.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.02),
                  child: Card(
                    color: AppColors.white,
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            realEstateModel.price != null
                                ? "IQD ${realEstateModel.price!.toStringAsFixed(3)}"
                                : "Price",
                            style: TextStyle(
                              fontSize: screenWidth * 0.03,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "/month",
                            style: TextStyle(
                              color: AppColors.grey3B,
                              fontSize: screenWidth * 0.03,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.01,
                  right: screenWidth * 0.01,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.visibility,
                        color: AppColors.grey3B,
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      Text(
                        '${realEstateModel.views}',
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          color: AppColors.grey3B,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: screenWidth * 0.6,
                          child: RichText(
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              text: realEstateModel.title ?? "Title",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth * 0.05,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: screenHeight * 0.01,
                        left: screenWidth * 0.02,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Offer Type: ${realEstateModel.offerType ?? "Offer Type"}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[400],
                            fontSize: screenWidth * 0.04,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: Container(
                        height: screenHeight * 0.05,
                        width: screenHeight * 0.05,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Center(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward,
                            size: screenWidth * 0.05,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
