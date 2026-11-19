library verilog;
use verilog.vl_types.all;
entity EDA3_coincharger_vlg_check_tst is
    port(
        DIG0            : in     vl_logic;
        DIG1            : in     vl_logic;
        DIG2            : in     vl_logic;
        DIG3            : in     vl_logic;
        OA              : in     vl_logic;
        OB              : in     vl_logic;
        OC              : in     vl_logic;
        OD              : in     vl_logic;
        OE              : in     vl_logic;
        \OF\            : in     vl_logic;
        OG              : in     vl_logic;
        r               : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end EDA3_coincharger_vlg_check_tst;
