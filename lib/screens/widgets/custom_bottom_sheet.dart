
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:httyd/res/constants/constants.dart';
import 'package:httyd/res/theme/theme.dart';
import 'package:httyd/utils/responsiveSize.dart';

class CustomBottomSheet extends StatefulWidget {
  final String? selectedOption;
  final Function(String?)? onSelectOption;
  final String? title;
  final List<String>? options;
  final List<String>? secondaryOptions;
  final List<String?>? prefixIcons;
  final List<bool>? showIndicators;

  const CustomBottomSheet({
    super.key,
    this.selectedOption,
    this.onSelectOption,
    this.title,
    this.options,
    this.secondaryOptions,
    this.prefixIcons,
    this.showIndicators,
  });

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  String? selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.selectedOption;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: Container(
            height: 5,
            width: 36,
            decoration: BoxDecoration(
              color: CustomColors.white.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        SizedBox(height: 10.rh(context)),
        Flexible(
          child: Container(
            width: context.screenWidth,
            decoration: const BoxDecoration(
              color: CustomColors.navBarColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 26.0,
                right: 26,
                top: 25,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.title ?? '',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: CustomColors.primaryTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: context.font.extraLarge,
                          fontFamily: Constants.fontFamily,
                          letterSpacing: 0.37,
                        ),
                  ),
                  SizedBox(height: 20.rh(context)),
                  if (selectedItem == null)
                    Container(
                      width: context.screenWidth,
                      height: 1,
                      color: CustomColors.textFieldHintColor
                          .withValues(alpha: 0.3),
                    ),
                  Flexible(
                    child: ListView.separated(
                      shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: widget.options!.length,
                      itemBuilder: (context, index) {
                        final item = widget.options![index];
                        final isSelected = item == selectedItem;
                        final icon = widget.prefixIcons != null &&
                                widget.prefixIcons!.length > index
                            ? widget.prefixIcons![index]
                            : null;

                        final showIndicator = widget.showIndicators != null &&
                            widget.showIndicators!.length > index &&
                            widget.showIndicators![index];

                        final subtitle = widget.secondaryOptions != null &&
                                widget.secondaryOptions!.length > index
                            ? widget.secondaryOptions![index]
                            : null;

                        return Theme(
                          data: ThemeData(dividerColor: Colors.transparent),
                          child: ListTile(
                            onTap: () {
                              setState(() {
                                if (selectedItem == item) {
                                  selectedItem = null;
                                } else {
                                  selectedItem = item;
                                }
                                if (widget.onSelectOption != null) {
                                  widget.onSelectOption!(selectedItem);
                                }
                                Navigator.pop(context);
                              });
                            },
                            contentPadding: EdgeInsets.zero,
                            leading: icon != null
                                ? SvgPicture.asset(
                                    icon,
                                    colorFilter: const ColorFilter.mode(
                                      CustomColors.primaryTextColor,
                                      BlendMode.srcIn,
                                    ),
                                  )
                                : null,
                            title: Text(
                              item,
                              style: isSelected == true
                                  ? Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                        fontSize:
                                            context.font.large.rf(context),
                                        color: CustomColors.primaryTextColor,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.5,
                                        fontFamily: Constants.fontFamily,
                                      )
                                  : selectedItem == null
                                      ? Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                            fontSize:
                                                context.font.large.rf(context),
                                            color:
                                                CustomColors.primaryTextColor,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 0.37,
                                            fontFamily: Constants.fontFamily,
                                          )
                                      : Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                            fontSize:
                                                context.font.large.rf(context),
                                            color:
                                                CustomColors.secondaryTextColor,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.15,
                                            fontFamily: Constants.fontFamily,
                                          ),
                            ),
                            subtitle: subtitle != null
                                ? Text(
                                    subtitle,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(
                                          fontSize: 12.rf(context),
                                          color:
                                              CustomColors.textFieldHintColor,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.25,
                                          fontFamily: Constants.fontFamily,
                                        ),
                                  )
                                : null,
                            trailing: showIndicator
                                ? Container(
                                    height: 20.rh(context),
                                    width: 20.rw(context),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: isSelected
                                            ? CustomColors.primary
                                            : CustomColors.textFieldHintColor,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: isSelected
                                        ? Center(
                                            child: Container(
                                              height: 12.rh(context),
                                              width: 12.rw(context),
                                              decoration: const BoxDecoration(
                                                color: CustomColors.primary,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                          )
                                        : null,
                                  )
                                : null,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Container(
                        width: context.screenWidth,
                        height: 1,
                        color: CustomColors.textFieldHintColor
                            .withValues(alpha: 0.3),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.rh(context)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
