import 'package:flutter/material.dart';

class Responsive {
  final BuildContext context;

  Responsive(this.context);

  // Get screen width
  double get screenWidth => MediaQuery.of(context).size.width;

  /// Get screen height
  double get screenHeight => MediaQuery.of(context).size.height;

  /// Calculate dynamic height based on percentage
  double height(double percentage) => screenHeight * (percentage / 100);

  /// Calculate dynamic width based on percentage
  double width(double percentage) => screenWidth * (percentage / 100);

  /// Dynamic text size based on screen width
  double textSize(double baseSize) => baseSize * (screenWidth / 375);

  /// Adjusted padding based on screen width
  EdgeInsetsGeometry get responsivePadding => EdgeInsets.symmetric(
        horizontal: width(5), // 5% of screen width
        vertical: height(2), // 2% of screen height
      );

  /// Adjusted margin based on screen width
  EdgeInsetsGeometry get responsiveMargin => EdgeInsets.symmetric(
        horizontal: width(4), // 4% of screen width
        vertical: height(2), // 2% of screen height
      );

  /// Dynamic sizing for navigation bar
  double get navBarHeight => height(8); // 8% of screen height

  /// Dynamic size for tab bar height
  double get tabBarHeight => height(6); // 6% of screen height

  /// Dynamic icon size
  double iconSize(double baseSize) => baseSize * (screenWidth / 375);

  /// Check for small, medium, or large screen
  bool get isSmallScreen => screenWidth < 360;
  bool get isMediumScreen => screenWidth >= 360 && screenWidth <= 720;
  bool get isLargeScreen => screenWidth > 720;
}
