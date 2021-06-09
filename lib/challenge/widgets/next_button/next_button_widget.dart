import 'package:DevQuiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroudColor;
  final Color fontColor;
  final Color borderColor;
  final VoidCallback onTap;

  const NextButtonWidget({
    Key? key,
    required this.label,
    required this.backgroudColor,
    required this.fontColor,
    required this.borderColor,
    required this.onTap,
  }) : super(key: key);

// construtor nomeado
  NextButtonWidget.green({required String label, required VoidCallback onTap})
      : this.backgroudColor = AppColors.darkGreen,
        this.fontColor = AppColors.white,
        this.borderColor = AppColors.green,
        this.label = label,
        this.onTap = onTap;

  NextButtonWidget.white({required String label, required VoidCallback onTap})
      : this.backgroudColor = AppColors.white,
        this.fontColor = AppColors.grey,
        this.borderColor = AppColors.border,
        this.label = label,
        this.onTap = onTap;

  NextButtonWidget.purple({required String label, required VoidCallback onTap})
      : this.backgroudColor = AppColors.purple,
        this.fontColor = AppColors.white,
        this.borderColor = AppColors.green,
        this.label = label,
        this.onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroudColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          side: MaterialStateProperty.all(
            BorderSide(color: borderColor),
          ),
        ),
        onPressed: onTap,
        child: Text(
          label,
          style: GoogleFonts.notoSans(
              fontWeight: FontWeight.w600, fontSize: 15, color: fontColor),
        ),
      ),
    );
  }
}
