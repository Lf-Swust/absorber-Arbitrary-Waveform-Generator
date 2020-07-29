module display(
input CLK,
input [7:0]sum,
input  RX_Done_Sig,
input  RSTn,
    );
 
reg a = 0 , b = 0, c = 0;
reg [31:0] timer = 0;
reg [27:0] timer1 = 0;

  always @(posedge CLK or negedge RSTn)     //1,2时计数
   begin
      if(a||b)
        begin
          if(!RSTn)
            timer <= 1'b0;
          else if(timer == 32'd799_999_999)
            timer <= 1'b0;
          else 
            timer <= timer + 1'b1;
        end
      else
         timer <= 1'b0;
    end
    
  always @(posedge CLK or negedge RSTn)    //3时计数
     begin
        if(c)
          begin
            if(!RSTn)
              timer1 <= 1'b0;
            else if(timer1 == 32'd99_999_999)
              timer1 <= 1'b1;
            else 
              timer1 <= timer1 + 1'b1;
          end
        else
           timer1 <= 1'b0;
      end
   
     always @(posedge CLK)begin                //判断1,2,3
       if(RX_Done_Sig == 1'b0)
          begin 
             if(sum == 8'd49)
               begin 
                  a <= 1'b1;b <= 1'b0;c <= 1'b0;
               end
             else if(sum == 8'd50)
                begin 
                  a <= 1'b0;b <= 1'b1;c <= 1'b0;
                end
             else if(sum == 8'd51)
                begin 
                  a <= 1'b0;b <= 1'b0;c <= 1'b1;
                end
             else 
                begin
                  a <= 1'b0;b <= 1'b0;c <= 1'b0;
                end
            end
        else
           begin
              a <= a;b <= b;c <= c;
           end
      end
    
endmodule
