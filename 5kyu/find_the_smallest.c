#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

char del(char *s, int ndx) {
  assert(s != NULL);
  
  int end = strlen(s);
  assert(ndx >= 0 && ndx < end);
  
  char ch = s[ndx];
  for (int i = ndx; i < end; i++) {
    s[i] = s[i+1];
  }
  return ch;
}

char* insert(char *s, char ch, int ndx) {
  int end = strlen(s);

  if (ndx < 0) ndx = 0;
  else if (ndx > end) ndx = end;
  
  for (int i = end; i >= ndx; i--) {
    s[i+1] = s[i];
  }
  s[ndx] = ch;
  return s;
}

long long* smallest(long long n) {
  printf("%lld\n", n);
  long long *arr = (long long*)malloc(sizeof(long long) * 3);

  char s[256];
  char ds[256];
  char is[256];
  memset(s, 0, sizeof(s));
  sprintf(s, "%lld", n);
  int sz = strlen(s);
  arr[0] = n;
  arr[1] = 0;
  arr[2] = 0;
  for (int i = 0; i < sz; i++) {
    memset(ds, 0, sizeof(ds));
    strcpy(ds, s);
    char ch = del(ds, i);
    for (int j = 0; j < sz; j++) {
      memset(is, 0, sizeof(is));
      strcpy(is, ds);
      insert(is, ch, j);
      if (arr[0] > atoll(is)) {
        arr[0] = atoll(is);
        arr[1] = i;
        arr[2] = j;
      }
    }
  }
  return arr;
}
