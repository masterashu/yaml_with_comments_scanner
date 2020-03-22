// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:yaml/src/scanner.dart';
import 'package:yaml/src/token.dart';

void main() {
  var scanner = Scanner('''
    - Item 4 #co1
    #comment
    - This is a sequence #co4
    #co2
      #co3
    - inside another sequence
  ''');

  while (scanner.peek().type != TokenType.streamEnd) {
    print(scanner.scan());
  }
  print(scanner.scan());
}
