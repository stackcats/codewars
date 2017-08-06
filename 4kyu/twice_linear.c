#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <assert.h>

#define SIZE 4096

typedef struct NODE {
  int data;
  struct NODE *next;
} Node;

Node* init_node(int n) {
  Node *node = (Node *)malloc(sizeof(Node));
  node->data = n;
  node->next = NULL;
  return node;
}

typedef struct {
  Node *head;
  int size;
} List;

List* init_list() {
  List* lst = (List*)malloc(sizeof(List));
  lst->head = NULL;
  lst->size = 0;
  return lst;
}

List* cons(List *lst, int n) {
  assert(lst);

  Node *node = init_node(n);
  node->next = lst->head;
  lst->head = node;
  lst->size += 1;
  return lst;
}

int head(List *lst) {
  assert(lst && lst->head);
  return lst->head->data;  
}

void free_list(List *lst) {
  assert(lst);
  Node *curr = lst->head;
  while (curr) {
    Node *node = curr;
    curr = curr->next;
    free(node);
  }
  free(lst);
  return;
}

typedef struct {
  int *arr;
  int size;
} Heap;

Heap* init_heap(int size) {
  assert(size >= 0);
  Heap *heap = (Heap*)malloc(sizeof(Heap));
  heap->arr = (int*)malloc(sizeof(int) * size);
  memset(heap->arr, 0, sizeof(int) * size);
  heap->size = 0;
  return heap;
}

void free_heap(Heap *heap) {
  assert(heap);
  free(heap->arr);
  free(heap);
}

Heap* shift_up(Heap *heap, int i) {
  assert(heap);
  int *arr = heap->arr;
  while (i / 2 > 0) {
    if (arr[i] < arr[i/2]) {
      int tmp = arr[i/2];
      arr[i/2] = arr[i];
      arr[i] = tmp;
    }
    i /= 2;
  }
  arr = NULL;
  return heap;
}

int min_child(Heap *heap, int i) {
  if (i * 2 + 1 > heap->size) return i * 2;
  if (heap->arr[i * 2] < heap->arr[i * 2 + 1]) return i * 2;
  return i * 2 + 1;
}

Heap* shift_down(Heap *heap, int i) {
  assert(heap);
  while (i * 2 <= heap->size) {
    int mc = min_child(heap, i);
    if (heap->arr[i] > heap->arr[mc]) {
      int tmp = heap->arr[i];
      heap->arr[i] = heap->arr[mc];
      heap->arr[mc] = tmp;
    }
    i = mc;
  }
  return heap;
}

Heap* push(Heap *heap, int n) {
  assert(heap);
  heap->size += 1;
  heap->arr[heap->size] = n;
  shift_up(heap, heap->size);
  return heap;
}

int pop(Heap *heap) {
  assert(heap && heap->arr);
  int data = heap->arr[1];
  heap->arr[1] = heap->arr[heap->size];
  heap->size -= 1;
  shift_down(heap, 1);
  return data;
}
void print_heap(Heap *heap) {
  assert(heap);
  int *arr = heap->arr;
  for (int i = 0; i < heap->size; i++) {
    printf("%d ", arr[i]);
  }
  arr = NULL;
  puts("");
}

int dblLinear(int n) {
  Heap *heap = init_heap(SIZE);
  List *lst = init_list();
  push(heap, 1);
  cons(lst, 1);
  int i = 0;
  while (i < n) {
    int x = pop(heap);
    int y = 2 * x + 1;
    int z = 3 * x + 1;
    if (x > head(lst)) {
      cons(lst, x);
      i++;
    }
    push(heap, y);
    push(heap, z);
  }

  int ans = head(lst);
  free(heap);
  free(lst);
  return ans;
}
