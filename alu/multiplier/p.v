module dot(gout,gl,al,gr);
	output gout;
	input gr,gl,al;
	assign gout = gl | (al & gr);
endmodule

module circle(gout,aout,gl,al,gr,ar);

	output gout,aout;
	input gl,al,gr,ar;
	assign gout = gl | (al & gr);
	assign aout = al & ar;

endmodule
