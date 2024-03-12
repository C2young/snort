#ifndef _SF_SDLIST
#define _SF_SDLIST

/* based off Linked List structure p. 57  _Mastering algorithms in C_
 *
 * Differs from sf_list by using static listitem blocks.
 *
 * Use mempool as the interface to this code instead of trying to use it directly
 * 
 */

typedef struct _SDListItem {
    void *data;
    struct _SDListItem *next;
    struct _SDListItem *prev;
} SDListItem;


typedef struct sfSDList {
    int size;
    SDListItem *head;
    SDListItem *tail;
    void (*destroy)(void *data); /* delete function called for each
                                    member of the linked list */
} sfSDList;


/* initialize a DList */
int sf_sdlist_init(sfSDList *list, void (*destroy)(void *data));

/* delete an DList */
int sf_sdlist_delete(sfSDList *list);

/* insert item, putting data in container */
int sf_sdlist_insert_next(sfSDList *list, SDListItem *item, void *data,
                          SDListItem *container);

/* remove the item after the item */
int sf_sdlist_remove_next(sfSDList *list, SDListItem *item);

/* remove this item from the list */
int sf_sdlist_remove(sfSDList *list, SDListItem *item);

/* append at the end of the list */
int sf_sdlist_append(sfSDList *list, void *data, SDListItem *container);

void print_sdlist(sfSDList *list);

#endif /* _SF_DLIST */
