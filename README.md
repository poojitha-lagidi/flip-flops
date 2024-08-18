# FlipFlops (FF)
Flip Flops are memory elements in a digital circuit and are basic building blocks of sequential circuits. FF are **edge triggered** which change their state on rising or falling edge of a clock signal and is more suitable for synchronous systems. <br />
Edge triggering is also called as **Dynamic Triggering** where output changes with respect to input only at instants of selected **level transitions**. When level changes from '_0_' to '_1_' or '_1_' to '_0_' then it is called level transition.<br />
Use non-blocking operator for sequential logic.
The FFs in this project has a positive edge clock, the reset is asynchronous with the clock signal. 
always blocks are commonly used for describing sequential logic. In the testbench the reset is first set to '_0_' and then to '_1_' to bring the circuit to stable state. 
<br />
In Verilog, urandom_range() is a system function used to generate random unsigned integers within a specified range. This function is commonly used in verification environments, especially when randomized testbenches are employed to verify the functionality of digital designs.
