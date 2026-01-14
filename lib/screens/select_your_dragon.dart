import 'package:flutter/material.dart';
import 'package:httyd/res/constants/constants.dart';
import 'package:httyd/res/constants/media_constants.dart';
import 'package:httyd/res/routes/routes.dart';
import 'package:httyd/res/theme/theme.dart';
import 'package:httyd/utils/responsiveSize.dart';

class SelectYourDragon extends StatefulWidget {
  const SelectYourDragon({super.key});

  @override
  State<SelectYourDragon> createState() => _SelectYourDragonState();
}

class _SelectYourDragonState extends State<SelectYourDragon> {
  int? selectedDragonIndex;

  String? _getSelectedDragonName() {
    String dragonPath;
    switch (selectedDragonIndex) {
      case 0:
        dragonPath = MediaConstants.dragon1;
        break;
      case 1:
        dragonPath = MediaConstants.dragon2;
        break;
      case 2:
        dragonPath = MediaConstants.dragon1;
        break;
      case 3:
        dragonPath = MediaConstants.dragon3;
        break;
      case 4:
        dragonPath = MediaConstants.dragon4;
        break;
      case 5:
        dragonPath = MediaConstants.dragon3;
        break;
      default:
        return null;
    }

    // Extract filename from path and format it
    final fileName = dragonPath.split('/').last.replaceAll('.png', '');
    // Convert "dragon_1" to "Dragon 1" format
    final parts = fileName.split('_');
    if (parts.length >= 2) {
      return '${parts[0][0].toUpperCase()}${parts[0].substring(1)} ${parts[1]}';
    }
    return fileName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Stack(
              children: [
                Image.asset(
                  MediaConstants.selectDragonBg,
                  fit: BoxFit.fitHeight,
                ),

                Positioned(
                  top: 510,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    MediaConstants.selectYourDragon,
                    cacheWidth: 560,
                  ),
                ),

                _buildSelectableDragon(
                  index: 0,
                  dragonAsset: MediaConstants.dragon1,
                  containerTop: 770,
                  containerLeft: 240,
                  containerHeight: 242,
                  containerWidth: 242,
                  dragonTop: 730,
                  dragonLeft: 190,
                  dragonHeight: 342,
                  dragonWidth: 342,
                ),
                _buildSelectableDragon(
                  index: 1,
                  dragonAsset: MediaConstants.dragon2,
                  containerTop: 770,
                  containerLeft: 560,
                  containerHeight: 242,
                  containerWidth: 242,
                  dragonTop: 760,
                  dragonLeft: 535,
                  dragonHeight: 302,
                  dragonWidth: 302,
                ),
                _buildSelectableDragon(
                  index: 2,
                  dragonAsset: MediaConstants.dragon1,
                  containerTop: 770,
                  containerLeft: 880,
                  containerHeight: 242,
                  containerWidth: 242,
                  dragonTop: 730,
                  dragonLeft: 840,
                  dragonHeight: 342,
                  dragonWidth: 342,
                ),
                _buildSelectableDragon(
                  index: 3,
                  dragonAsset: MediaConstants.dragon3,
                  containerTop: 1115,
                  containerLeft: 240,
                  containerHeight: 242,
                  containerWidth: 242,
                  dragonTop: 1075,
                  dragonLeft: 80,
                  dragonHeight: 280,
                  dragonWidth: 542,
                ),
                _buildSelectableDragon(
                  index: 4,
                  dragonAsset: MediaConstants.dragon4,
                  containerTop: 1115,
                  containerLeft: 560,
                  containerHeight: 242,
                  containerWidth: 242,
                  dragonTop: 1080,
                  dragonLeft: 505,
                  dragonHeight: 322,
                  dragonWidth: 322,
                ),
                _buildSelectableDragon(
                  index: 5,
                  dragonAsset: MediaConstants.dragon3,
                  containerTop: 1115,
                  containerLeft: 880,
                  containerHeight: 242,
                  containerWidth: 242,
                  dragonTop: 1075,
                  dragonLeft: 770,
                  dragonHeight: 280,
                  dragonWidth: 542,
                ),
                Positioned(
                  bottom: 120,
                  left: 100,
                  child: Image.asset(
                    MediaConstants.bottomLeftDarkBgEffect,
                    width: 150,
                    height: 70,
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 130,
                  child: Image.asset(
                    MediaConstants.leftDarkBgEffect,
                    width: 37,
                    height: 350,
                    cacheHeight: 700,
                    cacheWidth: 37,
                    // fit: BoxFit.fitWidth,
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 60,
                  child: Image.asset(
                    MediaConstants.isleOfBerkVertical,
                    width: 50,
                    height: 150,
                    cacheHeight: 300,
                  ),
                ),
                Positioned(
                  top: 30,
                  right: 30,
                  child: Image.asset(
                    MediaConstants.topRightDarkBgEffect,
                    width: 130,
                    height: 280,
                  ),
                ),

                if (selectedDragonIndex != null)
                  Positioned(
                    top: 1415,
                    left: 0,
                    right: 0,
                    child: Text(
                      _getSelectedDragonName() ?? "",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 70,
                        fontFamily: Constants.fontElmarScratchFont,
                        color: CustomColors.darkPrimaryTextColor,
                      ),
                    ),
                  ),

                Positioned(
                  bottom: 160,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        if (selectedDragonIndex != null) {
                          Navigator.pushNamed(
                            context,
                            RouteNames.selectVikingName,
                          );
                        }
                      },
                      child: Container(
                        height: 110,
                        width: 350,
                        decoration: BoxDecoration(
                          color: _getSelectedDragonName() == null
                              ? Colors.transparent
                              : Color.fromARGB(
                                  255,
                                  144,
                                  118,
                                  74,
                                ).withAlpha(195),
                          image: DecorationImage(
                            image: AssetImage(MediaConstants.border),
                            fit: BoxFit.contain,
                            opacity: 0.6,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Confirm",
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: Constants.fontAdornExpandedSans,
                              color: CustomColors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectableDragon({
    required int index,
    required String dragonAsset,
    required double containerTop,
    required double containerLeft,
    required double containerHeight,
    required double containerWidth,
    required double dragonTop,
    required double dragonLeft,
    required double dragonHeight,
    required double dragonWidth,
  }) {
    final isSelected = selectedDragonIndex == index;
    // Adjust container position to center the larger selected container
    final adjustedContainerLeft = isSelected
        ? containerLeft - (392 - containerWidth) / 2
        : containerLeft;
    final adjustedContainerTop = isSelected
        ? containerTop - (392 - containerHeight) / 2
        : containerTop;

    // Calculate the bounds of the entire selectable area
    final minLeft = adjustedContainerLeft < dragonLeft
        ? adjustedContainerLeft
        : dragonLeft;
    final minTop = adjustedContainerTop < dragonTop
        ? adjustedContainerTop
        : dragonTop;
    final maxRight =
        (adjustedContainerLeft + (isSelected ? 392 : containerWidth)) >
            (dragonLeft + dragonWidth)
        ? (adjustedContainerLeft + (isSelected ? 392 : containerWidth))
        : (dragonLeft + dragonWidth);
    final maxBottom =
        (adjustedContainerTop + (isSelected ? 392 : containerHeight)) >
            (dragonTop + dragonHeight)
        ? (adjustedContainerTop + (isSelected ? 392 : containerHeight))
        : (dragonTop + dragonHeight);

    final areaWidth = maxRight - minLeft;
    final areaHeight = maxBottom - minTop;

    return Positioned(
      top: minTop,
      left: minLeft,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            selectedDragonIndex = index;
          });
        },
        child: SizedBox(
          width: areaWidth,
          height: areaHeight,
          child: Stack(
            children: [
              Positioned(
                top: adjustedContainerTop - minTop,
                left: adjustedContainerLeft - minLeft,
                child: Image.asset(
                  isSelected
                      ? MediaConstants.selectedContainer
                      : MediaConstants.dragonContainer,
                  height: isSelected ? 392 : containerHeight,
                  width: isSelected ? 392 : containerWidth,
                ),
              ),
              Positioned(
                top: dragonTop - minTop,
                left: dragonLeft - minLeft,
                child: Image.asset(
                  dragonAsset,
                  height: dragonHeight,
                  width: dragonWidth,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
