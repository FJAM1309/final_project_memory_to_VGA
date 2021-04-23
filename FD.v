module FD(
	input iClk,
	output ofrec
);

reg rDiv_D;
reg rDiv_Q;

reg [25:0] rCount_D;
reg [25:0] rCount_Q;

assign ofrec = rDiv_Q;

always @(posedge iClk)
begin
	rDiv_Q <= rDiv_D;
	rCount_Q <= rCount_D;
end

always @ *
begin
	if (rCount_Q == 26'd25000000)
	begin
		rDiv_D = 1'b1;
		rCount_D = 26'd0;
	end
	else
	begin
		rDiv_D = 1'b0;
		rCount_D = rCount_Q + 1'd1;

	end
end

endmodule



//module FD(
//	input iClk,
//	output ofrec
//	);
//	
//	reg [25:0] rContador_D;
//	reg [25:0] rContador_Q;
//	
//	reg rSignal_D;
//	reg rSignal_Q;
//	
//	assign ofrec = rSignal_Q;
//	
//	always @(posedge iClk)
//	begin
//		rSignal_Q <= rSignal_D;
//		rContador_Q <= rContador_D;
//	end
//	
//	always @*
//	begin
//		rContador_D = rContador_Q + 1'b1;
//	if(rContador_Q == 26'd25_000_000)
//	begin
//		rSignal_D = ~rSignal_Q;
//		rContador_D = 26'd0;
//	end
//	else
//	begin
//		rContador_D = rContador_Q + 1'b1;
//	end
//end
//
//endmodule
