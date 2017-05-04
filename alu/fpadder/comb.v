`include "cla24.v"
module comb_logic(a_sign,b_sign,a_mant0,b_mant0,inp_op,out_op,out_sign);
input a_sign,b_sign;
input [23:0] a_mant0, b_mant0;
input inp_op;
output reg [22:0] a_mant, b_mant;
output reg out_op,out_sign;
wire [23:0]s,b_temp;
assign b_temp=~b_mant0+1;
wire cout;
cla24 abc(cout,s,a_mant0,b_temp,0); 

always @(*)
begin

	if(inp_op==0)
	begin
		if(a_sign==0 && b_sign==0)
		begin
			out_sign=0;out_op=0;
		end
		else if(a_sign==0 && b_sign==1)
		begin
			out_op=1;
			if(s[23]==1)
			begin
				out_sign=1;
			end
			else begin	
				out_sign=0;
			end
		end
		else if(a_sign==1 && b_sign==0)
		begin
			out_op=1;
			if(s[23]==1)
			begin
				out_sign=0;
			end
			else begin	
				out_sign=1;
			end
		end
		else if(a_sign==1 && b_sign==1)
		begin
			out_sign=1;out_op=0;
		end
	end
	else if(inp_op==1)
	begin
		if(a_sign==0 && b_sign==0)
		begin
			out_op=1;
			if(s[23]==1)
			begin
				out_sign=1;
			end
			else begin	
				out_sign=0;
			end
		end
		else if(a_sign==0 && b_sign==1)
		begin
		    out_op=0;
		    out_sign=0;

		end
		else if(a_sign==1 && b_sign==0)
		begin
			out_sign=1;out_op=0;
		end
		else if(a_sign==1 && b_sign==1)
		begin
			out_op=1;
			if(s[23]==1)
			begin
				out_sign=0;
			end
			else begin	
				out_sign=1;
			end
		end

	
	end

	
end 
/*
initial begin 
$monitor("a_sign %b,b_sign %b,a_mant0 %b,b_mant0 %b,inp_op %b,out_op %b,out_sign %b s[23] %b",a_sign,b_sign,a_mant0,b_mant0,inp_op,out_op,out_sign,s);
end*/

endmodule
