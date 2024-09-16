import 'package:flutter/material.dart';
import 'package:real_estate/core/constant/app_colors/app_colors.dart';

class DropDownWidget<Model> extends StatelessWidget {
  final Model? value;
  final void Function(Model?)? onChanged;
  final List<DropdownMenuItem<Model>>? items;
  final String hint;
  final Model allValue;

  const DropDownWidget({
    super.key,
    required this.value,
    required this.onChanged,
    required this.items,
    required this.hint,
    required this.allValue, 
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.08,
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.02,
        vertical: screenHeight * 0.01,
      ),
      child: IntrinsicWidth(
        child: DropdownButtonHideUnderline(
          child: DropdownButton<Model>(
            itemHeight: screenHeight * 0.08,
            isExpanded: true,
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              color: AppColors.black,
              fontWeight: FontWeight.bold,
            ),
            hint: Text(
              hint,
              style: TextStyle(fontSize: screenWidth * 0.04),
            ),
            padding: EdgeInsets.all(screenWidth * 0.03),
            value: value,
            onChanged: onChanged,
            items: [
              DropdownMenuItem<Model>(
                value: allValue, 
                child: const Text('All'), 
              ),
              ...items!.map((item) {
                return DropdownMenuItem<Model>(
                  value: item.value,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                      child: item.child,
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
