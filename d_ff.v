module d_ff(
	input reset,
    input clk,
    input d,
	output reg q,
    output q_not
    );
	
	always @(posedge clk or negedge reset) begin
	    if (!reset)
		    q <= 1'b0;
	    else
		    q <= d;  
	end
	
	assign q_not = ~q;
	
endmodule


`timescale 1us/1ns
module d_ff_tb();

    reg d;
	reg clk = 0;
	reg reset;
	wire q;
    wire q_not;
	reg [1:0] delay;
    integer i;
	
	// Instantiate the DUT
	d_ff DFF0( .reset(reset), .clk(clk), .d(d), .q(q), .q_not(q_not));
	
	// Create the clk signal
	always begin
	    #0.5 clk = ~clk;
	end
	
    // Create stimulus	  
    initial begin
        reset = 0; d = 0;
		#1;	reset = 1;
	    for (i=0; i<5; i=i+1) begin
		   delay = $urandom_range(1,3);
		   #(delay) d = ~d; 
		end	
        #(0.2); reset = 0; // reset the FF again		
	end
	
    // This will stop the simulator when the time expires
    initial begin
        #10 $stop;
    end  
endmodule
