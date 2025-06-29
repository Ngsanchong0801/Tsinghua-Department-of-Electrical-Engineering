library verilog;
use verilog.vl_types.all;
entity EDA3_control is
    port(
        clk             : in     vl_logic;
        inputbottom     : in     vl_logic_vector(3 downto 0);
        ispressed       : in     vl_logic;
        money1          : out    vl_logic_vector(3 downto 0);
        money0          : out    vl_logic_vector(3 downto 0);
        time1           : out    vl_logic_vector(3 downto 0);
        time0           : out    vl_logic_vector(3 downto 0);
        enable          : out    vl_logic
    );
end EDA3_control;
