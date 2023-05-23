import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_color.dart';
import '../utils/app_styles.dart';

class TextInput extends StatelessWidget {
  const TextInput(
      {Key? key,
      this.type,
      this.initValue,
      this.inputPlaholder,
      this.handleInputChanged,
      this.inputType,
      this.minLines = 1,
      this.maxLines,
      this.autoFocus = false,
      this.editable = true,
      this.textInputAction = TextInputAction.done,
      this.preIcon = null})
      : super(key: key);
  final type; //Type item. Ex: Basic Info Type Enum
  final initValue;
  final inputPlaholder;
  final handleInputChanged;
  final inputType;
  final minLines;
  final maxLines;
  final autoFocus;
  final editable;
  final textInputAction;
  final preIcon;
  @override
  Widget build(BuildContext context) {
    var value = ''.obs;
    value.value = initValue;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => (value.value != '')
              ? Container(
                  height: 16,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 0, bottom: 2, left: 10, right: 10),
                      child: Text(
                        value.value == '' ? inputPlaholder : inputPlaholder,
                        style: TextStyle(
                            color: AppColors.appGray2Color, fontSize: 12),
                      ),
                    ),
                  ),
                )
              : SizedBox(
                  height: 16,
                ),
        ),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Obx(
                  () => TextFormField(
                    textInputAction: textInputAction,
                    initialValue: value.value,
                    autofocus: autoFocus,
                    minLines: minLines,
                    maxLines: maxLines,
                    onChanged: (val) {
                      value.value = val;
                      handleInputChanged(val);
                    },
                    // handleInputChanged(type, value),
                    keyboardType:
                        inputType != null ? inputType : TextInputType.text,
                    style: AppStyles.styleTextInputNormarl,
                    enabled: editable,
                    decoration: InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      hintText: inputPlaholder,
                      hintStyle: AppStyles.styleTextNormalHintColor,
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF2D3142)),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF2D3142)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
