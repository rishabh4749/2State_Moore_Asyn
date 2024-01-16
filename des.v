`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.01.2024 13:44:33
// Design Name: 
// Module Name: des
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_module(clk, reset, in, out);
    input clk;
    input reset;  
    input in;
    output out;


    reg [1:0] present_state, next_state;
	parameter state_b = 2'b01, state_a = 2'b10;
    
    always @ (*)
        begin
           present_state = next_state; 
        end
    
    always @ (posedge clk)
        begin
            if(reset)
                next_state <= state_b[1:0];
           	else
                begin
                    case(present_state[1:0])
                        state_b : begin
                            if(~in)
                                next_state <= state_a[1:0];
                           	else
                                next_state <= state_b[1:0];
                        end
                        
                        state_a : begin
                            if(~in)
                                next_state <= state_b[1:0];
                            else
                                next_state <= state_a[1:0];
                        end
                        
                        
                    endcase
                end
        end
    
    assign out = (present_state == state_b[1:0]);

endmodule