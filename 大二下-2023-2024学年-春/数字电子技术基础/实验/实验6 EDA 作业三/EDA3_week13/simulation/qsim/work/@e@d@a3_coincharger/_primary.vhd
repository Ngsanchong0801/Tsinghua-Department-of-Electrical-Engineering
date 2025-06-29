library verilog;
use verilog.vl_types.all;
entity EDA3_coincharger is
    port(
        OA              : out    vl_logic;
        CLK             : in     vl_logic;
        c3              : in     vl_logic;
        c2              : in     vl_logic;
        c1              : in     vl_logic;
        c0              : in     vl_logic;
        OB              : out    vl_logic;
        OC              : out    vl_logic;
        OD              : out    vl_logic;
        OE              : out    vl_logic;
        \OF\            : out    vl_logic;
        OG              : out    vl_logic;
        DIG0            : out    vl_logic;
        DIG1            : out    vl_logic;
        DIG2            : out    vl_logic;
        DIG3            : out    vl_logic;
        r               : out    vl_logic_vector(3 downto 0)
    );
end EDA3_coincharger;
