#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>
#include <criterion/criterion.h>

#define BUFSIZE 30000

typedef struct {
  char *data;
  int size;
} Bits;

Bits* bits_alloc() {
  Bits *bits = (Bits*)malloc(sizeof(Bits));
  bits->size = 0;
  bits->data = NULL;
  return bits;
}

Bits* append(Bits *bits, char ch) {
  assert(bits);
  bits->size++;
  if (bits->data == NULL) {
    bits->data = (char*)malloc(bits->size);
  } else {
    bits->data = (char*)realloc(bits->data, bits->size);
  }
  bits->data[bits->size - 1] = ch;
  return bits;
}

Bits* string_to_bits(char *in) {
  Bits *bits = (Bits*)malloc(sizeof(Bits));  
  bits->size = strlen(in) * 8;
  bits->data = (char*)malloc(bits->size);
  memset(bits->data, 0, bits->size);  
  for (int i = 0; *in != '\0'; i += 8, in++) {
    unsigned char ch = *in;
    int pos = i;
    while (ch > 0) {
      bits->data[pos++] = ch % 2;
      ch /= 2;
    }
  }
  return bits;
}

char fetch_bit(Bits *bits, int ndx) {
  if (ndx >= bits->size || ndx < 0) return 0;
  return bits->data[ndx];
}

char byte_to_char(char *bits, int start, int end) {
  assert(bits);
  int sum = 0;
  int prod = 1;
  const int base = 2;
  for (int i = start; i < end; i++) {
    sum += prod * bits[i];
    prod *= base;
  }
  return sum;
}

char* bits_to_string(Bits *bits) {
  assert(bits);
  int size = 1;
  char *s = (char*)malloc(size);
  for (int i = 0; i <= bits->size; i += 8) {
    int end = i + 8 > bits->size ? bits->size : i + 8;
    s[size-1] = byte_to_char(bits->data, i, end);
    size++;
    s = (char*)realloc(s, size);
  }
  s[size-1] = '\0';
  return s;
}

char* boolfuck (char *code, char *in) {
  char data[BUFSIZE];
  memset(data, 0, sizeof(data));
  int dp = BUFSIZE / 2;
  Bits *tape = string_to_bits(in);
  Bits *bits = bits_alloc();
  int bp = 0;
  while (*code != '\0') {
    switch (*code) {
    case '+':
      data[dp] = !data[dp];
      break;
    case ',':
      data[dp] = fetch_bit(tape, bp++);
      break;
    case ';':
      bits = append(bits, data[dp]);
      break;
    case '>':
      dp++;
      break;
    case '<':
      dp--;
      break;
    case '[':
      if (!data[dp]) {
        int ct = 0;
        while (!(*code == ']' && ct == 1)) {
          if (*code == ']') ct--;
          else if (*code == '[') ct++;
          code++;
        }
      }
      break;
    case ']':
      if (data[dp]) {
        int ct = 0;
        while (!(*code == '[' && ct == 1)) {
          if (*code == ']') ct++;
          else if (*code == '[') ct--;
          code--;
        }
      }
      break;
    }
    code++;
  }

  char *s = bits_to_string(bits);
  free(tape);
  free(bits);
  return s;
}
