
module ALU (

    input      [7:0]  A,
    input      [7:0]  B,
    input      [3:0]  Sel,
    output reg [7:0]  Out,
    output reg [3:0]  Flag
 
);

    // Unitate de aritmetica si logica
    // Flag[0] ZeroFlag si se activeaza daca (Out == 0 && Sel este valid(0 : B))
    // Flag[1] CarryFlag
    // Flag[2] OverflowFlag
    // Flag[3] UnderflowFlag

  
  	always @(*) begin
    case (Sel)

    4'h0: begin // adunare
        
        Flag   <= 4'h0;

        if ((A + B) >= (1 << 8)) begin 

            Flag[1] <= 1'b1;

        end 

            Out <= (A + B);

        if (Out == 0) Flag[0] = 1'b1;

    end
    
    4'h1: begin // scadere
        
        Flag <= 4'h0;

      if (A < B) begin 

            Flag[3] <= 1'b1;

        end 

        Out <= (A - B);

        if (Out == 0) Flag[0] <= 1'b1;

    end

    4'h2: begin // inmultire
        
        Flag <= 4'h0;

        if (A > 8'hF && B > 8'hF) begin

            Flag[2] <= 1'b1;

        end

        Out <= A * B;

        if (Out == 0) Flag[0] <= 1'b1;

    end

    4'h3: begin // impartire
        
        Flag <= 4'h0;

        if (A < B) begin

            Flag[3] = 1'b1;

        end

        Out <= A / B;

        if (Out == 0) Flag[0] <= 1'b1;

    end

    4'h4: begin // shiftare stanga
        
        Flag <= 4'h0;

        Out <= A << B;

        if (Out == 0) Flag[0] <= 1'b1;

    end

    4'h5: begin // shiftare dreapta
        
        Flag <= 4'h0;

        Out <= A >> B;

        if (Out == 0) Flag[0] <= 1'b1;

    end

    
    4'h6: begin // AND
        
        Out  <= A & B;
        Flag <= 4'h0;

    end

    
    4'h7: begin // OR
        
        Out <= A | B;
        Flag   <= 4'h0;

    end

    4'h8: begin // XOR

        Out <= A ^ B;
        Flag   <= 4'h0;

    end

    4'h9: begin // NXOR
        
        Out <= ~(A ^ B);
        Flag   <= 4'h0;

    end

    4'hA: begin // NAND
        
        Out <= ~(A & B);
        Flag   <= 4'h0;

    end

    4'hB: begin // NOR
        
        Out <= ~(A | B);
        Flag   <= 4'h0;

    end

    default: begin 

        Out <= 8'h00;
        Flag   <= 4'h0; 

    end

    endcase
    end

endmodule