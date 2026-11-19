library verilog;
use verilog.vl_types.all;
entity EDA3_keyboard is
    port(
        clk             : in     vl_logic;
        column          : in     vl_logic_vector(3 downto 0);
        row0            : out    vl_logic;
        row1            : out    vl_logic;
        row2            : out    vl_logic;
        row3            : out    vl_logic;
        ispressed       : out    vl_logic;
        inputbottom     : out    vl_logic_vector(3 downto 0)
    );
end EDA3_keyboard;
