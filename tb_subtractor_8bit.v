module tb_subtractor_8bit;
    reg  [7:0] A;
    reg  [7:0] B;
    wire [7:0] DIFF;
    wire       BORROW;

    subtractor_8bit uut (.A(A), .B(B), .DIFF(DIFF), .BORROW(BORROW));

    initial begin
        A = 8'd20; B = 8'd10; #10;
        A = 8'd10; B = 8'd20; #10;
        A = 8'd50; B = 8'd25; #10;
        A = 8'd0;  B = 8'd1;  #10;
        $finish;
    end
endmodule