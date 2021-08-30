import 'dart:io';

import 'package:flutter/foundation.dart';

bool isPhone = !kIsWeb && (Platform.isAndroid || Platform.isIOS);
