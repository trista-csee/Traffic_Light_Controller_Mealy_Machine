/* Traffic Light Controller -
A sensor on the farmway is to detect if there are any vehicles 
and change the traffic light to allow the vehicles to cross the highway. 
Otherwise, highway light is always green since it has higher priority than the farmway. 
*/                                    
module traffic_light_controller_Mealy (clk, rstn, sensor, light_highway, light_farmway);   
    input clk; // clock = 50 MHz
    input rstn; // reset active low
    input sensor; // sensor
    
    output reg [2:0] light_highway, light_farmway; // output of lights

    // Binary Encoding
    parameter HGRE_FRED=2'b00, // Highway green and farmway red
              HYEL_FRED = 2'b01,// Highway yellow and farmway red
              HRED_FGRE=2'b10, // Highway red and farmway green
              HRED_FYEL=2'b11; // Highway red and farmway yellow
              
    reg[27:0] count=0, count_delay=0;
    reg delay10s=0, delay3s1=0, delay3s2=0, RED_count_en=0, YELLOW_count_en1=0, YELLOW_count_en2=0;
    wire clk_enable; // clock enable signal for 1s
    reg[1:0] current_state, next_state;
    
    // update current state
    always @(posedge clk or negedge rstn) begin
        if (~rstn)
            current_state <= 2'b00;
        else 
            current_state <= next_state; 
    end
    
    // combinational logic update output and next state
    always @(*) begin
        case (current_state)
            // green on highway and red on farmway
            HGRE_FRED: begin 
                    RED_count_en=0;
                    YELLOW_count_en1=0;
                    YELLOW_count_en2=0;

                    light_highway = 3'b001; // green on highway
                    light_farmway = 3'b100; // red on farmway

                    // if sensor detects vehicles on farmway, 
                    // green on highway and red on farmway turn to yellow on highway and red on farmway
                    if (sensor) 
                        next_state = HYEL_FRED; 
                    else 
                        next_state = HGRE_FRED;
            end
            // yellow on highway and red on farmway
            HYEL_FRED: begin                    
                    RED_count_en=0;
                    YELLOW_count_en1=1;
                    YELLOW_count_en2=0;

                    light_highway = 3'b010; // yellow on highway
                    light_farmway = 3'b100; // red on farmway
                    
                    // yellow on highway and red on farmway for 3s, 
                    // then turn to red on highway and green on farmway
                    if (delay3s1) 
                        next_state = HRED_FGRE;
                    else 
                        next_state = HYEL_FRED;
            end
            // red on highway and green on farmway
            HRED_FGRE: begin
                    RED_count_en=1;                    
                    YELLOW_count_en1=0;
                    YELLOW_count_en2=0;
                    
                    light_highway = 3'b100; // red on highway
                    light_farmway = 3'b001; // green on farmway

                    // red on highway and green on farmway for 10s, 
                    // then turn to red on highway then yellow on highway
                    if (delay10s) 
                        next_state = HRED_FYEL;
                    else 
                        next_state = HRED_FGRE;
            end
            // red on highway and yellow on farmway
            HRED_FYEL: begin
                    RED_count_en=0;
                    YELLOW_count_en1=0;
                    YELLOW_count_en2=1;

                    light_highway = 3'b100; // red on highway
                    light_farmway = 3'b010; // yellow on farmway

                    // red on highway and yellow on farmway for 3s,
                    // then turn to green on highway and red on farmway
                    if (delay3s2) 
                        next_state = HGRE_FRED;
                    else 
                        next_state = HRED_FYEL;
            end
            default: next_state = HGRE_FRED;
        endcase
    end

    // create red and yellow delay counts
    always @(posedge clk) begin
        if (clk_enable == 1) begin
            if (RED_count_en || YELLOW_count_en1 || YELLOW_count_en2) begin
                count_delay <= count_delay + 1;

                if ((count_delay == 9) && RED_count_en) begin
                    delay10s=1;
                    delay3s1=0;
                    delay3s2=0;
                    count_delay<=0;                
                end
                else if((count_delay == 2) && YELLOW_count_en1) begin
                    delay10s=0;
                    delay3s1=1;
                    delay3s2=0;
                    count_delay<=0;                
                end
                else if((count_delay == 2) && YELLOW_count_en2) begin
                    delay10s=0;
                    delay3s1=0;
                    delay3s2=1;
                    count_delay<=0;                
                end
                else begin
                    delay10s=0;
                    delay3s1=0;
                    delay3s2=0;                
                end
            end 
        end
    end
    
    // create 1s clock enable 
    always @(posedge clk) begin
        count <=count + 1;
        
        //if (count == 50000000) // 50,000,000 for 50 MHz clock running on real FPGA
        if (count == 3) // for testbench
            count <= 0;
    end
    
    //assign clk_enable = (count == 50000000) ? 1: 0; // 50,000,000 for 50MHz running on FPGA
    assign clk_enable = (count == 3) ? 1: 0; // for testbench

endmodule