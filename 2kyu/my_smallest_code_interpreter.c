#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <assert.h>

#define SIZE 1024

char* brain_luck(char* code, char* input) {
  char* result = (char*)malloc(sizeof(char) * SIZE);
  char data[SIZE] = { 0 };

  int dp = SIZE / 2;
  int cp = 0;
  int size = 0;
  while (code[cp] != '\0') {
    switch(code[cp]) {
    case '>':
      dp++;
      break;
    case '<':
      dp--;
      break;
    case '+':
      data[dp]++;
      break;
    case '-':
      data[dp]--;
      break;
    case '.':
      result[size++] = data[dp];
      break;
    case ',':
      data[dp] = *(input++);
      break;
    case '[':
      if (data[dp] == 0) {
        int ct = 0;
        while (!(code[cp] == ']' && ct == 1)) {
          if (code[cp] == '[') ct++;
          if (code[cp] == ']') ct--;
          cp++;
        }
      }
      break;
    case ']':
      if (data[dp]) {
        int ct = 0;
        while (!(code[cp] == '[' && ct == 1)) {
          if (code[cp] == ']') ct++;
          if (code[cp] == '[') ct--;
          cp--;
        }
      }
      break;
    }
    cp++;
  }
  result[size] = '\0';
  return result;
}

int main() {
  char *code = ",+[-.,+]";
  char *input = "codewars";
  char *res = brain_luck(code, input);
  puts(res);
  free(res);
  return 0;
}
