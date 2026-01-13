import 'package:flutter/material.dart';
import 'package:httyd/res/theme/theme.dart';
import 'package:httyd/utils/responsiveSize.dart';

// import 'package:ozzo/res/utils/responsiveSize.dart';

// class CustomDropdown extends StatelessWidget {
//   final List<String> options;
//   final String? value;
//   final ValueChanged<String?> onChanged;
//   final Color? hintColor;
//   final String? Function(String? value)? validator;
//   final String hint;

//   const CustomDropdown({
//     super.key,
//     required this.options,
//     required this.onChanged,
//     this.hintColor,
//     required this.hint,
//     required this.value,
//     this.validator,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return FormField<String>(
//       validator: validator,
//       builder: (FormFieldState<String> state) {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               decoration: BoxDecoration(
//                 color: CustomColors.textFieldFillColor,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: DropdownButton(
//                 style: Theme.of(context).textTheme.displayMedium!.copyWith(
//                       color: CustomColors.primaryTextColor,
//                       fontSize: 14.rf(context),
//                       letterSpacing: 0.15,
//                       fontWeight: FontWeight.w400,
//                       height: 2,
//                       fontFamily: Constants.fontFamily3,
//                     ),
//                 value: value,
//                 hint: Text(
//                   hint,
//                   style: TextStyle(color: hintColor),
//                 ),
//                 icon: SvgPicture.asset(
//                   MediaConstants.dropdownIcon,
//                   height: 10,
//                   width: 10,
//                   fit: BoxFit.contain,
//                 ),
//                 iconSize: 24,
//                 underline: const SizedBox(),
//                 isExpanded: true,
//                 dropdownColor: CustomColors.textFieldFillColor,
//                 items: options.map((String value) {
//                   return DropdownMenuItem(
//                     value: value,
//                     child: Text(
//                       value,
//                       overflow: TextOverflow.ellipsis,
//                       style:
//                           Theme.of(context).textTheme.displayMedium!.copyWith(
//                                 color: CustomColors.primaryTextColor,
//                                 fontSize: 14.rf(context),
//                                 letterSpacing: 0.15,
//                                 fontWeight: FontWeight.w400,
//                                 height: 2,
//                                 fontFamily: Constants.fontFamily3,
//                               ),
//                     ),
//                   );
//                 }).toList(),
//                 onChanged: (String? newValue) {
//                   state.didChange(newValue);
//                   onChanged(newValue!);
//                 },
//               ),
//             ),
//             if (state.hasError)
//               Padding(
//                 padding: const EdgeInsets.only(top: 8.0, left: 15.0),
//                 child: Text(
//                   state.errorText ?? '',
//                   style: TextStyle(
//                     color: Colors.red,
//                     // fontSize: 12,
//                     fontSize: context.font.normal,
//                   ),
//                 ),
//               ),
//           ],
//         );
//       },
//     );
//   }
// }

class CustomDropdown extends StatelessWidget {
  final List<String> options;
  final String? value;
  final ValueChanged<String?>? onChanged;
  final Color? hintColor;
  final String? Function(String?)? validator;
  final String hint;
  final Widget? prefixIconPath;

  const CustomDropdown({
    super.key,
    required this.options,
    this.value,
    required this.onChanged,
    this.hintColor,
    this.validator,
    required this.hint,
    this.prefixIconPath,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        prefixIcon: prefixIconPath,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        fillColor: CustomColors.textFieldFillColor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      style: Theme.of(context).textTheme.displayMedium!.copyWith(
            color: CustomColors.primaryTextColor,
            fontSize: 14.rf(context),
            letterSpacing: 0.15,
            fontWeight: FontWeight.w400,
            height: 2,
          ),
      value: value,
      hint: Text(
        hint,
        style: TextStyle(color: hintColor),
      ),
      icon: const Icon(Icons.keyboard_arrow_down),

      iconSize: 24,
      // underline: const SizedBox(),
      isExpanded: true,
      dropdownColor: CustomColors.textFieldFillColor,
      items: options.map(
        (option) {
          return DropdownMenuItem(
            value: option,
            child: Text(
              option,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: CustomColors.primaryTextColor,
                    fontSize: 14.rf(context),
                    letterSpacing: 0.15,
                    fontWeight: FontWeight.w400,
                    height: 2,
                  ),
            ),
          );
        },
      ).toList(),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
