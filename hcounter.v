module hcounter (
	input iClk,
	output [15:0]oHCounter,
	output oVCounterFlag
);

reg [15:0]HCount_D = 16'd0;
reg [15:0]HCount_Q = 16'd0;

reg VCounterFlag_D;
reg VCounterFlag_Q;

assign oHCounter = HCount_Q;
assign oVCounterFlag = VCounterFlag_Q;
	
always @ (posedge iClk)
begin
	HCount_Q <= HCount_D;
	VCounterFlag_Q <= VCounterFlag_D;
end

always @ * 
begin
	if(HCount_Q < 15'd1920) // resolución horizontal 
	begin
		HCount_D = HCount_Q + 15'd1; //contador de hsync
		VCounterFlag_D = 1'd0; // bandera para activar vsync
	end
	else
	begin
		HCount_D = 15'd0;
		VCounterFlag_D = 1'd1;
	end
end

endmodule 