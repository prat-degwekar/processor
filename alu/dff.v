module dff(d , q , clk);
	
	input d,clk,rst;
	
	output q;
	
	reg q;

	always@(posedge clk)
	begin

	    q<=d;

	end

endmodule


/*module dff_64(q,clk,d);
input [63:0]d;
input clk;
output [63:0]q;
reg q;

always@(posedge clk)
begin
    q<=d;
end
endmodule*/

/*module dff_63(q,clk,d);
input [62:0]d;
input clk;
output [62:0]q;
reg q;

always@(posedge clk)
begin
    q<=d;
end
endmodule*/

module dff_32(d , q , clk);
	
	input [31:0]d;
	input clk;
	
	output [31:0]q;
	
	reg q;

	always@(posedge clk)
	begin
    
    	q<=d;
	
	end

endmodule