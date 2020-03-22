Example Code:
```dart
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
```
Output:
```
TokenType.streamStart
TokenType.blockSequenceStart
TokenType.blockEntry
SCALAR PLAIN "Item 4"
COMMENT INLINE "co1"
COMMENT NEWLINE "comment"
TokenType.blockEntry
SCALAR PLAIN "This is a sequence"
COMMENT INLINE "co4"
COMMENT NEWLINE "co2"
COMMENT NEWLINE "co3"
TokenType.blockEntry
SCALAR PLAIN "inside another sequence"
TokenType.blockEnd
TokenType.streamEnd
```
