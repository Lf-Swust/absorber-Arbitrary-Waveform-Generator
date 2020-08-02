module display(
input CLK,
input [7:0]sum,
input  RX_Done_Sig,
input  RSTn,
output reg [1:0]Wave_Mode
    );
 
  
     always @(posedge CLK)begin                //еп╤о1,2,3
       if(RX_Done_Sig == 1'b1)
          begin 
             if(sum == 8'd49)
               begin 
                  Wave_Mode <= 2'b01;
               end
             else if(sum == 8'd50)
                begin 
                  Wave_Mode <=2'b10;
                end
             else if(sum == 8'd51)
                begin 
                 Wave_Mode <= 2'b11;
                end
             else 
                begin
                 Wave_Mode <= 2'b00;
                end
            end
        else
           begin
              Wave_Mode <=Wave_Mode;
           end
      end
    
endmodule
