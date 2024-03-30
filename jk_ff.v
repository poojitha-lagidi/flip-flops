module jk_ff ( 
	input clk, 
	input reset, 
	input j, 
	input k, 
	output reg q, 
	output q_not
	);  
  
    always @ (posedge clk or negedge reset)  begin
      if (!reset)
		q <= 1'b0;
	  else begin
		case ({j,k})  
			2'b00 :  q <= q;  
			2'b01 :  q <= 0;  
			2'b10 :  q <= 1;  
			2'b11 :  q <= ~q;  
       		endcase 
	  end
	end
	
assign q_not = ~q;
	
endmodule  

`timescale 1us/1ns
module jk_ff_tb();

    	reg j; reg k;
	reg clk = 0;
	reg reset;
	wire q;
    	wire q_not;
	reg [1:0] delay;
   	integer i;
	
	// Instantiate the DUT
	jk_ff JKFF0( .clk(clk), .reset(reset), .j(j), .k(k), .q(q), .q_not(q_not));
	
	// Create the clk signal
	always begin
	    #0.5 clk = ~clk;
	end
	
    	// Create stimulus	  
    	initial begin
		reset = 0; j = 0; k = 0;
		#1;	reset = 1;
		#1; j = 0; k = 1;
		#1; j = 1; k = 0;
		#1; j = 1; k = 1;
		#1; j = 0; k = 0;
		#1; j = 1; k = 0;
	   	#(1.2); reset = 0; // reset the FF again		
	 end
	
    	// This will stop the simulator when the time expires
   	initial begin
    	    #10 $stop;
    	end  
endmodule
