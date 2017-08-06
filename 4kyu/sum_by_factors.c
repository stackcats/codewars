#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#define SIZE 10240

char* sumOfDivided(int* lst, int l) {
  int arr[SIZE];
  int flag[SIZE];
  memset(arr, 0, sizeof(int) * SIZE);
  memset(flag, 0, sizeof(int) * SIZE);
  
  for (int i = 0; i < l; i++) {
    int num = abs(lst[i]);
    int n = num;
    int j = 2;
    while (j <= num) {
      if (n % j == 0) {
        flag[j] = 1;
        arr[j] += lst[i];

        while (n % j == 0) {
          n /= j;
        }
      } else {
        j++;
      }
    }    
  }

  char *str = (char*)malloc(sizeof(char) * SIZE);
  memset(str, 0, sizeof(char) * SIZE);
  for (int i = 0; i < SIZE; i++) {
    if (flag[i]) {
      sprintf(str, "%s(%d %d)", str, i, arr[i]);
    }
  }
  return str;
}
