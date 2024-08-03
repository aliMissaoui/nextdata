import 'package:flutter/material.dart';
import 'package:nextdata/src/config/theme/theme_dimens.dart';

import '../../../../config/theme/theme_colors.dart';

/// Widget to display an error message if [isFailed] is true.
class ErrorMsg extends StatelessWidget {
  final bool isFailed;
  final String failureMsg;

  /// Constructor for ErrorMsg widget.
  ///
  /// Required parameters:
  /// - [isFailed]: Boolean flag indicating if the error message should be displayed.
  /// - [failureMsg]: String message to display when [isFailed] is true.
  const ErrorMsg({super.key, required this.isFailed, required this.failureMsg});

  @override
  Widget build(BuildContext context) {
    return isFailed
        ? Column(
            children: [
              SizedBox(
                height: ThemeDimens.sizex16,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  failureMsg,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ThemeColors.errorColor,
                  ),
                ),
              )
            ],
          )
        : const SizedBox.shrink();
  }
}
