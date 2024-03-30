module t_ff(
	input reset,
    input clk,
    input t,
	output reg q,
    output q_not
    );
	
	always @(posedge clk or negedge reset) begin
	    if (!reset)
		    q <= 1'b0;
	    else
		    q <= ~t;  
	end
	
	assign q_not = ~q;
	
endmodule


`timescale 1us/1ns
module t_ff_tb();

    reg t;
	reg clk = 0;
	reg reset;
	wire q;
    wire q_not;
	reg [1:0] delay;
    integer i;
	
	// Instantiate the DUT
	t_ff TFF0( .reset(reset), .clk(clk), .t(t), .q(q), .q_not(q_not));
	
	// Create the clk signal
	always begin
	    #0.5 clk = ~clk;
	end
	
    // Create stimulus	  
    initial begin
        reset = 0; t = 0;
		#1;	reset = 1;
	    for (i=0; i<5; i=i+1) begin
		   delay = $urandom_range(1,3);
		   #(delay) t = ~t; // toggle the FF at random times
		end	
        #(0.2); reset = 0; // reset the FF again		
	end
	
    // This will stop the simulator when the time expires
    initial begin
        #10 $stop;
    end  
endmodule
