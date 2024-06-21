`timescale 1 ns/ 1 ps

// Preprocessor Directives
`define DELAY 1

module traffic_light_controller_Mealy_tb;

// Parameter definitions
parameter ENDTIME  = 400000;

// Input regs
reg clk; // clock = 50 MHz
reg rstn; // reset active low
reg sensor; // sensor

// Output wires
wire [2:0] light_highway, light_farmway; // output of lights

//  Instantiation
traffic_light_controller_Mealy inst(
    .clk(clk), 
    .rstn(rstn),
    .sensor(sensor),
    .light_highway(light_highway), 
    .light_farmway(light_farmway));

// Initial Conditions
initial begin
    clk = 1'b0;
    rstn = 1'b0;
    sensor = 1'b0;
end

// Generating Test Vectors
initial begin
    main;
end

task main;
    fork
        clock_gen;
        reset_gen;
        operation_flow;
        debug_output;
        endsimulation;
    join
endtask

task clock_gen;
begin
    forever #`DELAY clk = !clk;
end
endtask

task reset_gen;
begin
    rstn = 0;
    
    # 20
    rstn = 1;
end
endtask

task operation_flow;
begin
    sensor = 0;
    
    # 60
    sensor = 1;
    
    # 120
    sensor = 0;
    
    # 120
    sensor = 1;
end
endtask

// Debug output
task debug_output;
begin
    $display("------------------ SIMULATION RESULT ------------------");
    $monitor("TIME = %d, reset = %b, sensor = %b, light of highway = %h, light of farmway = %h", $time, rstn , sensor, light_highway, light_farmway);
end
endtask

//Determines the simulation limit
task endsimulation;
begin
    #ENDTIME
    $display("------------------ THE SIMUALTION END ------------------");
    $finish;
end
endtask
    
endmodule