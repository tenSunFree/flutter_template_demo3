import 'package:logger/logger.dart';

final Logger log = Logger(
  filter: EHLogFilter(),
  printer: PrettyPrinter(colors: false, methodCount: 1),
);

class EHLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    if (event.level.index >= level!.index) {
      return true;
    }
    return false;
  }
}
