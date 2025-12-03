import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class NomadDateFormatter {
  NomadDateFormatter();
  static final maskFormatter = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {"#": RegExp(r'[0-9a-z]')},
    type: MaskAutoCompletionType.lazy,
  );
  static String transactionFormat(DateTime data) {
    final formatter = DateFormat("EEE d 'de' MMMM 'de' y", 'pt');

    final handledDate = formatter.format(data);
    final newDate = handledDate.replaceFirst(
      handledDate[0],
      handledDate[0].toUpperCase(),
    );
    return newDate;
  }

  static String brFormat(DateTime data) {
    final formatter = DateFormat("d/M/y");

    final handledDate = formatter.format(data);

    return handledDate;
  }

  static DateTime? dateValidator(String newDate) {
    final splitDate = newDate.split('/');
    if (splitDate.length < 3) {
      return null;
    }
    final day = splitDate.first;
    final month = splitDate[1];
    final year = splitDate.last;
    final newValidDate = DateTime.tryParse('$year-$month-$day');
    return newValidDate;
  }
}

extension Normalize on DateTime {
  DateTime normalize() {
    return DateTime(year, month, day);
  }
}

extension DayNormalize on DateTime {
  DateTime dayNormalize() {
    return DateTime(year, month);
  }
}
