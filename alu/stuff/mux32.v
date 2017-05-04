module mux32(i0,i1,s,out,c);
input [31:0]i0,i1;
input s,c;
output [31:0]out;
wire [31:0]o;
reg [31:0]out;

wire [31:0]s1;

assign s1[0]=s;
assign s1[1]=s;
assign s1[2]=s;
assign s1[3]=s;

assign s1[4]=s;
assign s1[5]=s;
assign s1[6]=s;
assign s1[7]=s;

assign s1[8]=s;
assign s1[9]=s;
assign s1[10]=s;
assign s1[11]=s;

assign s1[12]=s;
assign s1[13]=s;
assign s1[14]=s;
assign s1[15]=s;

assign s1[16]=s;
assign s1[17]=s;
assign s1[18]=s;
assign s1[19]=s;

assign s1[20]=s;
assign s1[21]=s;
assign s1[22]=s;
assign s1[23]=s;

assign s1[24]=s;
assign s1[25]=s;
assign s1[26]=s;
assign s1[27]=s;

assign s1[28]=s;
assign s1[29]=s;
assign s1[30]=s;
assign s1[31]=s;


assign o =i0&(~s1) | i1&s1;


	always @ (posedge c)
	   begin 
		 out<=o;
	   end



endmodule


module mux2(i0,i1,s,out,c);
input i0,i1,s,c;
output out;
wire o;
reg out;
assign o =i0&(~s) | i1&s;


	always @ (posedge c)
	   begin 
		 out<=o;
	   end



endmodule