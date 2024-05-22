/*
-------------------------------------------------------
-------------------------------------------------------
Author: Vicky Sekhon 
ID: 169024498 
Email: sekh4498@mylaurier.ca 
Date:    2024-03-30
-------------------------------------------------------
Uses a subroutine to read strings from the UART into memory.
-------------------------------------------------------
*/

1. Determine the initial value to be loaded to the Counter Start Value registers required to generate a time delay of 2s.

Answer: 
-------
	
	Logic
	-----

	Solve for 'Count start value'. 

	Interval timer:
	
		Count start value = Time delay / Clock period
	
	where:
		Time delay = 2s 
		Clock period = 1/100 MHz
	
	solve
	-----
	
		Count start value = 2/(1/100) * 10^6 (convert to hertz)
		Count start value = 200 * 10^6
		Count start value = 200 000 000
	
	Therefore, to generate a time delay of 2s the required Count start value is: 200 000 000 Hz 

