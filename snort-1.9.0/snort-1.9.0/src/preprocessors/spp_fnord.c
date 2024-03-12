/* $Id */
/* spp_fnord:  snort preprocessor - Multi-architecture mutated NOP sled 
 * detector - copyright 2002 Dragos Ruiu (dr@kyx.net) 
 * info on this at CanSecWest and at SANS Real World IDS 
 * Workshop. (a.k.a. Martycon :)
 */


/*  LESS code == BETTER ! :-)  */

#include "decode.h"
#include "generators.h"
#include "log.h"
#include "plugbase.h"
#include "debug.h"
#include "parser.h"
#include "checksum.h"
#include "detect.h"

#define MAXNOP         128 /* NOTE this must be a multiple of 4!!!*/
#define MAXFUZZ          3
#define SKIP             0
#define BACKTRACK        1
#define SKIPIA32	    11
#define SKIPHPPA	    12
#define SKIPSPARC       13
#define WALK            20
#define WALKIA32	    21
#define WALKHPPA	    22
#define WALKSPARC       23


#define VAL          (*pointer)
#define CMP(x)		 (*pointer == x)
#define CMPL(l,x)	 (*(pointer+l) == x)
#define CMP2(x,y)	 ((*pointer == x) && (*(pointer+1) == y))
#define CMPL2(l,x,y) ((*(pointer+l) == x) && (*(pointer+l+1) == y))
#define CMP3(x,y,z)	 ((*pointer == x) && (*(pointer+1) == y) && (*(pointer+2) == z))
#define CMPL3(l,x,y,z)	((*(pointer+l) == x) && (*(pointer+l+1) == y) && (*(pointer+l+2) == z)) 
#define CMP4(x,y,z,q)   ((*pointer == x) && (*(pointer+1) == y) && (*(pointer+2) == z) && (*(pointer+3) == q))
#define CMPL4(l,x,y,z,q) ((*(pointer+l) == x) && (*(pointer+l+1) == y) && (*(pointer+l+2) == z) && (*(pointer+l+3) == q)) 


#define INC(val)  ((pointer < (max - val)) ? (pointer += val) : (pointer = max)) 


void PreprocFnord(Packet *p);
void FnordInit(u_char *args);

/*
 * Function: SetupFnord()
 * Purpose:
 * Registers the preprocessor keyword and initialization function
 * into the preprocessor list.  This is the function that gets called from
 * InitPreprocessors() in plugbase.c.
 * Arguments: None.
 * Returns: void function
 */
void SetupFnord()
{
    RegisterPreprocessor("fnord", FnordInit);

    DEBUG_WRAP(DebugMessage(DEBUG_STREAM,  "Preprocessor: fnord "
                "is setup...\n"););
}

void FnordInit(u_char *args)
{
    AddFuncToPreprocList(PreprocFnord);
}

