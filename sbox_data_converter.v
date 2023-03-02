module sbox_data_converter (
    input clk,
    input rst, 
    input dec,
    input [7:0] data_in,
    output [7:0] data_out
);

reg [7:0] data_converter_in;
wire [7:0] data_converter_out;
wire [7:0] sbox_in, sbox_out, inv_sbox_in, inv_sbox_out;

data_converter data_converter(
    .clk(clk),
    .rst(rst),
    .data_in(data_converter_in), 
    .data_out(data_converter_out)
);

sbox sbox(
    .U(sbox_in),
    .S(sbox_out)
);

inv_sbox inv_sbox(
    .U(inv_sbox_in),
    .S(inv_sbox_out)
);

assign sbox_in = (dec) ? data_converter_out : data_in;
assign inv_sbox_in = (dec) ? data_in : data_converter_out;
assign data_out = (dec) ? inv_sbox_out : sbox_out;

endmodule



