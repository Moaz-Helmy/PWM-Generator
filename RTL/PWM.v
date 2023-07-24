/*
    Author: Moaz Mohamed
    Description: This is the source Verilog code of the top module that describes the PWM Generator.
*/
`include "Generic_Timer.v"
module PWM #(parameter BITS = 4,TIMER_BITS = 4)(
    input wire clk,
    input wire reset,
    input wire [TIMER_BITS-1:0]Final_Value,
    input wire [BITS:0] duty,
    output reg pwm_out
);
    
    /*Internal Signals*/
    wire counter_en;
    
    /*Counter Value*/
    reg [BITS-1:0] count_reg,count_next;

    /*PWM outputs*/
    reg pwm_next,pwm_reg;

    /*Timer Instance*/
    Timer #(.TIMER_BITS(TIMER_BITS)) U1(
        .clk(clk),
        .reset(reset),
        .enable(1'b1),
        .Final_Value(Final_Value),
        .tick(counter_en)
    );

    /*Sequential block*/
    always @(posedge clk, negedge reset) begin
        if (~reset) begin
            count_reg<='b0;
        end
        else if(counter_en)
        begin
            count_reg<=count_next;
            pwm_reg<=pwm_next;
        end
        else
        begin
            count_reg<=count_reg;
            pwm_reg<=pwm_reg;
        end
    end

    /*PWM next state logic*/
    always @(*) begin
        if (count_reg < duty) begin
            pwm_next=1'b1;
        end
        else
        begin
            pwm_next=1'b0;
        end
    end

    /*Up counter next state logic*/
    always @(*) begin
        count_next=count_reg+1'b1;
    end

    /*PWM Output logic*/
    always @(*) begin
        pwm_out=pwm_reg;
    end

endmodule