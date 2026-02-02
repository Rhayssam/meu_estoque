import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:meu_estoque/utils/formatter/form_masks.dart';

final class InputFormatters {
  static final MaskTextInputFormatter phoneFormatter = MaskTextInputFormatter(
    mask: FormMasks.phoneMask,
    type: MaskAutoCompletionType.lazy,
    filter: {
      '0': RegExp(r'[0-9]'),
    },
  );
  static final MaskTextInputFormatter ddiFormatter = MaskTextInputFormatter(
    mask: FormMasks.ddiMask,
    type: MaskAutoCompletionType.lazy,
    filter: {
      '0': RegExp(r'[0-9]'),
    },
  );
}
