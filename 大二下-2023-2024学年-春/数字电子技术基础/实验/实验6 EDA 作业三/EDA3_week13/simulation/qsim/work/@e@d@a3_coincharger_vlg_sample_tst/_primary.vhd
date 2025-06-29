library verilog;
use verilog.vl_types.all;
entity EDA3_coincharger_vlg_sample_tst is
    port(
        c0              : in     vl_logic;
        c1              : in     vl_logic;
        c2              : in     vl_logic;
        c3              : in     vl_logic;
        CLK             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end EDA3_coincharger_vlg_sample_tst;
