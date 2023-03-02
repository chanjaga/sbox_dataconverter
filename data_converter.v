module data_converter (
    input clk,rst,
    input [7:0] data_in,
    output [7:0] data_out
);

reg [7:0] q_1;
reg [7:0] q_2;
wire [7:0] xor_out; 
 
 //for q_1
always @(posedge clk) begin
    if(rst)
    begin
        q_1 <= data_in;
    end
    else begin
        q_1 <= data_in;
    end
end

//for q_2
always @(posedge clk) begin
    if(rst)
    begin
        q_2 <= ~data_in;
    end
    else begin
        q_2 <= data_out;
    end
end

assign xor_out = ~(data_in ^ q_1);
assign data_out = xor_out ^ q_2;


endmodule