void PreprocFnord(Packet *p)
{
    register u_int8_t * pstart;
    register u_int8_t * pointer;
    register u_int8_t * max;
    int fuzz, len, mode, plen;
    Event event;

    /* check to make sure the IP header exists and that
     * there isn't a bad IP checksum
     */
    if(!p->iph || !p->data || (p->csum_flags & CSE_IP))
    {
        return;
    }

    /* OK here we go, let's git us some mutants  */
    pstart = p->data;         /* skip basic ip header */
    plen = p->dsize; 
    pointer = pstart;
    max = pstart + plen - 4;
    mode = SKIP;
    fuzz = 0;
    len = 0;

    while(pointer < max)
    {
#ifdef DEBUG
        fprintf(stdout,"pointer: %08X max: %08X count: %d val: "
                "%02X %02X %02X %02X len: %d mode: %d fuzz: %d\n", 
                pointer, max, (plen - (max - pointer)), VAL, *(pointer+1), 
                *(pointer+2), *(pointer+3), len, mode, fuzz);
        fflush(stdout);
#endif /* DEBUG */

        /* SPARC 4 byte nop detector */
        /* note it is important to check these before intel 
         * because 0x96 and 0x98 overlap 
         */
        if(
                CMP3(0x20,0xBF,0xBF) ||            /* bn -random        */
                CMP3(0x81,0xD0,0x20) ||            /* tn random         */
                CMP4(0x89,0xA5,0x08,0x22) ||       /* fadds %f20,%f2,%f4*/
                (CMP(0x96) &&
                 ( CMPL2(1,0x23,0x60) ||           /* sub %o5,0x42,%o3  */
                   CMPL3(1,0x24,0x80,0x12))) ||    /* sub %l2,%l2,%o3   */
                CMP4(0x98,0x3E,0x80,0x12) ||       /* xnor %i2,%l2,%o4  */
                CMP3(0xA0,0x26,0xE0) ||            /* sub %i3,0x42,%l0  */
                (CMP(0xA2) &&
                 ( CMPL3(1,0x03,0x40,0x12) ||      /* add %o5,%l2,%l1   */
                   CMPL3(1,0x0E,0x80,0x13) ||      /* and %i2,%l3,%l1   */
                   CMPL3(1,0x1A,0x40,0x0A) ||      /* xor %o1,%o2,%l1   */
                   CMPL3(1,0x1C,0x80,0x12))) ||    /* xor %l2,%l2,%l1   */
                (CMP(0xA4) &&
                 ( CMPL2(1,0x04,0xE0) ||           /* add %l3,0x42,%l2  */
                   CMPL3(1,0x27,0x40,0x12) ||      /* sub %i5,%l2,%l2   */
                   CMPL2(1,0x32,0xA0))) ||         /* orn %o2,0x42,%l2  */
                (CMP(0xB2) &&
                 ( CMPL2(1,0x03,0x60) ||           /* add %o5,0x42,%i1  */
                   CMPL3(1,0x26,0x80,0x19))) ||    /* sub %i2,%i1,%i1   */
                (CMP(0xB6) &&
                 ( CMPL3(1,0x06,0x40,0x1A) ||      /* add %i1,%i2,%i3   */
                   CMPL3(1,0x16,0x40,0x1A) ||      /* or  %i1,%i2,%i3   */
                   CMPL3(1,0x04,0x80,0x12) ||      /* add %l2,%l2,%i3   */
                   CMPL2(1,0x03,0x60))) ||         /* add %o5,0x42,%i3  */
                CMP3(0xBA,0x56,0xA0)               /* umul %i2,0x42,%i5 */
                )
                {
                    if(mode == SKIP)
                    {
                        mode = BACKTRACK;
                        INC(0 - (fuzz + MAXNOP));
                    }
                    else if(mode == WALKSPARC)
                    {
                        len += 4;
                        INC(4);
                    }
                    else if(mode == SKIPSPARC)
                    {
                        mode = WALKSPARC;
                        INC( - MAXNOP);
                    }
                    else
                    {
                        mode = SKIPSPARC;
                        len = 0;
                        fuzz = 0;
                        INC(MAXNOP);
                    }
                }

        /* HPPA nop detector */
        else if(
                (CMP(0x08) &&
                 ( CMPL3(1,0x21,0x02,0x9A) ||    /* xor %r1,%r1,%r26        */
                   CMPL3(1,0x41,0x02,0x83) ||    /* xor %r1,%r2,%r3         */
                   CMPL3(1,0xA4,0x02,0x46))) ||  /* or  %r4,%r5,%r6         */
                (CMP(0x09) &&
                 ( CMPL3(1,0x04,0x06,0x8F) ||    /* shladd %r4,2,%r8,%r15   */
                   CMPL3(1,0x09,0x04,0x07) ||    /* sub %r9,%r8,%r7         */
                   CMPL3(1,0x6A,0x02,0x8C) ||    /* xor %r10,%r11,%12       */
                   CMPL3(1,0xCD,0x06,0x0F))) ||  /* add %r13,%r14,%r15      */
                CMP4(0x94,0x6C,0xE0,0x84) ||     /* subi,OD 0x42,%r3,%r12   */
                CMP4(0xD0,0xE8,0x0A,0xE9) ||     /* shrpw %r8,%r7,8,%r9     */
                (CMP(0xB5) &&
                 ( CMPL2(1,0x03,0xE0) ||         /* addi,OD 0x42,%r8,%r3    */
                   CMPL2(1,0x4B,0xE0)))          /* addi,OD 0x42,%r10,%r11  */
               )
        {
            if(mode == SKIP)
            {
                mode = BACKTRACK;
                INC(0 - (fuzz + MAXNOP));
            }
            else if(mode == WALKHPPA)
            {
                len += 4;
                INC(4);
            }
            else if(mode == SKIPHPPA)
            {
                mode = WALKHPPA;
                INC( - MAXNOP);
            }
            else
            {
                mode = SKIPHPPA;
                len = 0;
                fuzz = 0;
                INC(MAXNOP);
            }
        }

        /* intel 3 byte with wildcard nop codes */
        else if(
                CMP2(0x6B,0xC0) ||                   /* imul N,%eax    */
                (CMP(0x83) &&
                 ( CMPL(1,0xE0) ||                  /* and N,%eax     */
                   CMPL(1,0xC8) ||                  /* or  N,%eax     */
                   CMPL(1,0xE8) ||                  /* sub N,%eax     */
                   CMPL(1,0xF0) ||                  /* xor N,%eax     */
                   CMPL(1,0xF8) ||                  /* cmp N,%eax     */
                   CMPL(1,0xF9) ||                  /* cmp N,%ecx     */
                   CMPL(1,0xFA) ||                  /* cmp N,%edx     */
                   CMPL(1,0xFB) ||                  /* cmp N,%ebx     */
                   CMPL(1,0xC0))) ||                /* add N,%eax, N  */
                (CMP(0xC1) &&
                 ( CMPL(1,0xC0) ||                  /* rol N,%eax     */
                   CMPL(1,0xC8) ||                  /* ror N,%eax     */
                   CMPL(1,0xE8)))                   /* shr N,%eax     */
               )
        {
            if(mode == SKIP)
            {
                mode = BACKTRACK;
                INC(0 - (fuzz + MAXNOP));
            }
            else if(mode == WALKIA32)
            {
                len += 3;
                INC(3);
            }
            else if(mode == SKIPIA32)
            {
                mode = WALKIA32;
                INC(0 - (fuzz + MAXNOP));
            }
            else
            {
                mode = SKIPIA32;
                len = 0;
                fuzz = 0;
                INC(MAXNOP);
            }
        }

        /* intel 2 byte nop codes */
        else if(
                CMP2(0x33,0xC0) ||                   /* xor %eax,%eax  */
                CMP2(0x85,0xC0) ||                   /* test %eax,%eax */
                (CMP(0x87) &&
                 ( CMPL(1,0xD2) ||                  /* xchg %edx,%edx */
                   CMPL(1,0xDB) ||                  /* xchg %ebx,%ebx */
                   CMPL(1,0xC9))) ||                /* xchg %ecx,%ecx */
                (CMP(0x8C) &&
                 ( CMPL(1,0xC0) ||                  /* mov %es,%eax   */
                   CMPL(1,0xE0) ||                  /* mov %fs,%eax   */
                   CMPL(1,0xE8))) ||                /* mov %gs,%eax   */
                CMP(0xB0) ||                         /* mov N,%eax     */
                CMP2(0xF7,0xD0)                      /* not %eax       */
               )
        {
            if(mode == SKIP)
            {
                mode = BACKTRACK;
                INC(0 - (fuzz + MAXNOP));
            }
            else if(mode == WALKIA32)
            {
                len += 2;
                INC(2);
            }
            else if(mode == SKIPIA32)
            {
                mode = WALKIA32;
                INC(0 - (fuzz + MAXNOP));
            }
            else
            {
                mode = SKIPIA32;
                len = 0;
                fuzz = 0;
                INC(MAXNOP);
            }
        }

        /* one byte intel nop detector */
        else if(
                ((VAL >= 0x3f) && (VAL <=0x60)) ||  /* inc, dec, push, pop */ 
                ((VAL >= 0x90) && (VAL <=0x9F)) ||  /* nop, xchg, cwtl, 
                                                     * fwait, pushf safh, lahf 
                                                     */
                CMP(0x27) ||                        /* daa        "'" */
                CMP(0x2F) ||                        /* das        "/" */
                CMP(0x37) ||                        /* aaa        "7" */
                CMP(0x60) ||                        /* pusha      "`" */
                CMP(0xF5) ||                        /* cmc            */
                CMP(0xF8) ||                        /* clc            */
                CMP(0xF9) ||                        /* stc            */
                CMP(0xFC) 	                        /* cld            */
               )
        {
            if(mode == SKIP)
            {
                mode = BACKTRACK;
                INC(0 - (fuzz + MAXNOP));
            }
            else if(mode == WALKIA32)
            {
                len += 1;
                INC(1);
            }
            else if(mode == SKIPIA32)
            {
                mode = WALKIA32;
                INC(0 - (fuzz + MAXNOP));
            }
            else
            {
                mode = SKIPIA32;
                len = 0;
                fuzz = 0;
                INC(MAXNOP);
            }
        }
        else
        {   /* NO NOP CODE */
            if(mode == BACKTRACK)
            {
                INC(1);
            }
            else if(mode >= WALK)
            {
                mode = SKIP;
                INC(MAXNOP);
                fuzz = 0;
            }
            else
            {
                if(fuzz > MAXFUZZ || mode == SKIPHPPA || mode == SKIPSPARC)
                {
                    mode = SKIP;
                    INC(MAXNOP - fuzz);
                    fuzz = 0;
                }
                else
                {		/* only fuzz for SKIP and SKIPIA32 */
                    fuzz++;
                    INC(1);
                }
            }
        }

        if( len >= MAXNOP )
        {
            SetEvent(&event, GENERATOR_SPP_FNORD, FNORD_NOPSLED, 1, 0, 0, 0);

            if(mode == WALKIA32)
                CallAlertFuncs(p, FNORD_NOPSLED_IA32_STR, NULL, &event);
            if(mode == WALKHPPA)
                CallAlertFuncs(p, FNORD_NOPSLED_HPPA_STR, NULL, &event);
            if(mode == WALKSPARC)
                CallAlertFuncs(p, FNORD_NOPSLED_SPARC_STR, NULL, &event);
            pointer = max; /* no real point in checking more now is there :-) */
        }
    }
}
			
			
