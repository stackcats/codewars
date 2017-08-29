#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define N 4
#define MAX 16

int arr[N][N];
int tran[N][N];
int ans[N][N];

void parray(int *a) {
  for (int i = 0; i < N; i++) {
    printf("%d ", a[i]);
  }
  printf("\n");
}

void pmat(int a[][4]) {
  for (int i = 0; i < N; i++) {
    for (int j = 0; j < N; j++) {
      printf("%d ", a[i][j]);
    }
    printf("\n");
  }
  printf("\n");
}

int scan_left(int *arr, int ct) {
  printf("%d\n", ct);
  if (ct == 0) return 1;

  int sum = 1;
  for (int i = 0, j = i + 1; i < N; j++) {
    if (arr[i] < arr[j]) {
      sum++;
      i = j;
    }
  }
  return sum == ct;
}

int scan_right(int *arr, int ct) {
  if (ct == 0) return 1;

  int sum = 1;
  for (int i = N - 1, j = i - 1; j >= 0; j--) {
    if (arr[i] < arr[j]) {
      sum++;
      i = j;
    }
  }
  return sum == ct;
}

void transpos() {
  memset(tran, 0, sizeof(tran));
  for (int i = 0; i < N; i++) {
    for (int j = 0; j < N; j++) {
      tran[j][i] = arr[i][j];
    }
  }
}

int skyscraper(int rows[][2], int cols[][2]) {
  for (int i = 0; i < N; i++) {
    if (!scan_left(arr[i], rows[i][0]) || !scan_right(arr[i], rows[i][1])) {
      return 0;
    }
  }

  transpos();

  for (int i = 0; i < N; i++) {
    if (!scan_left(tran[i], cols[i][0]) || !scan_right(tran[i], cols[i][1])) {
      return 0;
    }
  }

  return 1;
}

int check(int x, int y) {
  for (int i = 0; i < y; i++) {
    if (arr[x][y] == arr[x][i]) {
      return 0;
    }
  }

  for (int i = 0; i < x; i++) {
    if (arr[x][y] == arr[i][y]) {
      return 0;
    }
  }

  return 1;
}

int dfs(int n, int x, int rows[][2], int cols[][2]) {
  if (n >= MAX) {
    if (skyscraper(rows, cols)) {
      memcpy(ans, arr, sizeof(arr));
      pmat(ans);
      return 1;
    }
    return 0;
  }

  int row = n / N;
  int col = n % N;
  arr[row][col] = x;
  if (!check(row, col)) {
    return 0;
  }

  for (int i = 1; i <= N; i++) {
    int ok = dfs(n + 1, i, rows, cols);
    if (ok) return 1;
  }
  
  return 0;
}

int** SolvePuzzle (int *clues) {
  memset(arr, 0, sizeof(arr));

  int rows[4][2] = {
    {clues[15], clues[4]},
    {clues[14], clues[5]},
    {clues[13], clues[6]},
    {clues[12], clues[7]}
  };
  
  int cols[4][2] = {
    {clues[0], clues[11]},
    {clues[1], clues[10]},
    {clues[2], clues[9]},
    {clues[3], clues[8]}
  };

  puts("=======");
  for (int i = 0; i < N; i++) {
    for (int j = 0; j < 2; j++) {
      printf("%d ", rows[i][j]);
    }
    printf("\n");
  }
  puts("=======");
  for (int i = 1; i <= N; i++) {
    int ok = dfs(0, i, rows, cols);
    if (ok) pmat(arr);
  }
  
  return NULL;
}

int main() {
  int clues[16] = { 2, 2, 1, 3,  
                    2, 2, 3, 1,  
                    1, 2, 2, 3,  
                    3, 2, 1, 3 };

  SolvePuzzle(clues);
  //pmat(arr);
  pmat(ans);
  return 0;
}
