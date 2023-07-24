/*
    Author: Moaz Mohamed
    Description: This is the source verilog code describing a parametrized timer that ticks every specific time. 
                 the tick time depends on the Final Value which is fed into the module. 
*/

module Timer #(parameter TIMER_BITS=4)(
    input wire clk,
    input wire reset,
    input wire enable,
    input wire [TIMER_BITS-1:0] Final_Value,
    output reg tick
);
    
    /*Define a register with the specified number of bit width*/
    reg [TIMER_BITS-1:0] Q_reg,Q_next;
    
    /*Sequential always block*/
    always @(posedge clk, negedge reset) begin
        if(~reset)
        begin
            Q_reg<='b0;
        end
        else if (enable)
        begin
            Q_reg<=Q_next;
        end
        else
        begin
            Q_reg<=Q_reg;
        end
    end

    /*Combinational Output*/
    always @(*) begin
        if (Q_reg == Final_Value) begin
            tick=1'b1;
        end
        else
        begin
            tick=1'b0;
        end
    end

    /*Next state logic*/
    always @(*) begin
        if(tick == 1'b1)
        begin
            Q_next='b0;
        end
        else
        begin
            Q_next=Q_reg+1'b1;
        end
    end
    
endmodule