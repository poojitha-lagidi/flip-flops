module sr_ff ( 
	input clk, 
	input reset, 
	input s, 
	input r, 
	output reg q, 
	output q_not
	);  
  
    always @ (posedge clk or negedge reset)  begin
      if (!reset)
		q <= 1'b0;
	  else begin
		case ({s,r})  
			2'b00 :  q <= q;  
			2'b01 :  q <= 0;  
			2'b10 :  q <= 1;  
			2'b11 :  q <= 1'bX;  
        endcase 
	  end
	end
	
assign q_not = ~q;
	
endmodule  

`timescale 1us/1ns
module sr_ff_tb();

    reg s; reg r;
	reg clk = 0;
	reg reset;
	wire q;
    wire q_not;
	reg [1:0] delay;
    integer i;
	
	// Instantiate the DUT
	sr_ff SRFF0( .clk(clk), .reset(reset), .s(s), .r(r), .q(q), .q_not(q_not));
	
	// Create the clk signal
	always begin
	    #0.5 clk = ~clk;
	end
	
    // Create stimulus	  
    initial begin
		reset = 0; s = 0; r = 0;
		#1;	reset = 1;
		#1; s = 0; r = 1;
		#1; s = 1; r = 0;
		#1; s = 1; r = 1;
		#1; s = 0; r = 0;
		#1; s = 1; r = 0;
	    #(1.2); reset = 0; // reset the FF again		
	end
	
    // This will stop the simulator when the time expires
    initial begin
        #10 $stop;
    end  
endmodule
