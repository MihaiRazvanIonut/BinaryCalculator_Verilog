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


module ALU (

    input  [7:0]  A,
    input  [7:0]  B,
    input  [3:0]  Sel,
    output [7:0]  Out,
    output [3:0]  Flag
 
);

    // Unitate de aritmetica si logica
    // Flag[0] ZeroFlag si se activeaza daca (Out == 0 && Sel este valid(0 : B))
    // Flag[1] CarryFlag
    // Flag[2] OverflowFlag
    // Flag[3] UnderflowFlag

    reg [7:0] TmpOut;
    reg [3:0] TmpFlag;

    assign Out  = TmpOut;
    assign Flag = TmpFlag;

    case (Sel)

    4'h0: begin // adunare
        


    end
    
    4'h1: begin // scadere
        


    end

    4'h2: begin // inmultire
        


    end

    4'h3: begin // impartire
        


    end

    4'h4: begin // shiftare stanga
        


    end

    4'h5: begin // shiftare dreapta
        


    end

    
    4'h6: begin // AND
        
        TmpOut <= A & B;
        Flag   <= 4'h0;

    end

    
    4'h7: begin // OR
        
        TmpOut <= A | B;
        Flag   <= 4'h0;

    end

    4'h8: begin // XOR

        TmpOut <= A ^ B;
        Flag   <= 4'h0;

    end

    4'h9: begin // NXOR
        
        TmpOut <= ~(A ^ B);
        Flag   <= 4'h0;

    end

    4'hA: begin // NAND
        
        TmpOut <= ~(A & B);
        Flag   <= 4'h0;

    end

    4'hB: begin // NOR
        
        TmpOut <= ~(A | B);
        Flag   <= 4'h0;

    end

    default: begin 

        TmpOut <= 8'h00;
        Flag   <= 4'h0; 

    end

    endcase

endmodule


module Mux2x1(

    input         Sel,
    input  [7:0]  IN_A,
    input  [7:0]  IN_B,
    output [7:0]  Out

);

    reg [7:0] TmpReg;

    assign Out = TmpReg;

    case (Sel)

        1'b0: begin

            TmpReg <= IN_A;

        end

        1'b1: begin

            TmpReg <= IN_B;

        end

        default: begin

            TmpReg <= {8{1'bx}};

        end

    endcase

endmodule


module Memory #(parameter WIDTH = 8, parameter DinLenght = 32) (

    input                        Reset,
    input                        Clk,
    input   [DinLenght - 1 : 0]  Din,
    input   [WIDTH - 1 : 0]      Addr,
    input                        R_W,
    input                        Valid,
    output  [DinLenght - 1 : 0]  Dout      

);

    reg [DinLenght-1 : 0] TmpDout;

    assign TmpDout = Dout;

    always @(posedge Clk, negedge Reset) begin
        
        if (~Reset) begin

        end else begin



        end

    end


endmodule