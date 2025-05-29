#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>

#include "core.h"
#include "vec.h"

struct node {
    const char *value;
    struct node *left;
    struct node *right;
};

typedef struct node *nodeptr;


static nodeptr node_next(vec(nodeptr) **stack, nodeptr x)
{
    if (!*stack) *stack = vec_alloc(nodeptr);
    if (x->right) vec_push(nodeptr, stack, x->right);
    if (x->left) vec_push(nodeptr, stack, x->left);

    if (!vec_length(nodeptr, *stack)) {

        free(*stack);
        *stack = NULL;
        return NULL;
    } 

    return vec_pop(nodeptr, stack);
}

int main()
{
    struct node root = { "root",
        &(struct node){ "left",
            &(struct node) { "left.left" },
            &(struct node) { "left.right" },   
        },
        &(struct node){ "right",
            &(struct node) { "right.left" },
            &(struct node) { "right.right" }, 
        },
    };

    vec(nodeptr) *stack = { };

    for (nodeptr x = &root; x; x = node_next(&stack, x))
        printf("%s\n", x->value);
}
