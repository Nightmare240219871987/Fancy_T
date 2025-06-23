import 'dart:io';

void main() {
  stdout.write("\033[38;5;136mHello World\033[39;49m");
  stdout.write("\x1b[38;5;136mHello World\x1b[39;49m");
}
