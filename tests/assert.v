/**
  * This module was adapted from https://stackoverflow.com/a/14008582
  * Answer by Jeff B.
  */

module assert(input clk, input test);
    always @(posedge clk)
    begin
        if (test !== 1)
        begin
            $display("ASSERTION FAILED in %m");
            $finish;
        end
    end
endmodule