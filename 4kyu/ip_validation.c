#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define SIZE 256

int is_valid_number(const char *token) {
  int len = strlen(token);
  if (len > 1 && token[0] == '0') return 0;
  for (int i = 0; i < len; i++) {
    if (!isdigit(token[i])) return 0;
  }
  int num = atoi(token);
  if (num > 255) return 0;
  return 1;
}

int is_valid_ip(const char * addr) {
  int ct = 0;
  const char *delim = ".";
  char str[SIZE];
  memset(str, 0, sizeof(str));
  strncpy(str, addr, sizeof(str));
  char *token = strtok(str, delim);  while (token) {
    if (!is_valid_number(token)) return 0;
    ct++;
    token = strtok(NULL, delim);
  }
  return ct == 4;
};
