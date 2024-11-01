// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:samsat_gpt/core.dart';

class BaseDangerButton extends StatefulWidget {
  final Function()? onPressed;
  final String? text;
  final String? prefixIcon;
  final String? suffixIcon;
  final bool? isDense;

  const BaseDangerButton({
    super.key,
    required this.onPressed,
    this.text,
    this.prefixIcon,
    this.suffixIcon,
    this.isDense,
  });

  @override
  State<BaseDangerButton> createState() => _BaseDangerButtonState();
}

class _BaseDangerButtonState extends State<BaseDangerButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.isDense ?? false ? null : MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: const MaterialStatePropertyAll(EdgeInsets.zero),
          backgroundColor: widget.onPressed != null
              ? const MaterialStatePropertyAll(red700)
              : const MaterialStatePropertyAll(gray400),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          overlayColor: MaterialStateProperty.all<Color>(red900),
        ),
        onPressed: widget.onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: SingleChildScrollView(
            controller: ScrollController(),
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                trimString(widget.prefixIcon).isNotEmpty
                    ? SvgPicture.asset(
                        trimString(widget.prefixIcon),
                        colorFilter: colorFilterWhite,
                      )
                    : Container(),
                trimString(widget.prefixIcon).isNotEmpty &&
                        trimString(widget.text).isNotEmpty
                    ? const SizedBox(
                        width: 8.0,
                      )
                    : Container(),
                trimString(widget.text).isNotEmpty
                    ? Text(
                        trimString(widget.text),
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              height: 1.75,
                              color: neutralWhite,
                            ),
                        textHeightBehavior: const TextHeightBehavior(
                          leadingDistribution: TextLeadingDistribution.even,
                        ),
                      )
                    : Container(),
                trimString(widget.suffixIcon).isNotEmpty &&
                        trimString(widget.text).isNotEmpty
                    ? const SizedBox(
                        width: 8.0,
                      )
                    : Container(),
                trimString(widget.suffixIcon).isNotEmpty
                    ? SvgPicture.asset(
                        trimString(widget.suffixIcon),
                        colorFilter: colorFilterWhite,
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
