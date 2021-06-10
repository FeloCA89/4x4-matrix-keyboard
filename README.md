# 4x4-matrix-keyboard
read input from a 4x4 matrix keyboard and show the result in a display 7 segment

Introduction.
This practice seeks to make a program to capture keyboard input 4 x 4 size matrix with which 
the input should be displayed on a seven-digit display segments.

It is important to know the differences between the mealy and moore type state machines since
This depends on the structure that the VHDL code will carry since in one the output depends 
only on the present state and in another the output depends on both the input and the present 
state, for This practice will make a status for each column in such a way that we will enable 
only one column in each state and we will read the row that is activated when pressing a key 
in case of not pressing any key in that column we will go to the next state that is to say the 
next column.
Another important consideration is the time it will last in each state since the frequency of 
the built-in clock is generally 50MHz and we need to define the amount of clock in which each 
state will change t = 1 / f.
