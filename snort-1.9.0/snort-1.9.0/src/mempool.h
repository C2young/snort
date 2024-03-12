#ifndef _MEMPOOL_H
#define _MEMPOOL_H

#include "sf_sdlist.h"

typedef unsigned int PoolCount;

typedef struct _MemBucket
{
    SDListItem *key;
    int used;
    void *data;
} MemBucket;

typedef struct _MemPool
{
    void **datapool; /* memory buffer for MemBucket->data */
    
    MemBucket *bucketpool; /* memory buffer */

    SDListItem *listpool; /* list of things to use for memory bufs */

    PoolCount free; /*  free block count */
    PoolCount used;  /* used block count */

    PoolCount total;
    
    sfSDList free_list;
    sfSDList used_list;
    
    size_t obj_size;    
} MemPool;

int mempool_init(MemPool *mempool, PoolCount num_objects, size_t obj_size);
int mempool_destroy(MemPool *mempool);
MemBucket *mempool_alloc(MemPool *mempool);
void mempool_free(MemPool *mempool, MemBucket *obj);

#endif /* _MEMPOOL_H */


