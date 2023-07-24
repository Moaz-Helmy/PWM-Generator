/*
    Author: Moaz Mohamed
    Description: Testbench for the PWM Generator.
*/

/*time scale unit = 1ns with resolution=0.1ns*/
`timescale 1ns/100ps

module PWM_tb ();

    /*Test Signals*/
    reg clk_tb;
    reg reset_tb;
    reg [7:0] Final_Value_tb;
    reg [8:0] duty_tb;
    wire pwm_out_tb;
    /*Module instance*/
    PWM DUT(
        .clk(clk_tb),
        .reset(reset_tb),
        .Final_Value(Final_Value_tb),
        .duty(duty_tb),
        .pwm_out(pwm_out_tb)
    );
    
    /*Clock Generator with period 1ns*/
    always #0.5 clk_tb=~clk_tb;

    /*Initial block*/
    initial begin
        $dumpfile("PWM.vcd");
        $dumpvars;
        /*Reset*/
        clk_tb=1'b0;
        reset_tb=1'b0;
        Final_Value_tb='d3; //with switching freq of approximately 1MHz
        duty_tb='d64; //this should generate 0.25 duty

        #1
        reset_tb=1'b1;

        #30000;
        $stop;
    end
endmodule