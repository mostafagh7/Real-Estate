import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/features/Realestate/data/models/realestate.dart';
import '../../../core/constant/app_colors/app_colors.dart';
import '../../../core/constant/app_padding/app_padding.dart';
import '../../../core/ui/widgets/back_widget.dart';
import '../../../core/ui/widgets/cached_image.dart';
import '../widget/card_details.dart';

class RealestateDetails extends StatelessWidget {
  final RealestateModel realestateModel;
  const RealestateDetails({super.key, required this.realestateModel});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            const BackWidget(title: "Real Estate Details"),
            const SizedBox(height: AppPaddingSize.padding_20),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: screenWidth,
                    height: screenHeight * 0.5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(screenWidth * 0.1),
                      child: CachedImage(
                        imageUrl: realestateModel.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.01,
                  right: screenWidth * 0.3,
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * 0.02),
                    child: Card(
                      color: AppColors.white,
                      child: Padding(
                        padding: EdgeInsets.all(screenWidth * 0.02),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              realestateModel.price != null
                                  ? "IQD ${realestateModel.price!.toStringAsFixed(3)}"
                                  : "Price",
                              style: TextStyle(
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "/month",
                              style: TextStyle(
                                color: AppColors.grey3B,
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.02,
                  right: screenWidth * 0.02,
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * 0.02),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.visibility,
                          color: AppColors.grey3B,
                        ),
                        SizedBox(width: screenWidth * 0.01),
                        Text(
                          '${realestateModel.views ?? "0"}',
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            color: AppColors.grey3B,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.03),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: screenWidth * 0.6,
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          text: realestateModel.title ?? "Title",
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
                    left: screenWidth * 0.03,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Offer Type: ${realestateModel.offerType ?? "Offer Type"}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[400],
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CardDetails(
                      text: realestateModel.noOfBedRooms?.toString() ?? "0",
                      text2: "Beds",
                      icon: Icons.bed_outlined,
                    ),
                    CardDetails(
                      text: realestateModel.noOfBathRooms?.toString() ?? "0",
                      icon: Icons.bathroom_outlined,
                      text2: "Bath",
                    ),
                    CardDetails(
                      text: realestateModel.area?.toString() ?? "0",
                      icon: Icons.crop_free_rounded,
                      text2: "M",
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.03),
                  child: Text(
                    "Details",
                    style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.03, bottom: screenWidth * 0.01),
                  child: Text(
                    "Country: ${realestateModel.country?.name.toString() ?? "Country"}",
                    style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.03, bottom: screenWidth * 0.01),
                  child: Text(
                    "City: ${realestateModel.city?.name.toString() ?? "City"}",
                    style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.03, bottom: screenWidth * 0.01),
                  child: Text(
                    "District: ${realestateModel.district?.name.toString() ?? "District"}",
                    style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.03, bottom: screenWidth * 0.01),
                  child: Text(
                    "Sub District: ${realestateModel.subDistrict?.name.toString() ?? "Sub District"}",
                    style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.03, bottom: screenWidth * 0.01),
                  child: Text(
                    "Category: ${realestateModel.category?.name.toString() ?? "Category"}",
                    style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.03, bottom: screenWidth * 0.01),
                  child: Text(
                    "Sub Category: ${realestateModel.subCategory?.name.toString() ?? "Sub Category"}",
                    style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
