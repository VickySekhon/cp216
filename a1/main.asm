/*
-------------------------------------------------------
-------------------------------------------------------
Author:
ID:
Email:
Date:    2024-03-13
-------------------------------------------------------
Working with stack frames.
Find minimum and maximum values in a list.
-------------------------------------------------------
*/
.org 0x1000  // Start at memory location 1000
.text        // Code section
.global _start
_start:

//=======================================================

// your code here

/*
  start - start address of list
  end - end address of list
  min - address of minimum result
  max - address of maximum result
*/
ldr r0, =Max
stmfd sp!, {r0}
ldr r0, =Min 
stmfd sp!, {r0} 
ldr r0, =_Data
stmfd sp!, {r0} 
ldr r0, =Data 
stmfd sp!, {r0}

bl MinMax

add sp, sp, #16



//=======================================================

_stop:
b    _stop

//-------------------------------------------------------
MinMax:
/*
-------------------------------------------------------
Finds the minimum and maximum values in a list.
Equivalent of: MinMax(*start, *end, *min, *max)
Passes addresses of list, end of list, max, and min as parameters.
-------------------------------------------------------
Parameters:
  start - start address of list
  end - end address of list
  min - address of minimum result
  max - address of maximum result
Uses:
  r0 - address of start of list
  r1 - address of end of list
  r2 - minimum value so far
  r3 - maximum value so far
  r4 - address of value to process
-------------------------------------------------------
*/
stmfd   sp!, {fp}       // preserve frame pointer
mov    fp, sp           // Save current stack top to frame pointer
// allocate local storage (none)
stmfd  sp!, {r0-r4}     // preserve other registers

ldr    r0, [fp, #4]     // Get address of start of list
ldr    r2, [r0]         // store first value as minimum
ldr    r3, [r0], #4     // store first value as maximum
ldr    r1, [fp, #8]     // get address of end of list

MinMaxLoop:
cmp    r0, r1           // Compare addresses
beq    _MinMax
ldr    r4, [r0], #4
cmp    r4, r2
movlt  r2, r4
cmp    r4, r3
movgt  r3, r4
b      MinMaxLoop

_MinMax:
// Store results to address parameters
ldr    r0, [fp, #12]
str    r2, [r0]         // store minimum
ldr    r0, [fp, #16]
str    r3, [r0]         // store maximum

ldmfd  sp!, {r0-r4}     // pop preserved registers
// deallocate local storage (none was allocated)
ldmfd   sp!, {fp}       // pop frame pointer
bx      lr              // return from subroutine

//-------------------------------------------------------
.data  // Data section
.align
Data:
.word    4,5,-9,0,3,0,8,-7,12    // The list of data
_Data:    // End of list address
Min:
.space 4
Max:
.space 4

.end