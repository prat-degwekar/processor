module tsg(in , state , out , clk);								//one bit tri state gate with input in , state and clock - non pipelined
	input in , state , clk;										//leaving it non-pipelined
	output out;

	wire inc , stc;												//for output of dff of input and state respectively

	reg out;

	//dff d1(in , inc , clk);
	//dff d2(state , stc , clk);

	always @(in or state or clk)								//assigns output of tri state gate
	begin

		if(state == 0)												//add dff , replace state with stc
			out <= 1'bz;
		else out <= in;										//add dff , replace in with inc

	end

endmodule // tsg

module tsg_32(in , state , out , clk);							//32 bit tri state gate array accepting 32 bit input <in> , one bit state <state> , 32 bit output <out> and clock - non pipelined

	input [31:0]in;
	input state , clk;
	
	output [31:0] out;

	reg [31:0] out;												//add dff_32 after this line for pipeline purposes

	always @(in or state or clk)								//assigns 32 bit output 
	begin

		if(state == 0)												//add dff , replace state with stc
			out <= 32'bz;
		else out <= in;										//add dff , replace in with inc

	end

endmodule


/*module tsg_tb();												//testbench for one bit tri state gate modifiable easily for with and w/o clock / pipeline

	reg in , state , clk;

	wire out;

	tsg t1(in , state , out , clk);

	initial
	begin
	
		clk=0;
	
	end

	always
	begin 
		
		#1
		
		clk=~clk;
	
	end

	always
	begin
		
		#10 $finish;
	
	end

	initial begin

		//state = 1'b1;
		//in = 1'b0;

		#1

		state = 1'b1;
		in = 1'b1;

		#1

		state = 1'b1;
		in = 1'b0;

		#1

		state = 1'b0;
		in = 1'b1;

		#1

		state = 1'b0;
		in = 1'b0;

	end

	initial begin

		$monitor($time,"  state = %b , in = %b , out = %b",state , in , out);
	
	end

endmodule // tsg_tb*/

/*module tsg32_tb();												//testbench for 32 bit tri state gate modifiable easily for with and w/o clock / pipeline

	reg state , clk;
	reg [31:0] in;

	wire [31:0] out;

	tsg_32 t1(in , state , out , clk);

	initial
	begin
	
		clk=0;
	
	end

	always
	begin 
		
		#1
		
		clk=~clk;
	
	end

	always
	begin
		
		#10 $finish;
	
	end

	initial begin

		//state = 1'b1;
		//in = 1'b0;

		#1

		state = 1'b1;
		in = 32'b00110011001100110011001100110011;

		#1

		state = 1'b1;
		in = 32'b00000000000000011111111111111111;

		#1

		state = 1'b0;
		in = 32'b01010101010101110000011010101010;

		#1

		state = 1'b0;
		in = 32'b01010101010111110000000011001000;

	end

	initial begin

		$monitor($time,"  state = %b , in = %b , out = %b",state , in , out);
	
	end // initial

endmodule // tsg_tb*/
