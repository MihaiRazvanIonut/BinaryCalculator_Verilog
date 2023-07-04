module Concatenator(

    input  [7:0]   A,
    input  [7:0]   B,
    input  [7:0]   C,
    input  [3:0]   D,
    input  [3:0]   E,
    output [31:0]  Out

);

assign Out = {E, D, C, B, A};

endmodule