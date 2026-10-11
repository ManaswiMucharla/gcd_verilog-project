module top(
  input clk,rst,
  input [7:0]A,B,
  input start,
  output reg done,
  output reg [7:0]gcd
  );

  reg [7:0]a,b;
  reg [1:0]state,next_state;

  localparam IDLE = 2'b00,CAL = 2'b01,DONE = 2'b10;


  always@(posedge clk or posedge rst)begin
    if(rst)
      state <= IDLE;
    else 
      state <= next_state;
  end

  always@(*)begin
    next_state = state;

    case(state) 
      IDLE : begin
        if(start)
          next_state = CAL;
      end

      CAL : begin
        if(b == 0)
          next_state = DONE;
      end

      DONE : begin
        if(!start) 
          next_state = IDLE;
      end

      default : next_state = IDLE;
    endcase
  end

        
  always@(posedge clk or posedge rst)begin
    if(rst)begin
      a <= 0;
      b <= 0;
      done <= 0;
      gcd <= 0;
    end
  else
    case(state)
      IDLE : begin
        if(start)begin
        done <= 0;
        a <= A;
        b <= B;
        end
      end


      CAL : begin
        if(b == 0)begin
          done <= 1;
          gcd <= a;
        end
        else begin
          a <= b;
          b <= a%b;
        end
      end

      DONE : begin
        if(!start)
          done <= 0;
      end
       default : gcd <= a;
     endcase
  end
  endmodule

