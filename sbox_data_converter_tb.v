`timescale 1ps/1ps
module sbox_data_converter_tb;
    
    // Declare inputs and outputs
    reg CLK;
    reg RST;
    reg DEC;
    reg [7:0] DATA_IN;
    wire [7:0] DATA_OUT;
    
    // Instantiate the module
    sbox_data_converter dut (
        .clk(CLK),
        .rst(RST),
        .dec(DEC),
        .data_in(DATA_IN),
        .data_out(DATA_OUT)
    );
    
    initial begin
        for(CLK=1'b0;1;CLK=~CLK) #10;
    end
    
    integer i;
    initial begin
        // reset
        DATA_IN = 0;
        RST = 0;
        #5
        RST = 1;
        #10
        RST = 0;
        #15        
        DEC = 0;  // Encrypt mode
        
        DATA_IN = 8'd1;
        #20
        DATA_IN = 8'd200;
        
        //reset
        #15
        DATA_IN = 0;
        RST = 1;
        #10
        RST = 0;
        #15        
        DEC = 1;  // Decrypt mode
        
        DATA_IN = 8'h63;
        #20
        DATA_IN = 8'h7c;
        #20
        $stop;
    end
endmodule