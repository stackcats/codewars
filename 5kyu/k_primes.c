#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// In the preloaded section are some functions that can help.
// They can be used as a small library.
// There is no file to include, only the templates below.

struct node {
  int data;
  struct node *next;
};
struct list {
  size_t sz;
  struct node *head;
};

struct list* createList();

// push data at the head of the list
void insertFirst(struct list* l, int data);

struct list* reverse(struct list* l);

void listFree(struct list* l);

// functions to write
int factor(int n) {
  int ct = 0;
  int i = 2;
  while (i * i <= n) {
    while (n % i == 0) {
      n /= i;
      ct++;
    }
    i++;
  }
  if (n > 1) ct++;
  return ct;
}

struct list* kPrimes(int k, int start, int nd) {
  struct list* lst = createList();
  
  for (int i = start; i <= nd; i++) {
    if (factor(i) == k) {
      insertFirst(lst, i);
    }
  }
  return reverse(lst);
}

int puzzle(int s) {
  int ct = 0;
  struct list* l1 = kPrimes(1, 0, s);
  struct list* l3 = kPrimes(3, 0, s);
  struct list* l7 = kPrimes(7, 0, s);

  struct node* n1;
  struct node* n3;
  struct node* n7;

  for (n1 = l1->head; n1 != NULL; n1 = n1->next) {
    for (n3 = l3->head; n3 != NULL; n3 = n3->next) {
      for (n7 = l7->head; n7 != NULL; n7 = n7->next) {
        if (n1->data + n3->data + n7->data == s) {
          ct++;
        }
      }
    }
  }

  listFree(l1);
  listFree(l3);
  listFree(l7);
  return ct;
}
