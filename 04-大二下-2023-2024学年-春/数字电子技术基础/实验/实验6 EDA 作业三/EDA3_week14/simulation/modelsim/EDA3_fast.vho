-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.0 Build 156 04/24/2013 SJ Full Version"

-- DATE "05/28/2024 17:57:47"

-- 
-- Device: Altera EP2C5Q208C8 Package PQFP208
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	EDA3_control IS
    PORT (
	clk : IN std_logic;
	inputbottom : IN std_logic_vector(3 DOWNTO 0);
	ispressed : IN std_logic;
	money1 : OUT std_logic_vector(3 DOWNTO 0);
	money0 : OUT std_logic_vector(3 DOWNTO 0);
	time1 : OUT std_logic_vector(3 DOWNTO 0);
	time0 : OUT std_logic_vector(3 DOWNTO 0);
	enable : OUT std_logic
	);
END EDA3_control;

-- Design Ports Information
-- money1[0]	=>  Location: PIN_14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- money1[1]	=>  Location: PIN_13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- money1[2]	=>  Location: PIN_12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- money1[3]	=>  Location: PIN_15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- money0[0]	=>  Location: PIN_191,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- money0[1]	=>  Location: PIN_195,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- money0[2]	=>  Location: PIN_193,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- money0[3]	=>  Location: PIN_199,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- time1[0]	=>  Location: PIN_185,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- time1[1]	=>  Location: PIN_70,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- time1[2]	=>  Location: PIN_197,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- time1[3]	=>  Location: PIN_69,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- time0[0]	=>  Location: PIN_203,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- time0[1]	=>  Location: PIN_198,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- time0[2]	=>  Location: PIN_72,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- time0[3]	=>  Location: PIN_68,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- enable	=>  Location: PIN_189,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- clk	=>  Location: PIN_23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- inputbottom[2]	=>  Location: PIN_24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- inputbottom[0]	=>  Location: PIN_27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- inputbottom[1]	=>  Location: PIN_28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- inputbottom[3]	=>  Location: PIN_192,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ispressed	=>  Location: PIN_187,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF EDA3_control IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_inputbottom : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_ispressed : std_logic;
SIGNAL ww_money1 : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_money0 : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_time1 : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_time0 : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_enable : std_logic;
SIGNAL \clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Add1~4_combout\ : std_logic;
SIGNAL \Add1~10_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_7_result_int[6]~10_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_7_result_int[7]~12_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_8_result_int[3]~4_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_9_result_int[1]~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_9_result_int[2]~2_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_10_result_int[3]~4_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_10_result_int[3]~4_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_10_result_int[7]~12_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_11_result_int[2]~2_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_11_result_int[3]~4_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_11_result_int[2]~2_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_11_result_int[3]~4_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_11_result_int[5]~8_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_11_result_int[7]~12_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_12_result_int[1]~0_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_12_result_int[2]~2_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_12_result_int[1]~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_12_result_int[5]~8_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_12_result_int[7]~12_combout\ : std_logic;
SIGNAL \Add6~8_combout\ : std_logic;
SIGNAL \Add6~10_combout\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\ : std_logic;
SIGNAL \Add6~20_combout\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~12_combout\ : std_logic;
SIGNAL \count10s[1]~15_combout\ : std_logic;
SIGNAL \count10s[2]~17_combout\ : std_logic;
SIGNAL \count10s[4]~23_combout\ : std_logic;
SIGNAL \count10s[6]~27_combout\ : std_logic;
SIGNAL \count10s[8]~31_combout\ : std_logic;
SIGNAL \Add0~1_combout\ : std_logic;
SIGNAL \LessThan2~0_combout\ : std_logic;
SIGNAL \Selector11~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[70]~121_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[69]~123_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[68]~125_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[67]~127_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[66]~128_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[65]~131_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[64]~132_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[63]~134_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[76]~139_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[75]~140_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[73]~143_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[72]~144_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[53]~37_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[52]~38_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[51]~41_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[86]~148_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[83]~151_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[82]~153_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[81]~155_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[50]~43_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[58]~44_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[57]~45_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[97]~156_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[96]~157_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[94]~159_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[93]~160_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[92]~161_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[91]~162_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[90]~165_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[55]~47_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[62]~50_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[61]~51_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[106]~166_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[105]~167_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[104]~168_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[102]~170_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[101]~171_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[100]~172_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[99]~174_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[60]~53_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[115]~176_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[113]~178_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[109]~183_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[108]~184_combout\ : std_logic;
SIGNAL \Selector41~2_combout\ : std_logic;
SIGNAL \LessThan3~0_combout\ : std_logic;
SIGNAL \LessThan3~1_combout\ : std_logic;
SIGNAL \Selector49~1_combout\ : std_logic;
SIGNAL \Selector45~0_combout\ : std_logic;
SIGNAL \Selector25~0_combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[0][6]~1_combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[1][4]~3_combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[0][9]~4_combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[0][10]~combout\ : std_logic;
SIGNAL \Selector18~0_combout\ : std_logic;
SIGNAL \Selector18~1_combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[0][11]~combout\ : std_logic;
SIGNAL \Selector48~0_combout\ : std_logic;
SIGNAL \always0~1_combout\ : std_logic;
SIGNAL \Add3~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[88]~186_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[85]~189_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[63]~54_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[103]~199_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[114]~202_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[112]~204_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[111]~205_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[79]~206_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[78]~207_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[110]~215_combout\ : std_logic;
SIGNAL \clk~combout\ : std_logic;
SIGNAL \clk~clkctrl_outclk\ : std_logic;
SIGNAL \money1[3]~6_combout\ : std_logic;
SIGNAL \Selector36~0_combout\ : std_logic;
SIGNAL \Equal6~0_combout\ : std_logic;
SIGNAL \Selector49~2_combout\ : std_logic;
SIGNAL \count10s[0]~13_combout\ : std_logic;
SIGNAL \ispressed~combout\ : std_logic;
SIGNAL \count10s[8]~19_combout\ : std_logic;
SIGNAL \Selector33~0_combout\ : std_logic;
SIGNAL \money0[3]~reg0_regout\ : std_logic;
SIGNAL \Selector35~0_combout\ : std_logic;
SIGNAL \money0[1]~reg0_regout\ : std_logic;
SIGNAL \Selector27~0_combout\ : std_logic;
SIGNAL \Selector50~0_combout\ : std_logic;
SIGNAL \state.s2~regout\ : std_logic;
SIGNAL \time1~5_combout\ : std_logic;
SIGNAL \Selector44~0_combout\ : std_logic;
SIGNAL \money1[0]~2_combout\ : std_logic;
SIGNAL \Selector30~0_combout\ : std_logic;
SIGNAL \money1[2]~reg0_regout\ : std_logic;
SIGNAL \money1~5_combout\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \time1[2]~1_combout\ : std_logic;
SIGNAL \money1[1]~reg0_regout\ : std_logic;
SIGNAL \Add3~1_combout\ : std_logic;
SIGNAL \Selector34~0_combout\ : std_logic;
SIGNAL \money0[2]~reg0_regout\ : std_logic;
SIGNAL \timer[2]~6\ : std_logic;
SIGNAL \timer[3]~8\ : std_logic;
SIGNAL \timer[4]~10\ : std_logic;
SIGNAL \timer[5]~11_combout\ : std_logic;
SIGNAL \timer[2]~5_combout\ : std_logic;
SIGNAL \timer[1]~4_combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[0][5]~0_combout\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~2_combout\ : std_logic;
SIGNAL \Selector22~0_combout\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~0_combout\ : std_logic;
SIGNAL \Selector23~0_combout\ : std_logic;
SIGNAL \Selector23~1_combout\ : std_logic;
SIGNAL \timer[3]~7_combout\ : std_logic;
SIGNAL \Selector24~0_combout\ : std_logic;
SIGNAL \Selector24~1_combout\ : std_logic;
SIGNAL \Selector26~0_combout\ : std_logic;
SIGNAL \Add6~0_combout\ : std_logic;
SIGNAL \Selector28~0_combout\ : std_logic;
SIGNAL \Add6~1\ : std_logic;
SIGNAL \Add6~2_combout\ : std_logic;
SIGNAL \Selector27~1_combout\ : std_logic;
SIGNAL \Add6~3\ : std_logic;
SIGNAL \Add6~4_combout\ : std_logic;
SIGNAL \Selector26~1_combout\ : std_logic;
SIGNAL \Add6~5\ : std_logic;
SIGNAL \Add6~6_combout\ : std_logic;
SIGNAL \Selector25~1_combout\ : std_logic;
SIGNAL \Add6~7\ : std_logic;
SIGNAL \Add6~9\ : std_logic;
SIGNAL \Add6~11\ : std_logic;
SIGNAL \Add6~12_combout\ : std_logic;
SIGNAL \Selector22~1_combout\ : std_logic;
SIGNAL \Add6~13\ : std_logic;
SIGNAL \Add6~15\ : std_logic;
SIGNAL \Add6~17\ : std_logic;
SIGNAL \Add6~18_combout\ : std_logic;
SIGNAL \timer[4]~9_combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[1][5]~combout\ : std_logic;
SIGNAL \Mult0|mult_core|romout[0][8]~2_combout\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~3\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~7\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~8_combout\ : std_logic;
SIGNAL \Selector19~0_combout\ : std_logic;
SIGNAL \Selector19~1_combout\ : std_logic;
SIGNAL \Add6~19\ : std_logic;
SIGNAL \Add6~21\ : std_logic;
SIGNAL \Add6~22_combout\ : std_logic;
SIGNAL \Selector17~0_combout\ : std_logic;
SIGNAL \Selector17~1_combout\ : std_logic;
SIGNAL \LessThan2~2_combout\ : std_logic;
SIGNAL \Add6~23\ : std_logic;
SIGNAL \Add6~24_combout\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~11\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14_combout\ : std_logic;
SIGNAL \Selector16~0_combout\ : std_logic;
SIGNAL \Selector16~1_combout\ : std_logic;
SIGNAL \Add6~14_combout\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~4_combout\ : std_logic;
SIGNAL \Selector21~0_combout\ : std_logic;
SIGNAL \Selector21~1_combout\ : std_logic;
SIGNAL \LessThan2~1_combout\ : std_logic;
SIGNAL \LessThan2~3_combout\ : std_logic;
SIGNAL \Selector45~1_combout\ : std_logic;
SIGNAL \charge_start~regout\ : std_logic;
SIGNAL \Selector43~0_combout\ : std_logic;
SIGNAL \Add6~16_combout\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_combout\ : std_logic;
SIGNAL \Selector20~0_combout\ : std_logic;
SIGNAL \Selector20~1_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~1\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\ : std_logic;
SIGNAL \Add6~25\ : std_logic;
SIGNAL \Add6~26_combout\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~15\ : std_logic;
SIGNAL \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~16_combout\ : std_logic;
SIGNAL \Selector15~0_combout\ : std_logic;
SIGNAL \Selector15~1_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~3\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~5\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_7_result_int[4]~7\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~9\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_7_result_int[6]~11\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_7_result_int[7]~13\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[70]~120_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[69]~122_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[68]~124_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[67]~126_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[66]~129_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[65]~130_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[64]~133_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[63]~135_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_8_result_int[1]~1\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_8_result_int[2]~3\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_8_result_int[3]~5\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_8_result_int[4]~7\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~9\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_8_result_int[6]~11\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_8_result_int[7]~13\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_8_result_int[8]~15_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[75]~210_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_8_result_int[2]~2_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[74]~141_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[73]~142_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[72]~145_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_9_result_int[1]~1\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_9_result_int[2]~3\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_9_result_int[3]~5\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_9_result_int[4]~6_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_8_result_int[7]~12_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[79]~136_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_8_result_int[6]~10_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[78]~137_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[77]~138_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~4_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[76]~209_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_9_result_int[4]~7\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_9_result_int[5]~9\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_9_result_int[6]~11\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_9_result_int[7]~13\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_9_result_int[8]~15_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[85]~149_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_9_result_int[3]~4_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[84]~150_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_8_result_int[1]~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[83]~212_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[82]~152_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[81]~154_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_10_result_int[1]~1\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_10_result_int[2]~3\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_10_result_int[3]~5\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_10_result_int[4]~7\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_10_result_int[5]~8_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_9_result_int[7]~12_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[88]~146_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_9_result_int[6]~10_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[87]~147_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_8_result_int[4]~6_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[86]~188_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_10_result_int[5]~9\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_10_result_int[6]~11\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_10_result_int[7]~13\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_10_result_int[8]~15_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[95]~158_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[74]~211_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[84]~190_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[94]~194_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[93]~195_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[92]~213_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[91]~163_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[90]~164_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_11_result_int[1]~1\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_11_result_int[2]~3\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_11_result_int[3]~5\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_11_result_int[4]~7\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_11_result_int[5]~9\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_11_result_int[6]~10_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[95]~193_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_7_result_int[4]~6_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[77]~208_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[87]~187_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[97]~191_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_9_result_int[5]~8_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[96]~192_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_11_result_int[6]~11\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_11_result_int[7]~13\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_11_result_int[8]~15_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[105]~197_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_10_result_int[6]~10_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[106]~196_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_10_result_int[4]~6_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[104]~198_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_11_result_int[4]~6_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[103]~169_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_10_result_int[2]~2_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[102]~200_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_10_result_int[1]~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[101]~214_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_11_result_int[1]~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[100]~173_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[99]~175_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_12_result_int[1]~1\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_12_result_int[2]~3\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_12_result_int[3]~5\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_12_result_int[4]~7\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_12_result_int[5]~9\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_12_result_int[6]~11\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_12_result_int[7]~13\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_12_result_int[8]~15_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[115]~201_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_12_result_int[6]~10_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[114]~177_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[113]~203_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_12_result_int[4]~6_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[112]~179_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_12_result_int[3]~4_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[111]~180_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_12_result_int[2]~2_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[110]~181_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[109]~182_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[108]~185_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_13_result_int[1]~1_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_13_result_int[2]~3_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_13_result_int[3]~5_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_13_result_int[4]~7_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_13_result_int[5]~9_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_13_result_int[6]~11_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_13_result_int[7]~13_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_13_result_int[8]~15_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_13_result_int[9]~16_combout\ : std_logic;
SIGNAL \Selector44~1_combout\ : std_logic;
SIGNAL \time0[0]~reg0_regout\ : std_logic;
SIGNAL \always0~0_combout\ : std_logic;
SIGNAL \always0~3_combout\ : std_logic;
SIGNAL \always0~2_combout\ : std_logic;
SIGNAL \Selector11~1_combout\ : std_logic;
SIGNAL \Selector11~2_combout\ : std_logic;
SIGNAL \time1[0]~0_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_10_result_int[1]~0_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_10_result_int[1]~1\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_10_result_int[2]~3\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_10_result_int[3]~5\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_10_result_int[4]~7_cout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_10_result_int[5]~8_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[53]~36_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_10_result_int[2]~2_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[52]~39_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[51]~40_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[50]~42_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_11_result_int[1]~1\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_11_result_int[2]~3\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_11_result_int[3]~5\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_11_result_int[4]~7_cout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_11_result_int[5]~8_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[57]~57_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_11_result_int[1]~0_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[56]~46_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_11_result_int[0]~10_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[55]~48_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_12_result_int[1]~1\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_12_result_int[2]~3\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_12_result_int[3]~4_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[58]~56_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_12_result_int[3]~5\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_12_result_int[4]~7_cout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_12_result_int[5]~8_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[63]~49_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_10_result_int[0]~10_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[56]~58_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[62]~55_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[61]~59_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[60]~52_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_13_result_int[1]~1_cout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_13_result_int[2]~3_cout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_13_result_int[3]~5_cout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_13_result_int[4]~7_cout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_13_result_int[5]~8_combout\ : std_logic;
SIGNAL \time1~6_combout\ : std_logic;
SIGNAL \time1[0]~reg0_regout\ : std_logic;
SIGNAL \always0~4_combout\ : std_logic;
SIGNAL \count10s[8]~20_combout\ : std_logic;
SIGNAL \count10s[0]~14\ : std_logic;
SIGNAL \count10s[1]~16\ : std_logic;
SIGNAL \count10s[2]~18\ : std_logic;
SIGNAL \count10s[3]~21_combout\ : std_logic;
SIGNAL \count10s[3]~22\ : std_logic;
SIGNAL \count10s[4]~24\ : std_logic;
SIGNAL \count10s[5]~25_combout\ : std_logic;
SIGNAL \count10s[5]~26\ : std_logic;
SIGNAL \count10s[6]~28\ : std_logic;
SIGNAL \count10s[7]~29_combout\ : std_logic;
SIGNAL \count10s[7]~30\ : std_logic;
SIGNAL \count10s[8]~32\ : std_logic;
SIGNAL \count10s[9]~33_combout\ : std_logic;
SIGNAL \count10s[9]~34\ : std_logic;
SIGNAL \count10s[10]~35_combout\ : std_logic;
SIGNAL \count10s[10]~36\ : std_logic;
SIGNAL \count10s[11]~37_combout\ : std_logic;
SIGNAL \LessThan3~2_combout\ : std_logic;
SIGNAL \Selector49~0_combout\ : std_logic;
SIGNAL \Selector49~3_combout\ : std_logic;
SIGNAL \state.s1~feeder_combout\ : std_logic;
SIGNAL \charge_start~_wirecell_combout\ : std_logic;
SIGNAL \state.s1~regout\ : std_logic;
SIGNAL \money1[0]~3_combout\ : std_logic;
SIGNAL \money1[0]~7_combout\ : std_logic;
SIGNAL \money1[0]~4_combout\ : std_logic;
SIGNAL \money0[0]~reg0_regout\ : std_logic;
SIGNAL \Add0~3_combout\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Add1~1\ : std_logic;
SIGNAL \Add1~3\ : std_logic;
SIGNAL \Add1~5\ : std_logic;
SIGNAL \Add1~7\ : std_logic;
SIGNAL \Add1~9\ : std_logic;
SIGNAL \Add1~11\ : std_logic;
SIGNAL \Add1~12_combout\ : std_logic;
SIGNAL \Add1~2_combout\ : std_logic;
SIGNAL \Add1~6_combout\ : std_logic;
SIGNAL \Add1~0_combout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \LessThan0~1_combout\ : std_logic;
SIGNAL \Add1~8_combout\ : std_logic;
SIGNAL \LessThan0~2_combout\ : std_logic;
SIGNAL \Selector32~0_combout\ : std_logic;
SIGNAL \money1[0]~reg0_regout\ : std_logic;
SIGNAL \Selector29~0_combout\ : std_logic;
SIGNAL \money1[3]~reg0_regout\ : std_logic;
SIGNAL \Selector32~1_combout\ : std_logic;
SIGNAL \Selector39~0_combout\ : std_logic;
SIGNAL \Selector39~1_combout\ : std_logic;
SIGNAL \time1[1]~4_combout\ : std_logic;
SIGNAL \time1[1]~reg0_regout\ : std_logic;
SIGNAL \time1[2]~reg0feeder_combout\ : std_logic;
SIGNAL \Selector38~2_combout\ : std_logic;
SIGNAL \time1[2]~reg0_regout\ : std_logic;
SIGNAL \Selector37~0_combout\ : std_logic;
SIGNAL \time1[3]~reg0_regout\ : std_logic;
SIGNAL \Selector43~2_combout\ : std_logic;
SIGNAL \Selector43~1_combout\ : std_logic;
SIGNAL \Add8~0_combout\ : std_logic;
SIGNAL \Selector43~3_combout\ : std_logic;
SIGNAL \time0[1]~reg0_regout\ : std_logic;
SIGNAL \Add8~1\ : std_logic;
SIGNAL \Add8~2_combout\ : std_logic;
SIGNAL \Selector42~0_combout\ : std_logic;
SIGNAL \Selector42~1_combout\ : std_logic;
SIGNAL \time0[2]~reg0_regout\ : std_logic;
SIGNAL \Add7~0_combout\ : std_logic;
SIGNAL \Add8~3\ : std_logic;
SIGNAL \Add8~4_combout\ : std_logic;
SIGNAL \Selector41~4_combout\ : std_logic;
SIGNAL \Selector41~3_combout\ : std_logic;
SIGNAL \time0[3]~reg0_regout\ : std_logic;
SIGNAL \Selector48~1_combout\ : std_logic;
SIGNAL \state.s0~regout\ : std_logic;
SIGNAL \enable~reg0feeder_combout\ : std_logic;
SIGNAL \enable~reg0_regout\ : std_logic;
SIGNAL \inputbottom~combout\ : std_logic_vector(3 DOWNTO 0);
SIGNAL count10s : std_logic_vector(11 DOWNTO 0);
SIGNAL charge_time : std_logic_vector(13 DOWNTO 0);
SIGNAL timer : std_logic_vector(5 DOWNTO 0);
SIGNAL \ALT_INV_count10s[8]~19_combout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_inputbottom <= inputbottom;
ww_ispressed <= ispressed;
money1 <= ww_money1;
money0 <= ww_money0;
time1 <= ww_time1;
time0 <= ww_time0;
enable <= ww_enable;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clk~combout\);
\ALT_INV_count10s[8]~19_combout\ <= NOT \count10s[8]~19_combout\;

-- Location: LCCOMB_X8_Y9_N6
\Add1~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~4_combout\ = ((\Add0~1_combout\ $ (\inputbottom~combout\(3) $ (!\Add1~3\)))) # (GND)
-- \Add1~5\ = CARRY((\Add0~1_combout\ & ((\inputbottom~combout\(3)) # (!\Add1~3\))) # (!\Add0~1_combout\ & (\inputbottom~combout\(3) & !\Add1~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datab => \inputbottom~combout\(3),
	datad => VCC,
	cin => \Add1~3\,
	combout => \Add1~4_combout\,
	cout => \Add1~5\);

-- Location: LCCOMB_X8_Y9_N12
\Add1~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~10_combout\ = (\Add1~9\ & (\money0[3]~reg0_regout\ $ ((!\Add0~3_combout\)))) # (!\Add1~9\ & ((\money0[3]~reg0_regout\ $ (\Add0~3_combout\)) # (GND)))
-- \Add1~11\ = CARRY((\money0[3]~reg0_regout\ $ (!\Add0~3_combout\)) # (!\Add1~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \money0[3]~reg0_regout\,
	datab => \Add0~3_combout\,
	datad => VCC,
	cin => \Add1~9\,
	combout => \Add1~10_combout\,
	cout => \Add1~11\);

-- Location: LCCOMB_X15_Y9_N16
\Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\ = charge_time(7) $ (VCC)
-- \Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~1\ = CARRY(charge_time(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => charge_time(7),
	datad => VCC,
	combout => \Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~1\);

-- Location: LCCOMB_X15_Y9_N24
\Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ = (charge_time(11) & (\Div0|auto_generated|divider|divider|add_sub_7_result_int[4]~7\ $ (GND))) # (!charge_time(11) & (!\Div0|auto_generated|divider|divider|add_sub_7_result_int[4]~7\ 
-- & VCC))
-- \Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~9\ = CARRY((charge_time(11) & !\Div0|auto_generated|divider|divider|add_sub_7_result_int[4]~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => charge_time(11),
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_7_result_int[4]~7\,
	combout => \Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~9\);

-- Location: LCCOMB_X15_Y9_N26
\Div0|auto_generated|divider|divider|add_sub_7_result_int[6]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_7_result_int[6]~10_combout\ = (charge_time(12) & (!\Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~9\)) # (!charge_time(12) & ((\Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~9\) # 
-- (GND)))
-- \Div0|auto_generated|divider|divider|add_sub_7_result_int[6]~11\ = CARRY((!\Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~9\) # (!charge_time(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => charge_time(12),
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~9\,
	combout => \Div0|auto_generated|divider|divider|add_sub_7_result_int[6]~10_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_7_result_int[6]~11\);

-- Location: LCCOMB_X15_Y9_N28
\Div0|auto_generated|divider|divider|add_sub_7_result_int[7]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_7_result_int[7]~12_combout\ = (charge_time(13) & (\Div0|auto_generated|divider|divider|add_sub_7_result_int[6]~11\ $ (GND))) # (!charge_time(13) & 
-- (!\Div0|auto_generated|divider|divider|add_sub_7_result_int[6]~11\ & VCC))
-- \Div0|auto_generated|divider|divider|add_sub_7_result_int[7]~13\ = CARRY((charge_time(13) & !\Div0|auto_generated|divider|divider|add_sub_7_result_int[6]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => charge_time(13),
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_7_result_int[6]~11\,
	combout => \Div0|auto_generated|divider|divider|add_sub_7_result_int[7]~12_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_7_result_int[7]~13\);

-- Location: LCCOMB_X14_Y9_N8
\Div0|auto_generated|divider|divider|add_sub_8_result_int[3]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_8_result_int[3]~4_combout\ = (\Div0|auto_generated|divider|divider|add_sub_8_result_int[2]~3\ & (((\Div0|auto_generated|divider|divider|StageOut[65]~131_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[65]~130_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_8_result_int[2]~3\ & ((((\Div0|auto_generated|divider|divider|StageOut[65]~131_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[65]~130_combout\)))))
-- \Div0|auto_generated|divider|divider|add_sub_8_result_int[3]~5\ = CARRY((!\Div0|auto_generated|divider|divider|add_sub_8_result_int[2]~3\ & ((\Div0|auto_generated|divider|divider|StageOut[65]~131_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[65]~130_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[65]~131_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[65]~130_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_8_result_int[2]~3\,
	combout => \Div0|auto_generated|divider|divider|add_sub_8_result_int[3]~4_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_8_result_int[3]~5\);

-- Location: LCCOMB_X14_Y10_N12
\Div0|auto_generated|divider|divider|add_sub_9_result_int[1]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_9_result_int[1]~0_combout\ = (((\Div0|auto_generated|divider|divider|StageOut[72]~144_combout\) # (\Div0|auto_generated|divider|divider|StageOut[72]~145_combout\)))
-- \Div0|auto_generated|divider|divider|add_sub_9_result_int[1]~1\ = CARRY((\Div0|auto_generated|divider|divider|StageOut[72]~144_combout\) # (\Div0|auto_generated|divider|divider|StageOut[72]~145_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[72]~144_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[72]~145_combout\,
	datad => VCC,
	combout => \Div0|auto_generated|divider|divider|add_sub_9_result_int[1]~0_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_9_result_int[1]~1\);

-- Location: LCCOMB_X14_Y10_N14
\Div0|auto_generated|divider|divider|add_sub_9_result_int[2]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_9_result_int[2]~2_combout\ = (\Div0|auto_generated|divider|divider|add_sub_9_result_int[1]~1\ & (((\Div0|auto_generated|divider|divider|StageOut[73]~143_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[73]~142_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_9_result_int[1]~1\ & (!\Div0|auto_generated|divider|divider|StageOut[73]~143_combout\ & 
-- (!\Div0|auto_generated|divider|divider|StageOut[73]~142_combout\)))
-- \Div0|auto_generated|divider|divider|add_sub_9_result_int[2]~3\ = CARRY((!\Div0|auto_generated|divider|divider|StageOut[73]~143_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[73]~142_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_9_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[73]~143_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[73]~142_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_9_result_int[1]~1\,
	combout => \Div0|auto_generated|divider|divider|add_sub_9_result_int[2]~2_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_9_result_int[2]~3\);

-- Location: LCCOMB_X15_Y8_N22
\Div1|auto_generated|divider|divider|add_sub_10_result_int[3]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_10_result_int[3]~4_combout\ = (\Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\ & (!\Div1|auto_generated|divider|divider|add_sub_10_result_int[2]~3\ & VCC)) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\ & (\Div1|auto_generated|divider|divider|add_sub_10_result_int[2]~3\ $ (GND)))
-- \Div1|auto_generated|divider|divider|add_sub_10_result_int[3]~5\ = CARRY((!\Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\ & !\Div1|auto_generated|divider|divider|add_sub_10_result_int[2]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_10_result_int[2]~3\,
	combout => \Div1|auto_generated|divider|divider|add_sub_10_result_int[3]~4_combout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_10_result_int[3]~5\);

-- Location: LCCOMB_X13_Y10_N16
\Div0|auto_generated|divider|divider|add_sub_10_result_int[3]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_10_result_int[3]~4_combout\ = (\Div0|auto_generated|divider|divider|add_sub_10_result_int[2]~3\ & (((\Div0|auto_generated|divider|divider|StageOut[83]~151_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[83]~212_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_10_result_int[2]~3\ & ((((\Div0|auto_generated|divider|divider|StageOut[83]~151_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[83]~212_combout\)))))
-- \Div0|auto_generated|divider|divider|add_sub_10_result_int[3]~5\ = CARRY((!\Div0|auto_generated|divider|divider|add_sub_10_result_int[2]~3\ & ((\Div0|auto_generated|divider|divider|StageOut[83]~151_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[83]~212_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[83]~151_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[83]~212_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_10_result_int[2]~3\,
	combout => \Div0|auto_generated|divider|divider|add_sub_10_result_int[3]~4_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_10_result_int[3]~5\);

-- Location: LCCOMB_X13_Y10_N24
\Div0|auto_generated|divider|divider|add_sub_10_result_int[7]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_10_result_int[7]~12_combout\ = (\Div0|auto_generated|divider|divider|add_sub_10_result_int[6]~11\ & (((\Div0|auto_generated|divider|divider|StageOut[87]~187_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[87]~147_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_10_result_int[6]~11\ & ((((\Div0|auto_generated|divider|divider|StageOut[87]~187_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[87]~147_combout\)))))
-- \Div0|auto_generated|divider|divider|add_sub_10_result_int[7]~13\ = CARRY((!\Div0|auto_generated|divider|divider|add_sub_10_result_int[6]~11\ & ((\Div0|auto_generated|divider|divider|StageOut[87]~187_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[87]~147_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[87]~187_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[87]~147_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_10_result_int[6]~11\,
	combout => \Div0|auto_generated|divider|divider|add_sub_10_result_int[7]~12_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_10_result_int[7]~13\);

-- Location: LCCOMB_X14_Y8_N2
\Div1|auto_generated|divider|divider|add_sub_11_result_int[2]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_11_result_int[2]~2_combout\ = (\Div1|auto_generated|divider|divider|add_sub_11_result_int[1]~1\ & (((\Div1|auto_generated|divider|divider|StageOut[51]~41_combout\) # 
-- (\Div1|auto_generated|divider|divider|StageOut[51]~40_combout\)))) # (!\Div1|auto_generated|divider|divider|add_sub_11_result_int[1]~1\ & (!\Div1|auto_generated|divider|divider|StageOut[51]~41_combout\ & 
-- (!\Div1|auto_generated|divider|divider|StageOut[51]~40_combout\)))
-- \Div1|auto_generated|divider|divider|add_sub_11_result_int[2]~3\ = CARRY((!\Div1|auto_generated|divider|divider|StageOut[51]~41_combout\ & (!\Div1|auto_generated|divider|divider|StageOut[51]~40_combout\ & 
-- !\Div1|auto_generated|divider|divider|add_sub_11_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[51]~41_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[51]~40_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_11_result_int[1]~1\,
	combout => \Div1|auto_generated|divider|divider|add_sub_11_result_int[2]~2_combout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_11_result_int[2]~3\);

-- Location: LCCOMB_X14_Y8_N4
\Div1|auto_generated|divider|divider|add_sub_11_result_int[3]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_11_result_int[3]~4_combout\ = (\Div1|auto_generated|divider|divider|add_sub_11_result_int[2]~3\ & (((\Div1|auto_generated|divider|divider|StageOut[52]~38_combout\) # 
-- (\Div1|auto_generated|divider|divider|StageOut[52]~39_combout\)))) # (!\Div1|auto_generated|divider|divider|add_sub_11_result_int[2]~3\ & ((((\Div1|auto_generated|divider|divider|StageOut[52]~38_combout\) # 
-- (\Div1|auto_generated|divider|divider|StageOut[52]~39_combout\)))))
-- \Div1|auto_generated|divider|divider|add_sub_11_result_int[3]~5\ = CARRY((!\Div1|auto_generated|divider|divider|add_sub_11_result_int[2]~3\ & ((\Div1|auto_generated|divider|divider|StageOut[52]~38_combout\) # 
-- (\Div1|auto_generated|divider|divider|StageOut[52]~39_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[52]~38_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[52]~39_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_11_result_int[2]~3\,
	combout => \Div1|auto_generated|divider|divider|add_sub_11_result_int[3]~4_combout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_11_result_int[3]~5\);

-- Location: LCCOMB_X12_Y10_N6
\Div0|auto_generated|divider|divider|add_sub_11_result_int[2]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_11_result_int[2]~2_combout\ = (\Div0|auto_generated|divider|divider|add_sub_11_result_int[1]~1\ & (((\Div0|auto_generated|divider|divider|StageOut[91]~162_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[91]~163_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_11_result_int[1]~1\ & (!\Div0|auto_generated|divider|divider|StageOut[91]~162_combout\ & 
-- (!\Div0|auto_generated|divider|divider|StageOut[91]~163_combout\)))
-- \Div0|auto_generated|divider|divider|add_sub_11_result_int[2]~3\ = CARRY((!\Div0|auto_generated|divider|divider|StageOut[91]~162_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[91]~163_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_11_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[91]~162_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[91]~163_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_11_result_int[1]~1\,
	combout => \Div0|auto_generated|divider|divider|add_sub_11_result_int[2]~2_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_11_result_int[2]~3\);

-- Location: LCCOMB_X12_Y10_N8
\Div0|auto_generated|divider|divider|add_sub_11_result_int[3]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_11_result_int[3]~4_combout\ = (\Div0|auto_generated|divider|divider|add_sub_11_result_int[2]~3\ & (((\Div0|auto_generated|divider|divider|StageOut[92]~161_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[92]~213_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_11_result_int[2]~3\ & ((((\Div0|auto_generated|divider|divider|StageOut[92]~161_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[92]~213_combout\)))))
-- \Div0|auto_generated|divider|divider|add_sub_11_result_int[3]~5\ = CARRY((!\Div0|auto_generated|divider|divider|add_sub_11_result_int[2]~3\ & ((\Div0|auto_generated|divider|divider|StageOut[92]~161_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[92]~213_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[92]~161_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[92]~213_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_11_result_int[2]~3\,
	combout => \Div0|auto_generated|divider|divider|add_sub_11_result_int[3]~4_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_11_result_int[3]~5\);

-- Location: LCCOMB_X12_Y10_N12
\Div0|auto_generated|divider|divider|add_sub_11_result_int[5]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_11_result_int[5]~8_combout\ = (\Div0|auto_generated|divider|divider|add_sub_11_result_int[4]~7\ & (((\Div0|auto_generated|divider|divider|StageOut[94]~159_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[94]~194_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_11_result_int[4]~7\ & ((((\Div0|auto_generated|divider|divider|StageOut[94]~159_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[94]~194_combout\)))))
-- \Div0|auto_generated|divider|divider|add_sub_11_result_int[5]~9\ = CARRY((!\Div0|auto_generated|divider|divider|add_sub_11_result_int[4]~7\ & ((\Div0|auto_generated|divider|divider|StageOut[94]~159_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[94]~194_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[94]~159_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[94]~194_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_11_result_int[4]~7\,
	combout => \Div0|auto_generated|divider|divider|add_sub_11_result_int[5]~8_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_11_result_int[5]~9\);

-- Location: LCCOMB_X12_Y10_N16
\Div0|auto_generated|divider|divider|add_sub_11_result_int[7]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_11_result_int[7]~12_combout\ = (\Div0|auto_generated|divider|divider|add_sub_11_result_int[6]~11\ & (((\Div0|auto_generated|divider|divider|StageOut[96]~157_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[96]~192_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_11_result_int[6]~11\ & ((((\Div0|auto_generated|divider|divider|StageOut[96]~157_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[96]~192_combout\)))))
-- \Div0|auto_generated|divider|divider|add_sub_11_result_int[7]~13\ = CARRY((!\Div0|auto_generated|divider|divider|add_sub_11_result_int[6]~11\ & ((\Div0|auto_generated|divider|divider|StageOut[96]~157_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[96]~192_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[96]~157_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[96]~192_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_11_result_int[6]~11\,
	combout => \Div0|auto_generated|divider|divider|add_sub_11_result_int[7]~12_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_11_result_int[7]~13\);

-- Location: LCCOMB_X13_Y8_N0
\Div1|auto_generated|divider|divider|add_sub_12_result_int[1]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_12_result_int[1]~0_combout\ = (((\Div1|auto_generated|divider|divider|StageOut[55]~47_combout\) # (\Div1|auto_generated|divider|divider|StageOut[55]~48_combout\)))
-- \Div1|auto_generated|divider|divider|add_sub_12_result_int[1]~1\ = CARRY((\Div1|auto_generated|divider|divider|StageOut[55]~47_combout\) # (\Div1|auto_generated|divider|divider|StageOut[55]~48_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[55]~47_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[55]~48_combout\,
	datad => VCC,
	combout => \Div1|auto_generated|divider|divider|add_sub_12_result_int[1]~0_combout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_12_result_int[1]~1\);

-- Location: LCCOMB_X13_Y8_N2
\Div1|auto_generated|divider|divider|add_sub_12_result_int[2]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_12_result_int[2]~2_combout\ = (\Div1|auto_generated|divider|divider|add_sub_12_result_int[1]~1\ & (((\Div1|auto_generated|divider|divider|StageOut[56]~58_combout\) # 
-- (\Div1|auto_generated|divider|divider|StageOut[56]~46_combout\)))) # (!\Div1|auto_generated|divider|divider|add_sub_12_result_int[1]~1\ & (!\Div1|auto_generated|divider|divider|StageOut[56]~58_combout\ & 
-- (!\Div1|auto_generated|divider|divider|StageOut[56]~46_combout\)))
-- \Div1|auto_generated|divider|divider|add_sub_12_result_int[2]~3\ = CARRY((!\Div1|auto_generated|divider|divider|StageOut[56]~58_combout\ & (!\Div1|auto_generated|divider|divider|StageOut[56]~46_combout\ & 
-- !\Div1|auto_generated|divider|divider|add_sub_12_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[56]~58_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[56]~46_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_12_result_int[1]~1\,
	combout => \Div1|auto_generated|divider|divider|add_sub_12_result_int[2]~2_combout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_12_result_int[2]~3\);

-- Location: LCCOMB_X9_Y10_N0
\Div0|auto_generated|divider|divider|add_sub_12_result_int[1]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_12_result_int[1]~0_combout\ = (((\Div0|auto_generated|divider|divider|StageOut[99]~174_combout\) # (\Div0|auto_generated|divider|divider|StageOut[99]~175_combout\)))
-- \Div0|auto_generated|divider|divider|add_sub_12_result_int[1]~1\ = CARRY((\Div0|auto_generated|divider|divider|StageOut[99]~174_combout\) # (\Div0|auto_generated|divider|divider|StageOut[99]~175_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[99]~174_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[99]~175_combout\,
	datad => VCC,
	combout => \Div0|auto_generated|divider|divider|add_sub_12_result_int[1]~0_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_12_result_int[1]~1\);

-- Location: LCCOMB_X9_Y10_N8
\Div0|auto_generated|divider|divider|add_sub_12_result_int[5]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_12_result_int[5]~8_combout\ = (\Div0|auto_generated|divider|divider|add_sub_12_result_int[4]~7\ & (((\Div0|auto_generated|divider|divider|StageOut[103]~199_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[103]~169_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_12_result_int[4]~7\ & ((((\Div0|auto_generated|divider|divider|StageOut[103]~199_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[103]~169_combout\)))))
-- \Div0|auto_generated|divider|divider|add_sub_12_result_int[5]~9\ = CARRY((!\Div0|auto_generated|divider|divider|add_sub_12_result_int[4]~7\ & ((\Div0|auto_generated|divider|divider|StageOut[103]~199_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[103]~169_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[103]~199_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[103]~169_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_12_result_int[4]~7\,
	combout => \Div0|auto_generated|divider|divider|add_sub_12_result_int[5]~8_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_12_result_int[5]~9\);

-- Location: LCCOMB_X9_Y10_N12
\Div0|auto_generated|divider|divider|add_sub_12_result_int[7]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_12_result_int[7]~12_combout\ = (\Div0|auto_generated|divider|divider|add_sub_12_result_int[6]~11\ & (((\Div0|auto_generated|divider|divider|StageOut[105]~167_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[105]~197_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_12_result_int[6]~11\ & ((((\Div0|auto_generated|divider|divider|StageOut[105]~167_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[105]~197_combout\)))))
-- \Div0|auto_generated|divider|divider|add_sub_12_result_int[7]~13\ = CARRY((!\Div0|auto_generated|divider|divider|add_sub_12_result_int[6]~11\ & ((\Div0|auto_generated|divider|divider|StageOut[105]~167_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[105]~197_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[105]~167_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[105]~197_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_12_result_int[6]~11\,
	combout => \Div0|auto_generated|divider|divider|add_sub_12_result_int[7]~12_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_12_result_int[7]~13\);

-- Location: LCFF_X9_Y11_N13
\count10s[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \count10s[2]~17_combout\,
	sclr => \count10s[8]~19_combout\,
	ena => \count10s[8]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count10s(2));

-- Location: LCFF_X9_Y11_N17
\count10s[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \count10s[4]~23_combout\,
	sclr => \count10s[8]~19_combout\,
	ena => \count10s[8]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count10s(4));

-- Location: LCFF_X9_Y11_N21
\count10s[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \count10s[6]~27_combout\,
	sclr => \count10s[8]~19_combout\,
	ena => \count10s[8]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count10s(6));

-- Location: LCFF_X9_Y11_N25
\count10s[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \count10s[8]~31_combout\,
	sclr => \count10s[8]~19_combout\,
	ena => \count10s[8]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count10s(8));

-- Location: LCCOMB_X12_Y11_N8
\Add6~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add6~8_combout\ = ((\Selector43~0_combout\ $ (charge_time(4) $ (\Add6~7\)))) # (GND)
-- \Add6~9\ = CARRY((\Selector43~0_combout\ & (charge_time(4) & !\Add6~7\)) # (!\Selector43~0_combout\ & ((charge_time(4)) # (!\Add6~7\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Selector43~0_combout\,
	datab => charge_time(4),
	datad => VCC,
	cin => \Add6~7\,
	combout => \Add6~8_combout\,
	cout => \Add6~9\);

-- Location: LCCOMB_X12_Y11_N10
\Add6~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add6~10_combout\ = (\Selector43~0_combout\ & ((charge_time(5) & (!\Add6~9\)) # (!charge_time(5) & ((\Add6~9\) # (GND))))) # (!\Selector43~0_combout\ & ((charge_time(5) & (\Add6~9\ & VCC)) # (!charge_time(5) & (!\Add6~9\))))
-- \Add6~11\ = CARRY((\Selector43~0_combout\ & ((!\Add6~9\) # (!charge_time(5)))) # (!\Selector43~0_combout\ & (!charge_time(5) & !\Add6~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Selector43~0_combout\,
	datab => charge_time(5),
	datad => VCC,
	cin => \Add6~9\,
	combout => \Add6~10_combout\,
	cout => \Add6~11\);

-- Location: LCCOMB_X14_Y11_N22
\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\ = (\Mult0|mult_core|romout[0][10]~combout\ & ((\Mult0|mult_core|romout[1][5]~combout\ & (\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\ & VCC)) # 
-- (!\Mult0|mult_core|romout[1][5]~combout\ & (!\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\)))) # (!\Mult0|mult_core|romout[0][10]~combout\ & ((\Mult0|mult_core|romout[1][5]~combout\ & (!\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\)) # 
-- (!\Mult0|mult_core|romout[1][5]~combout\ & ((\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\) # (GND)))))
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~11\ = CARRY((\Mult0|mult_core|romout[0][10]~combout\ & (!\Mult0|mult_core|romout[1][5]~combout\ & !\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\)) # (!\Mult0|mult_core|romout[0][10]~combout\ & 
-- ((!\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\) # (!\Mult0|mult_core|romout[1][5]~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|mult_core|romout[0][10]~combout\,
	datab => \Mult0|mult_core|romout[1][5]~combout\,
	datad => VCC,
	cin => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\,
	combout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\,
	cout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~11\);

-- Location: LCCOMB_X12_Y11_N20
\Add6~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add6~20_combout\ = ((charge_time(10) $ (\Selector43~0_combout\ $ (\Add6~19\)))) # (GND)
-- \Add6~21\ = CARRY((charge_time(10) & ((!\Add6~19\) # (!\Selector43~0_combout\))) # (!charge_time(10) & (!\Selector43~0_combout\ & !\Add6~19\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => charge_time(10),
	datab => \Selector43~0_combout\,
	datad => VCC,
	cin => \Add6~19\,
	combout => \Add6~20_combout\,
	cout => \Add6~21\);

-- Location: LCCOMB_X14_Y11_N24
\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~12_combout\ = ((\Mult0|mult_core|romout[0][11]~combout\ $ (\Mult0|mult_core|romout[1][5]~combout\ $ (!\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~11\)))) # (GND)
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13\ = CARRY((\Mult0|mult_core|romout[0][11]~combout\ & ((\Mult0|mult_core|romout[1][5]~combout\) # (!\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~11\))) # 
-- (!\Mult0|mult_core|romout[0][11]~combout\ & (\Mult0|mult_core|romout[1][5]~combout\ & !\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|mult_core|romout[0][11]~combout\,
	datab => \Mult0|mult_core|romout[1][5]~combout\,
	datad => VCC,
	cin => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~11\,
	combout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~12_combout\,
	cout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13\);

-- Location: LCFF_X9_Y11_N11
\count10s[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \count10s[1]~15_combout\,
	sclr => \count10s[8]~19_combout\,
	ena => \count10s[8]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count10s(1));

-- Location: LCCOMB_X9_Y11_N10
\count10s[1]~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \count10s[1]~15_combout\ = (count10s(1) & (!\count10s[0]~14\)) # (!count10s(1) & ((\count10s[0]~14\) # (GND)))
-- \count10s[1]~16\ = CARRY((!\count10s[0]~14\) # (!count10s(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count10s(1),
	datad => VCC,
	cin => \count10s[0]~14\,
	combout => \count10s[1]~15_combout\,
	cout => \count10s[1]~16\);

-- Location: LCCOMB_X9_Y11_N12
\count10s[2]~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \count10s[2]~17_combout\ = (count10s(2) & (\count10s[1]~16\ $ (GND))) # (!count10s(2) & (!\count10s[1]~16\ & VCC))
-- \count10s[2]~18\ = CARRY((count10s(2) & !\count10s[1]~16\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count10s(2),
	datad => VCC,
	cin => \count10s[1]~16\,
	combout => \count10s[2]~17_combout\,
	cout => \count10s[2]~18\);

-- Location: LCCOMB_X9_Y11_N16
\count10s[4]~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \count10s[4]~23_combout\ = (count10s(4) & (\count10s[3]~22\ $ (GND))) # (!count10s(4) & (!\count10s[3]~22\ & VCC))
-- \count10s[4]~24\ = CARRY((count10s(4) & !\count10s[3]~22\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count10s(4),
	datad => VCC,
	cin => \count10s[3]~22\,
	combout => \count10s[4]~23_combout\,
	cout => \count10s[4]~24\);

-- Location: LCCOMB_X9_Y11_N20
\count10s[6]~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \count10s[6]~27_combout\ = (count10s(6) & (\count10s[5]~26\ $ (GND))) # (!count10s(6) & (!\count10s[5]~26\ & VCC))
-- \count10s[6]~28\ = CARRY((count10s(6) & !\count10s[5]~26\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count10s(6),
	datad => VCC,
	cin => \count10s[5]~26\,
	combout => \count10s[6]~27_combout\,
	cout => \count10s[6]~28\);

-- Location: LCCOMB_X9_Y11_N24
\count10s[8]~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \count10s[8]~31_combout\ = (count10s(8) & (\count10s[7]~30\ $ (GND))) # (!count10s(8) & (!\count10s[7]~30\ & VCC))
-- \count10s[8]~32\ = CARRY((count10s(8) & !\count10s[7]~30\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count10s(8),
	datad => VCC,
	cin => \count10s[7]~30\,
	combout => \count10s[8]~31_combout\,
	cout => \count10s[8]~32\);

-- Location: LCCOMB_X8_Y9_N24
\Add0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~1_combout\ = \money0[0]~reg0_regout\ $ (\money0[2]~reg0_regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \money0[0]~reg0_regout\,
	datad => \money0[2]~reg0_regout\,
	combout => \Add0~1_combout\);

-- Location: LCCOMB_X12_Y9_N12
\LessThan2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan2~0_combout\ = (((!charge_time(2) & !charge_time(1))) # (!charge_time(4))) # (!charge_time(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => charge_time(3),
	datab => charge_time(2),
	datac => charge_time(1),
	datad => charge_time(4),
	combout => \LessThan2~0_combout\);

-- Location: LCFF_X15_Y9_N7
\charge_time[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \Selector18~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => charge_time(10));

-- Location: LCCOMB_X8_Y8_N20
\Selector11~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector11~0_combout\ = (\inputbottom~combout\(2) & (!\inputbottom~combout\(0) & !\inputbottom~combout\(1))) # (!\inputbottom~combout\(2) & ((\inputbottom~combout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inputbottom~combout\(2),
	datac => \inputbottom~combout\(0),
	datad => \inputbottom~combout\(1),
	combout => \Selector11~0_combout\);

-- Location: LCCOMB_X14_Y9_N30
\Div0|auto_generated|divider|divider|StageOut[70]~121\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[70]~121_combout\ = (!\Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\ & \Div0|auto_generated|divider|divider|add_sub_7_result_int[7]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_7_result_int[7]~12_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[70]~121_combout\);

-- Location: LCCOMB_X14_Y9_N24
\Div0|auto_generated|divider|divider|StageOut[69]~123\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[69]~123_combout\ = (\Div0|auto_generated|divider|divider|add_sub_7_result_int[6]~10_combout\ & !\Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_7_result_int[6]~10_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[69]~123_combout\);

-- Location: LCCOMB_X15_Y9_N14
\Div0|auto_generated|divider|divider|StageOut[68]~125\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[68]~125_combout\ = (\Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ & !\Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[68]~125_combout\);

-- Location: LCCOMB_X15_Y9_N2
\Div0|auto_generated|divider|divider|StageOut[67]~127\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[67]~127_combout\ = (\Div0|auto_generated|divider|divider|add_sub_7_result_int[4]~6_combout\ & !\Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|add_sub_7_result_int[4]~6_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[67]~127_combout\);

-- Location: LCCOMB_X13_Y9_N20
\Div0|auto_generated|divider|divider|StageOut[66]~128\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[66]~128_combout\ = (charge_time(9) & \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => charge_time(9),
	datad => \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[66]~128_combout\);

-- Location: LCCOMB_X15_Y9_N6
\Div0|auto_generated|divider|divider|StageOut[65]~131\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[65]~131_combout\ = (\Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\ & !\Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[65]~131_combout\);

-- Location: LCCOMB_X15_Y9_N10
\Div0|auto_generated|divider|divider|StageOut[64]~132\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[64]~132_combout\ = (charge_time(7) & \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => charge_time(7),
	datad => \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[64]~132_combout\);

-- Location: LCCOMB_X15_Y9_N4
\Div0|auto_generated|divider|divider|StageOut[63]~134\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[63]~134_combout\ = (charge_time(6) & \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => charge_time(6),
	datad => \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[63]~134_combout\);

-- Location: LCCOMB_X13_Y9_N26
\Div0|auto_generated|divider|divider|StageOut[76]~139\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[76]~139_combout\ = (\Div0|auto_generated|divider|divider|add_sub_8_result_int[4]~6_combout\ & !\Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_8_result_int[4]~6_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[76]~139_combout\);

-- Location: LCCOMB_X15_Y10_N6
\Div0|auto_generated|divider|divider|StageOut[75]~140\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[75]~140_combout\ = (!\Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\ & \Div0|auto_generated|divider|divider|add_sub_8_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_8_result_int[3]~4_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[75]~140_combout\);

-- Location: LCCOMB_X13_Y9_N0
\Div0|auto_generated|divider|divider|StageOut[73]~143\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[73]~143_combout\ = (\Div0|auto_generated|divider|divider|add_sub_8_result_int[1]~0_combout\ & !\Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_8_result_int[1]~0_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[73]~143_combout\);

-- Location: LCCOMB_X15_Y10_N4
\Div0|auto_generated|divider|divider|StageOut[72]~144\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[72]~144_combout\ = (charge_time(5) & \Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => charge_time(5),
	datad => \Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[72]~144_combout\);

-- Location: LCCOMB_X14_Y8_N12
\Div1|auto_generated|divider|divider|StageOut[53]~37\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[53]~37_combout\ = (!\Div1|auto_generated|divider|divider|add_sub_10_result_int[5]~8_combout\ & \Div1|auto_generated|divider|divider|add_sub_10_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div1|auto_generated|divider|divider|add_sub_10_result_int[5]~8_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_10_result_int[3]~4_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[53]~37_combout\);

-- Location: LCCOMB_X14_Y8_N10
\Div1|auto_generated|divider|divider|StageOut[52]~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[52]~38_combout\ = (!\Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\ & \Div1|auto_generated|divider|divider|add_sub_10_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	datac => \Div1|auto_generated|divider|divider|add_sub_10_result_int[5]~8_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[52]~38_combout\);

-- Location: LCCOMB_X14_Y8_N20
\Div1|auto_generated|divider|divider|StageOut[51]~41\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[51]~41_combout\ = (!\Div1|auto_generated|divider|divider|add_sub_10_result_int[5]~8_combout\ & \Div1|auto_generated|divider|divider|add_sub_10_result_int[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div1|auto_generated|divider|divider|add_sub_10_result_int[5]~8_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_10_result_int[1]~0_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[51]~41_combout\);

-- Location: LCCOMB_X14_Y10_N4
\Div0|auto_generated|divider|divider|StageOut[86]~148\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[86]~148_combout\ = (\Div0|auto_generated|divider|divider|add_sub_9_result_int[5]~8_combout\ & !\Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_9_result_int[5]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[86]~148_combout\);

-- Location: LCCOMB_X14_Y10_N6
\Div0|auto_generated|divider|divider|StageOut[83]~151\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[83]~151_combout\ = (\Div0|auto_generated|divider|divider|add_sub_9_result_int[2]~2_combout\ & !\Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_9_result_int[2]~2_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[83]~151_combout\);

-- Location: LCCOMB_X15_Y10_N26
\Div0|auto_generated|divider|divider|StageOut[82]~153\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[82]~153_combout\ = (\Div0|auto_generated|divider|divider|add_sub_9_result_int[1]~0_combout\ & !\Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_9_result_int[1]~0_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[82]~153_combout\);

-- Location: LCCOMB_X15_Y10_N20
\Div0|auto_generated|divider|divider|StageOut[81]~155\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[81]~155_combout\ = (charge_time(4) & !\Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => charge_time(4),
	datad => \Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[81]~155_combout\);

-- Location: LCCOMB_X14_Y8_N24
\Div1|auto_generated|divider|divider|StageOut[50]~43\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[50]~43_combout\ = (!\Div1|auto_generated|divider|divider|add_sub_10_result_int[5]~8_combout\ & \Div1|auto_generated|divider|divider|add_sub_10_result_int[0]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div1|auto_generated|divider|divider|add_sub_10_result_int[5]~8_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_10_result_int[0]~10_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[50]~43_combout\);

-- Location: LCCOMB_X14_Y8_N26
\Div1|auto_generated|divider|divider|StageOut[58]~44\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[58]~44_combout\ = (\Div1|auto_generated|divider|divider|add_sub_11_result_int[3]~4_combout\ & !\Div1|auto_generated|divider|divider|add_sub_11_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div1|auto_generated|divider|divider|add_sub_11_result_int[3]~4_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_11_result_int[5]~8_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[58]~44_combout\);

-- Location: LCCOMB_X14_Y8_N16
\Div1|auto_generated|divider|divider|StageOut[57]~45\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[57]~45_combout\ = (!\Div1|auto_generated|divider|divider|add_sub_11_result_int[5]~8_combout\ & \Div1|auto_generated|divider|divider|add_sub_11_result_int[2]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div1|auto_generated|divider|divider|add_sub_11_result_int[5]~8_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_11_result_int[2]~2_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[57]~45_combout\);

-- Location: LCCOMB_X12_Y10_N24
\Div0|auto_generated|divider|divider|StageOut[97]~156\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[97]~156_combout\ = (\Div0|auto_generated|divider|divider|add_sub_10_result_int[7]~12_combout\ & !\Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|add_sub_10_result_int[7]~12_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[97]~156_combout\);

-- Location: LCCOMB_X13_Y10_N4
\Div0|auto_generated|divider|divider|StageOut[96]~157\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[96]~157_combout\ = (\Div0|auto_generated|divider|divider|add_sub_10_result_int[6]~10_combout\ & !\Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|add_sub_10_result_int[6]~10_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[96]~157_combout\);

-- Location: LCCOMB_X13_Y10_N8
\Div0|auto_generated|divider|divider|StageOut[94]~159\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[94]~159_combout\ = (!\Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\ & \Div0|auto_generated|divider|divider|add_sub_10_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_10_result_int[4]~6_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[94]~159_combout\);

-- Location: LCCOMB_X13_Y10_N2
\Div0|auto_generated|divider|divider|StageOut[93]~160\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[93]~160_combout\ = (\Div0|auto_generated|divider|divider|add_sub_10_result_int[3]~4_combout\ & !\Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_10_result_int[3]~4_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[93]~160_combout\);

-- Location: LCCOMB_X12_Y10_N2
\Div0|auto_generated|divider|divider|StageOut[92]~161\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[92]~161_combout\ = (\Div0|auto_generated|divider|divider|add_sub_10_result_int[2]~2_combout\ & !\Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_10_result_int[2]~2_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[92]~161_combout\);

-- Location: LCCOMB_X10_Y10_N10
\Div0|auto_generated|divider|divider|StageOut[91]~162\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[91]~162_combout\ = (charge_time(4) & \Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => charge_time(4),
	datad => \Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[91]~162_combout\);

-- Location: LCCOMB_X10_Y10_N20
\Div0|auto_generated|divider|divider|StageOut[90]~165\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[90]~165_combout\ = (charge_time(3) & !\Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => charge_time(3),
	datad => \Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[90]~165_combout\);

-- Location: LCCOMB_X13_Y8_N20
\Div1|auto_generated|divider|divider|StageOut[55]~47\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[55]~47_combout\ = (\Div1|auto_generated|divider|divider|add_sub_11_result_int[5]~8_combout\ & !\Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div1|auto_generated|divider|divider|add_sub_11_result_int[5]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[55]~47_combout\);

-- Location: LCCOMB_X13_Y8_N26
\Div1|auto_generated|divider|divider|StageOut[62]~50\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[62]~50_combout\ = (!\Div1|auto_generated|divider|divider|add_sub_12_result_int[5]~8_combout\ & \Div1|auto_generated|divider|divider|add_sub_12_result_int[2]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div1|auto_generated|divider|divider|add_sub_12_result_int[5]~8_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_12_result_int[2]~2_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[62]~50_combout\);

-- Location: LCCOMB_X12_Y8_N10
\Div1|auto_generated|divider|divider|StageOut[61]~51\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[61]~51_combout\ = (\Div1|auto_generated|divider|divider|add_sub_12_result_int[1]~0_combout\ & !\Div1|auto_generated|divider|divider|add_sub_12_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div1|auto_generated|divider|divider|add_sub_12_result_int[1]~0_combout\,
	datac => \Div1|auto_generated|divider|divider|add_sub_12_result_int[5]~8_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[61]~51_combout\);

-- Location: LCCOMB_X12_Y10_N28
\Div0|auto_generated|divider|divider|StageOut[106]~166\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[106]~166_combout\ = (\Div0|auto_generated|divider|divider|add_sub_11_result_int[7]~12_combout\ & !\Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_11_result_int[7]~12_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[106]~166_combout\);

-- Location: LCCOMB_X12_Y10_N26
\Div0|auto_generated|divider|divider|StageOut[105]~167\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[105]~167_combout\ = (\Div0|auto_generated|divider|divider|add_sub_11_result_int[6]~10_combout\ & !\Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|add_sub_11_result_int[6]~10_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[105]~167_combout\);

-- Location: LCCOMB_X10_Y10_N26
\Div0|auto_generated|divider|divider|StageOut[104]~168\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[104]~168_combout\ = (!\Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\ & \Div0|auto_generated|divider|divider|add_sub_11_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_11_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[104]~168_combout\);

-- Location: LCCOMB_X9_Y10_N20
\Div0|auto_generated|divider|divider|StageOut[102]~170\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[102]~170_combout\ = (\Div0|auto_generated|divider|divider|add_sub_11_result_int[3]~4_combout\ & !\Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_11_result_int[3]~4_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[102]~170_combout\);

-- Location: LCCOMB_X10_Y10_N4
\Div0|auto_generated|divider|divider|StageOut[101]~171\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[101]~171_combout\ = (\Div0|auto_generated|divider|divider|add_sub_11_result_int[2]~2_combout\ & !\Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_11_result_int[2]~2_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[101]~171_combout\);

-- Location: LCCOMB_X10_Y10_N6
\Div0|auto_generated|divider|divider|StageOut[100]~172\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[100]~172_combout\ = (charge_time(3) & \Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => charge_time(3),
	datad => \Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[100]~172_combout\);

-- Location: LCCOMB_X10_Y10_N2
\Div0|auto_generated|divider|divider|StageOut[99]~174\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[99]~174_combout\ = (charge_time(2) & \Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => charge_time(2),
	datad => \Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[99]~174_combout\);

-- Location: LCCOMB_X12_Y8_N6
\Div1|auto_generated|divider|divider|StageOut[60]~53\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[60]~53_combout\ = (!\Div1|auto_generated|divider|divider|add_sub_12_result_int[5]~8_combout\ & !\Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div1|auto_generated|divider|divider|add_sub_12_result_int[5]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[60]~53_combout\);

-- Location: LCCOMB_X8_Y10_N20
\Div0|auto_generated|divider|divider|StageOut[115]~176\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[115]~176_combout\ = (\Div0|auto_generated|divider|divider|add_sub_12_result_int[7]~12_combout\ & !\Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_12_result_int[7]~12_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[115]~176_combout\);

-- Location: LCCOMB_X9_Y10_N26
\Div0|auto_generated|divider|divider|StageOut[113]~178\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[113]~178_combout\ = (\Div0|auto_generated|divider|divider|add_sub_12_result_int[5]~8_combout\ & !\Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|add_sub_12_result_int[5]~8_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[113]~178_combout\);

-- Location: LCCOMB_X8_Y10_N24
\Div0|auto_generated|divider|divider|StageOut[109]~183\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[109]~183_combout\ = (\Div0|auto_generated|divider|divider|add_sub_12_result_int[1]~0_combout\ & !\Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_12_result_int[1]~0_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[109]~183_combout\);

-- Location: LCCOMB_X7_Y10_N30
\Div0|auto_generated|divider|divider|StageOut[108]~184\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[108]~184_combout\ = (charge_time(1) & \Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => charge_time(1),
	datad => \Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[108]~184_combout\);

-- Location: LCCOMB_X8_Y8_N10
\Selector41~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector41~2_combout\ = (\inputbottom~combout\(2) & (!\inputbottom~combout\(1) & (!\inputbottom~combout\(0)))) # (!\inputbottom~combout\(2) & (\inputbottom~combout\(3) & (\inputbottom~combout\(1) $ (\inputbottom~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001011000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inputbottom~combout\(2),
	datab => \inputbottom~combout\(1),
	datac => \inputbottom~combout\(0),
	datad => \inputbottom~combout\(3),
	combout => \Selector41~2_combout\);

-- Location: LCCOMB_X9_Y11_N0
\LessThan3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan3~0_combout\ = (!count10s(4) & (!count10s(5) & (!count10s(3) & !count10s(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count10s(4),
	datab => count10s(5),
	datac => count10s(3),
	datad => count10s(2),
	combout => \LessThan3~0_combout\);

-- Location: LCCOMB_X9_Y11_N6
\LessThan3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan3~1_combout\ = (((\LessThan3~0_combout\) # (!count10s(6))) # (!count10s(7))) # (!count10s(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count10s(8),
	datab => count10s(7),
	datac => count10s(6),
	datad => \LessThan3~0_combout\,
	combout => \LessThan3~1_combout\);

-- Location: LCCOMB_X8_Y8_N18
\Selector49~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector49~1_combout\ = (!\inputbottom~combout\(2) & (\inputbottom~combout\(1) & (!\inputbottom~combout\(0) & \inputbottom~combout\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inputbottom~combout\(2),
	datab => \inputbottom~combout\(1),
	datac => \inputbottom~combout\(0),
	datad => \inputbottom~combout\(3),
	combout => \Selector49~1_combout\);

-- Location: LCCOMB_X10_Y8_N10
\Selector45~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector45~0_combout\ = (!\state.s2~regout\ & ((\charge_start~regout\) # ((\Equal6~0_combout\ & \Selector27~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \charge_start~regout\,
	datab => \state.s2~regout\,
	datac => \Equal6~0_combout\,
	datad => \Selector27~0_combout\,
	combout => \Selector45~0_combout\);

-- Location: LCCOMB_X12_Y9_N10
\Selector25~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector25~0_combout\ = (\state.s1~regout\ & ((\ispressed~combout\ & (charge_time(3))) # (!\ispressed~combout\ & ((timer(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => charge_time(3),
	datab => \state.s1~regout\,
	datac => timer(2),
	datad => \ispressed~combout\,
	combout => \Selector25~0_combout\);

-- Location: LCCOMB_X10_Y11_N14
\Mult0|mult_core|romout[0][6]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][6]~1_combout\ = (timer(3) & (!timer(2))) # (!timer(3) & ((timer(2)) # (timer(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011101100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => timer(3),
	datab => timer(2),
	datad => timer(1),
	combout => \Mult0|mult_core|romout[0][6]~1_combout\);

-- Location: LCCOMB_X10_Y11_N18
\Mult0|mult_core|romout[1][4]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[1][4]~3_combout\ = timer(5) $ (timer(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => timer(5),
	datad => timer(4),
	combout => \Mult0|mult_core|romout[1][4]~3_combout\);

-- Location: LCCOMB_X10_Y11_N20
\Mult0|mult_core|romout[0][9]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][9]~4_combout\ = (!timer(1) & ((timer(3)) # (timer(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => timer(3),
	datab => timer(2),
	datad => timer(1),
	combout => \Mult0|mult_core|romout[0][9]~4_combout\);

-- Location: LCCOMB_X10_Y11_N30
\Mult0|mult_core|romout[0][10]\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][10]~combout\ = (timer(2) & ((timer(1)))) # (!timer(2) & (timer(3) & !timer(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => timer(3),
	datab => timer(2),
	datad => timer(1),
	combout => \Mult0|mult_core|romout[0][10]~combout\);

-- Location: LCCOMB_X14_Y11_N30
\Selector18~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector18~0_combout\ = (\state.s1~regout\ & ((\ispressed~combout\ & (charge_time(10))) # (!\ispressed~combout\ & ((\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.s1~regout\,
	datab => \ispressed~combout\,
	datac => charge_time(10),
	datad => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~10_combout\,
	combout => \Selector18~0_combout\);

-- Location: LCCOMB_X13_Y11_N10
\Selector18~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector18~1_combout\ = (\Selector18~0_combout\) # ((\state.s2~regout\ & \Add6~20_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.s2~regout\,
	datac => \Add6~20_combout\,
	datad => \Selector18~0_combout\,
	combout => \Selector18~1_combout\);

-- Location: LCCOMB_X10_Y11_N12
\Mult0|mult_core|romout[0][11]\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][11]~combout\ = (timer(3) & ((timer(2)) # (timer(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => timer(3),
	datab => timer(2),
	datad => timer(1),
	combout => \Mult0|mult_core|romout[0][11]~combout\);

-- Location: LCCOMB_X10_Y8_N16
\Selector48~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector48~0_combout\ = (!\state.s0~regout\ & ((!\ispressed~combout\) # (!\Selector49~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.s0~regout\,
	datac => \Selector49~1_combout\,
	datad => \ispressed~combout\,
	combout => \Selector48~0_combout\);

-- Location: LCCOMB_X9_Y8_N26
\always0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \always0~1_combout\ = (\time0[3]~reg0_regout\) # ((\time0[2]~reg0_regout\) # ((\time1[3]~reg0_regout\) # (\time1[1]~reg0_regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \time0[3]~reg0_regout\,
	datab => \time0[2]~reg0_regout\,
	datac => \time1[3]~reg0_regout\,
	datad => \time1[1]~reg0_regout\,
	combout => \always0~1_combout\);

-- Location: LCCOMB_X8_Y11_N20
\Add3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~0_combout\ = \money1[2]~reg0_regout\ $ (\money1[0]~reg0_regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \money1[2]~reg0_regout\,
	datad => \money1[0]~reg0_regout\,
	combout => \Add3~0_combout\);

-- Location: LCCOMB_X13_Y10_N10
\Div0|auto_generated|divider|divider|StageOut[88]~186\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[88]~186_combout\ = (\Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[78]~207_combout\) # 
-- ((!\Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\ & \Div0|auto_generated|divider|divider|add_sub_8_result_int[6]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[78]~207_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_8_result_int[6]~10_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[88]~186_combout\);

-- Location: LCCOMB_X15_Y10_N10
\Div0|auto_generated|divider|divider|StageOut[85]~189\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[85]~189_combout\ = (\Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[75]~210_combout\) # 
-- ((\Div0|auto_generated|divider|divider|add_sub_8_result_int[3]~4_combout\ & !\Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_8_result_int[3]~4_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	datac => \Div0|auto_generated|divider|divider|StageOut[75]~210_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[85]~189_combout\);

-- Location: LCCOMB_X13_Y8_N16
\Div1|auto_generated|divider|divider|StageOut[63]~54\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[63]~54_combout\ = (\Div1|auto_generated|divider|divider|add_sub_12_result_int[5]~8_combout\ & ((\Div1|auto_generated|divider|divider|StageOut[57]~57_combout\) # 
-- ((!\Div1|auto_generated|divider|divider|add_sub_11_result_int[5]~8_combout\ & \Div1|auto_generated|divider|divider|add_sub_11_result_int[2]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_11_result_int[5]~8_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[57]~57_combout\,
	datac => \Div1|auto_generated|divider|divider|add_sub_12_result_int[5]~8_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_11_result_int[2]~2_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[63]~54_combout\);

-- Location: LCCOMB_X10_Y10_N16
\Div0|auto_generated|divider|divider|StageOut[103]~199\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[103]~199_combout\ = (\Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[93]~195_combout\) # 
-- ((\Div0|auto_generated|divider|divider|add_sub_10_result_int[3]~4_combout\ & !\Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_10_result_int[3]~4_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\,
	datac => \Div0|auto_generated|divider|divider|StageOut[93]~195_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[103]~199_combout\);

-- Location: LCCOMB_X9_Y10_N28
\Div0|auto_generated|divider|divider|StageOut[114]~202\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[114]~202_combout\ = (\Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[104]~198_combout\) # 
-- ((\Div0|auto_generated|divider|divider|add_sub_11_result_int[5]~8_combout\ & !\Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_11_result_int[5]~8_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\,
	datad => \Div0|auto_generated|divider|divider|StageOut[104]~198_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[114]~202_combout\);

-- Location: LCCOMB_X9_Y11_N2
\Div0|auto_generated|divider|divider|StageOut[112]~204\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[112]~204_combout\ = (\Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[102]~200_combout\) # 
-- ((!\Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\ & \Div0|auto_generated|divider|divider|add_sub_11_result_int[3]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_11_result_int[3]~4_combout\,
	datac => \Div0|auto_generated|divider|divider|StageOut[102]~200_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[112]~204_combout\);

-- Location: LCCOMB_X7_Y10_N20
\Div0|auto_generated|divider|divider|StageOut[111]~205\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[111]~205_combout\ = (\Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[101]~214_combout\) # 
-- ((!\Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\ & \Div0|auto_generated|divider|divider|add_sub_11_result_int[2]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[101]~214_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_11_result_int[2]~2_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[111]~205_combout\);

-- Location: LCCOMB_X15_Y10_N16
\Div0|auto_generated|divider|divider|StageOut[79]~206\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[79]~206_combout\ = (\Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\ & (charge_time(12))) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_7_result_int[6]~10_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	datab => charge_time(12),
	datac => \Div0|auto_generated|divider|divider|add_sub_7_result_int[6]~10_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[79]~206_combout\);

-- Location: LCCOMB_X15_Y10_N2
\Div0|auto_generated|divider|divider|StageOut[78]~207\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[78]~207_combout\ = (\Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\ & (charge_time(11))) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => charge_time(11),
	datab => \Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[78]~207_combout\);

-- Location: LCCOMB_X8_Y10_N26
\Div0|auto_generated|divider|divider|StageOut[110]~215\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[110]~215_combout\ = (\Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\ & (charge_time(3))) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_11_result_int[1]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => charge_time(3),
	datab => \Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_11_result_int[1]~0_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[110]~215_combout\);

-- Location: PIN_24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\inputbottom[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_inputbottom(2),
	combout => \inputbottom~combout\(2));

-- Location: PIN_23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clk~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_clk,
	combout => \clk~combout\);

-- Location: CLKCTRL_G2
\clk~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~clkctrl_outclk\);

-- Location: PIN_192,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\inputbottom[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_inputbottom(3),
	combout => \inputbottom~combout\(3));

-- Location: PIN_27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\inputbottom[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_inputbottom(0),
	combout => \inputbottom~combout\(0));

-- Location: PIN_28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\inputbottom[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_inputbottom(1),
	combout => \inputbottom~combout\(1));

-- Location: LCCOMB_X8_Y8_N6
\money1[3]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \money1[3]~6_combout\ = (\inputbottom~combout\(2)) # (((!\inputbottom~combout\(3)) # (!\inputbottom~combout\(0))) # (!\inputbottom~combout\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inputbottom~combout\(2),
	datab => \inputbottom~combout\(1),
	datac => \inputbottom~combout\(0),
	datad => \inputbottom~combout\(3),
	combout => \money1[3]~6_combout\);

-- Location: LCCOMB_X8_Y8_N2
\Selector36~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector36~0_combout\ = (!\state.s2~regout\ & (\inputbottom~combout\(0) & (\money1[3]~6_combout\ & !\LessThan0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.s2~regout\,
	datab => \inputbottom~combout\(0),
	datac => \money1[3]~6_combout\,
	datad => \LessThan0~2_combout\,
	combout => \Selector36~0_combout\);

-- Location: LCCOMB_X8_Y8_N24
\Equal6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal6~0_combout\ = (\inputbottom~combout\(2) & (!\inputbottom~combout\(1) & (!\inputbottom~combout\(0) & \inputbottom~combout\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inputbottom~combout\(2),
	datab => \inputbottom~combout\(1),
	datac => \inputbottom~combout\(0),
	datad => \inputbottom~combout\(3),
	combout => \Equal6~0_combout\);

-- Location: LCCOMB_X10_Y8_N18
\Selector49~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector49~2_combout\ = (\state.s1~regout\ & (((!\Equal6~0_combout\ & \money1[3]~6_combout\)))) # (!\state.s1~regout\ & (\Selector49~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector49~1_combout\,
	datab => \Equal6~0_combout\,
	datac => \state.s1~regout\,
	datad => \money1[3]~6_combout\,
	combout => \Selector49~2_combout\);

-- Location: LCCOMB_X9_Y11_N8
\count10s[0]~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \count10s[0]~13_combout\ = count10s(0) $ (VCC)
-- \count10s[0]~14\ = CARRY(count10s(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count10s(0),
	datad => VCC,
	combout => \count10s[0]~13_combout\,
	cout => \count10s[0]~14\);

-- Location: PIN_187,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ispressed~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ispressed,
	combout => \ispressed~combout\);

-- Location: LCCOMB_X10_Y11_N10
\count10s[8]~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \count10s[8]~19_combout\ = (\ispressed~combout\) # (!\state.s1~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state.s1~regout\,
	datad => \ispressed~combout\,
	combout => \count10s[8]~19_combout\);

-- Location: LCCOMB_X8_Y11_N18
\Selector33~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector33~0_combout\ = (!\state.s2~regout\ & (!\LessThan0~2_combout\ & (\money1[3]~6_combout\ & \inputbottom~combout\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.s2~regout\,
	datab => \LessThan0~2_combout\,
	datac => \money1[3]~6_combout\,
	datad => \inputbottom~combout\(3),
	combout => \Selector33~0_combout\);

-- Location: LCFF_X8_Y11_N19
\money0[3]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector33~0_combout\,
	ena => \money1[0]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \money0[3]~reg0_regout\);

-- Location: LCCOMB_X8_Y8_N0
\Selector35~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector35~0_combout\ = (!\state.s2~regout\ & (\inputbottom~combout\(1) & (\money1[3]~6_combout\ & !\LessThan0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.s2~regout\,
	datab => \inputbottom~combout\(1),
	datac => \money1[3]~6_combout\,
	datad => \LessThan0~2_combout\,
	combout => \Selector35~0_combout\);

-- Location: LCFF_X8_Y8_N1
\money0[1]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector35~0_combout\,
	ena => \money1[0]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \money0[1]~reg0_regout\);

-- Location: LCCOMB_X10_Y8_N22
\Selector27~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector27~0_combout\ = (\state.s1~regout\ & \ispressed~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state.s1~regout\,
	datad => \ispressed~combout\,
	combout => \Selector27~0_combout\);

-- Location: LCCOMB_X10_Y8_N28
\Selector50~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector50~0_combout\ = (\charge_start~regout\ & ((\state.s2~regout\) # ((\Equal6~0_combout\ & \Selector27~0_combout\)))) # (!\charge_start~regout\ & (\Equal6~0_combout\ & ((\Selector27~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \charge_start~regout\,
	datab => \Equal6~0_combout\,
	datac => \state.s2~regout\,
	datad => \Selector27~0_combout\,
	combout => \Selector50~0_combout\);

-- Location: LCFF_X10_Y8_N29
\state.s2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector50~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \state.s2~regout\);

-- Location: LCCOMB_X8_Y8_N8
\time1~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \time1~5_combout\ = (!\inputbottom~combout\(0) & (\inputbottom~combout\(3) & (\inputbottom~combout\(2) $ (\inputbottom~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inputbottom~combout\(2),
	datab => \inputbottom~combout\(1),
	datac => \inputbottom~combout\(0),
	datad => \inputbottom~combout\(3),
	combout => \time1~5_combout\);

-- Location: LCCOMB_X8_Y11_N16
\Selector44~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector44~0_combout\ = (!\state.s2~regout\ & (\time0[0]~reg0_regout\ & ((\time1~5_combout\) # (!\Selector27~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.s2~regout\,
	datab => \time0[0]~reg0_regout\,
	datac => \time1~5_combout\,
	datad => \Selector27~0_combout\,
	combout => \Selector44~0_combout\);

-- Location: LCCOMB_X8_Y8_N26
\money1[0]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \money1[0]~2_combout\ = (\inputbottom~combout\(2)) # ((!\inputbottom~combout\(1)) # (!\inputbottom~combout\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inputbottom~combout\(2),
	datac => \inputbottom~combout\(0),
	datad => \inputbottom~combout\(1),
	combout => \money1[0]~2_combout\);

-- Location: LCCOMB_X8_Y11_N22
\Selector30~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector30~0_combout\ = (\money0[2]~reg0_regout\ & (!\LessThan0~2_combout\ & ((\money1[0]~2_combout\) # (!\inputbottom~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \money0[2]~reg0_regout\,
	datab => \LessThan0~2_combout\,
	datac => \inputbottom~combout\(3),
	datad => \money1[0]~2_combout\,
	combout => \Selector30~0_combout\);

-- Location: LCFF_X8_Y11_N23
\money1[2]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector30~0_combout\,
	sclr => \state.s2~regout\,
	ena => \money1[0]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \money1[2]~reg0_regout\);

-- Location: LCCOMB_X9_Y8_N10
\money1~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \money1~5_combout\ = (\LessThan0~2_combout\) # (\money0[1]~reg0_regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~2_combout\,
	datac => \money0[1]~reg0_regout\,
	combout => \money1~5_combout\);

-- Location: LCCOMB_X9_Y8_N30
\Selector2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = (!\inputbottom~combout\(3) & ((\LessThan0~2_combout\) # (\money0[1]~reg0_regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~2_combout\,
	datac => \money0[1]~reg0_regout\,
	datad => \inputbottom~combout\(3),
	combout => \Selector2~0_combout\);

-- Location: LCCOMB_X8_Y8_N4
\time1[2]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \time1[2]~1_combout\ = (\money1[0]~2_combout\ & (\money1~5_combout\)) # (!\money1[0]~2_combout\ & ((\Selector2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \money1[0]~2_combout\,
	datac => \money1~5_combout\,
	datad => \Selector2~0_combout\,
	combout => \time1[2]~1_combout\);

-- Location: LCFF_X8_Y9_N17
\money1[1]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \time1[2]~1_combout\,
	sclr => \state.s2~regout\,
	sload => VCC,
	ena => \money1[0]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \money1[1]~reg0_regout\);

-- Location: LCCOMB_X8_Y11_N10
\Add3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add3~1_combout\ = \money1[3]~reg0_regout\ $ (\money1[1]~reg0_regout\ $ (((\money1[0]~reg0_regout\ & \money1[2]~reg0_regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001010101101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \money1[3]~reg0_regout\,
	datab => \money1[0]~reg0_regout\,
	datac => \money1[2]~reg0_regout\,
	datad => \money1[1]~reg0_regout\,
	combout => \Add3~1_combout\);

-- Location: LCCOMB_X8_Y9_N0
\Selector34~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector34~0_combout\ = (\inputbottom~combout\(2) & (!\state.s2~regout\ & (\money1[3]~6_combout\ & !\LessThan0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inputbottom~combout\(2),
	datab => \state.s2~regout\,
	datac => \money1[3]~6_combout\,
	datad => \LessThan0~2_combout\,
	combout => \Selector34~0_combout\);

-- Location: LCFF_X8_Y9_N1
\money0[2]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector34~0_combout\,
	ena => \money1[0]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \money0[2]~reg0_regout\);

-- Location: LCCOMB_X8_Y11_N0
\timer[2]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \timer[2]~5_combout\ = (\money0[1]~reg0_regout\ & (\money1[0]~reg0_regout\ $ (VCC))) # (!\money0[1]~reg0_regout\ & (\money1[0]~reg0_regout\ & VCC))
-- \timer[2]~6\ = CARRY((\money0[1]~reg0_regout\ & \money1[0]~reg0_regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \money0[1]~reg0_regout\,
	datab => \money1[0]~reg0_regout\,
	datad => VCC,
	combout => \timer[2]~5_combout\,
	cout => \timer[2]~6\);

-- Location: LCCOMB_X8_Y11_N2
\timer[3]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \timer[3]~7_combout\ = (\money1[1]~reg0_regout\ & ((\money0[2]~reg0_regout\ & (\timer[2]~6\ & VCC)) # (!\money0[2]~reg0_regout\ & (!\timer[2]~6\)))) # (!\money1[1]~reg0_regout\ & ((\money0[2]~reg0_regout\ & (!\timer[2]~6\)) # (!\money0[2]~reg0_regout\ & 
-- ((\timer[2]~6\) # (GND)))))
-- \timer[3]~8\ = CARRY((\money1[1]~reg0_regout\ & (!\money0[2]~reg0_regout\ & !\timer[2]~6\)) # (!\money1[1]~reg0_regout\ & ((!\timer[2]~6\) # (!\money0[2]~reg0_regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \money1[1]~reg0_regout\,
	datab => \money0[2]~reg0_regout\,
	datad => VCC,
	cin => \timer[2]~6\,
	combout => \timer[3]~7_combout\,
	cout => \timer[3]~8\);

-- Location: LCCOMB_X8_Y11_N4
\timer[4]~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \timer[4]~9_combout\ = ((\Add3~0_combout\ $ (\money0[3]~reg0_regout\ $ (!\timer[3]~8\)))) # (GND)
-- \timer[4]~10\ = CARRY((\Add3~0_combout\ & ((\money0[3]~reg0_regout\) # (!\timer[3]~8\))) # (!\Add3~0_combout\ & (\money0[3]~reg0_regout\ & !\timer[3]~8\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~0_combout\,
	datab => \money0[3]~reg0_regout\,
	datad => VCC,
	cin => \timer[3]~8\,
	combout => \timer[4]~9_combout\,
	cout => \timer[4]~10\);

-- Location: LCCOMB_X8_Y11_N6
\timer[5]~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \timer[5]~11_combout\ = \timer[4]~10\ $ (\Add3~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \Add3~1_combout\,
	cin => \timer[4]~10\,
	combout => \timer[5]~11_combout\);

-- Location: LCFF_X8_Y11_N7
\timer[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \timer[5]~11_combout\,
	ena => \ALT_INV_count10s[8]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => timer(5));

-- Location: LCFF_X8_Y11_N1
\timer[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \timer[2]~5_combout\,
	ena => \ALT_INV_count10s[8]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => timer(2));

-- Location: LCCOMB_X12_Y9_N22
\timer[1]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \timer[1]~4_combout\ = (\state.s1~regout\ & ((\ispressed~combout\ & ((timer(1)))) # (!\ispressed~combout\ & (\money0[0]~reg0_regout\)))) # (!\state.s1~regout\ & (((timer(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \money0[0]~reg0_regout\,
	datab => \state.s1~regout\,
	datac => timer(1),
	datad => \ispressed~combout\,
	combout => \timer[1]~4_combout\);

-- Location: LCFF_X12_Y9_N23
\timer[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \timer[1]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => timer(1));

-- Location: LCCOMB_X10_Y11_N24
\Mult0|mult_core|romout[0][5]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][5]~0_combout\ = timer(2) $ (((!timer(3) & timer(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => timer(3),
	datab => timer(2),
	datad => timer(1),
	combout => \Mult0|mult_core|romout[0][5]~0_combout\);

-- Location: LCCOMB_X14_Y11_N12
\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~0_combout\ = (timer(4) & (\Mult0|mult_core|romout[0][5]~0_combout\ $ (VCC))) # (!timer(4) & (\Mult0|mult_core|romout[0][5]~0_combout\ & VCC))
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1\ = CARRY((timer(4) & \Mult0|mult_core|romout[0][5]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => timer(4),
	datab => \Mult0|mult_core|romout[0][5]~0_combout\,
	datad => VCC,
	combout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~0_combout\,
	cout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1\);

-- Location: LCCOMB_X14_Y11_N14
\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~2_combout\ = (\Mult0|mult_core|romout[0][6]~1_combout\ & ((timer(5) & (\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1\ & VCC)) # (!timer(5) & 
-- (!\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1\)))) # (!\Mult0|mult_core|romout[0][6]~1_combout\ & ((timer(5) & (!\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1\)) # (!timer(5) & ((\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1\) 
-- # (GND)))))
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~3\ = CARRY((\Mult0|mult_core|romout[0][6]~1_combout\ & (!timer(5) & !\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1\)) # (!\Mult0|mult_core|romout[0][6]~1_combout\ & 
-- ((!\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1\) # (!timer(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|mult_core|romout[0][6]~1_combout\,
	datab => timer(5),
	datad => VCC,
	cin => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~1\,
	combout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~2_combout\,
	cout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~3\);

-- Location: LCCOMB_X14_Y11_N4
\Selector22~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector22~0_combout\ = (\state.s1~regout\ & ((\ispressed~combout\ & ((charge_time(6)))) # (!\ispressed~combout\ & (\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.s1~regout\,
	datab => \ispressed~combout\,
	datac => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~2_combout\,
	datad => charge_time(6),
	combout => \Selector22~0_combout\);

-- Location: LCCOMB_X13_Y11_N28
\Selector23~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector23~0_combout\ = (\state.s1~regout\ & ((\ispressed~combout\ & (charge_time(5))) # (!\ispressed~combout\ & ((\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.s1~regout\,
	datab => \ispressed~combout\,
	datac => charge_time(5),
	datad => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~0_combout\,
	combout => \Selector23~0_combout\);

-- Location: LCCOMB_X13_Y11_N18
\Selector23~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector23~1_combout\ = (\Selector23~0_combout\) # ((\Add6~10_combout\ & \state.s2~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add6~10_combout\,
	datac => \state.s2~regout\,
	datad => \Selector23~0_combout\,
	combout => \Selector23~1_combout\);

-- Location: LCFF_X15_Y10_N5
\charge_time[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \Selector23~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => charge_time(5));

-- Location: LCFF_X8_Y11_N3
\timer[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \timer[3]~7_combout\,
	ena => \ALT_INV_count10s[8]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => timer(3));

-- Location: LCCOMB_X10_Y11_N26
\Selector24~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector24~0_combout\ = (\ispressed~combout\ & (((charge_time(4))))) # (!\ispressed~combout\ & (timer(1) $ (((timer(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000111100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => timer(1),
	datab => \ispressed~combout\,
	datac => charge_time(4),
	datad => timer(3),
	combout => \Selector24~0_combout\);

-- Location: LCCOMB_X10_Y11_N16
\Selector24~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector24~1_combout\ = (\Add6~8_combout\ & ((\state.s2~regout\) # ((\state.s1~regout\ & \Selector24~0_combout\)))) # (!\Add6~8_combout\ & (((\state.s1~regout\ & \Selector24~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add6~8_combout\,
	datab => \state.s2~regout\,
	datac => \state.s1~regout\,
	datad => \Selector24~0_combout\,
	combout => \Selector24~1_combout\);

-- Location: LCFF_X10_Y11_N17
\charge_time[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector24~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => charge_time(4));

-- Location: LCCOMB_X12_Y9_N28
\Selector26~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector26~0_combout\ = (\state.s1~regout\ & ((\ispressed~combout\ & ((charge_time(2)))) # (!\ispressed~combout\ & (timer(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ispressed~combout\,
	datab => timer(1),
	datac => charge_time(2),
	datad => \state.s1~regout\,
	combout => \Selector26~0_combout\);

-- Location: LCCOMB_X12_Y11_N0
\Add6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add6~0_combout\ = (\Selector43~0_combout\ & (charge_time(0) & VCC)) # (!\Selector43~0_combout\ & (charge_time(0) $ (VCC)))
-- \Add6~1\ = CARRY((!\Selector43~0_combout\ & charge_time(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector43~0_combout\,
	datab => charge_time(0),
	datad => VCC,
	combout => \Add6~0_combout\,
	cout => \Add6~1\);

-- Location: LCCOMB_X12_Y11_N30
\Selector28~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector28~0_combout\ = (\Selector27~0_combout\ & ((charge_time(0)) # ((\state.s2~regout\ & \Add6~0_combout\)))) # (!\Selector27~0_combout\ & (\state.s2~regout\ & ((\Add6~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector27~0_combout\,
	datab => \state.s2~regout\,
	datac => charge_time(0),
	datad => \Add6~0_combout\,
	combout => \Selector28~0_combout\);

-- Location: LCFF_X12_Y11_N31
\charge_time[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector28~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => charge_time(0));

-- Location: LCCOMB_X12_Y11_N2
\Add6~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add6~2_combout\ = (\Selector43~0_combout\ & ((charge_time(1) & (!\Add6~1\)) # (!charge_time(1) & ((\Add6~1\) # (GND))))) # (!\Selector43~0_combout\ & ((charge_time(1) & (\Add6~1\ & VCC)) # (!charge_time(1) & (!\Add6~1\))))
-- \Add6~3\ = CARRY((\Selector43~0_combout\ & ((!\Add6~1\) # (!charge_time(1)))) # (!\Selector43~0_combout\ & (!charge_time(1) & !\Add6~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Selector43~0_combout\,
	datab => charge_time(1),
	datad => VCC,
	cin => \Add6~1\,
	combout => \Add6~2_combout\,
	cout => \Add6~3\);

-- Location: LCCOMB_X12_Y11_N28
\Selector27~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector27~1_combout\ = (\Selector27~0_combout\ & ((charge_time(1)) # ((\state.s2~regout\ & \Add6~2_combout\)))) # (!\Selector27~0_combout\ & (\state.s2~regout\ & ((\Add6~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector27~0_combout\,
	datab => \state.s2~regout\,
	datac => charge_time(1),
	datad => \Add6~2_combout\,
	combout => \Selector27~1_combout\);

-- Location: LCFF_X12_Y11_N29
\charge_time[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector27~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => charge_time(1));

-- Location: LCCOMB_X12_Y11_N4
\Add6~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add6~4_combout\ = ((\Selector43~0_combout\ $ (charge_time(2) $ (\Add6~3\)))) # (GND)
-- \Add6~5\ = CARRY((\Selector43~0_combout\ & (charge_time(2) & !\Add6~3\)) # (!\Selector43~0_combout\ & ((charge_time(2)) # (!\Add6~3\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Selector43~0_combout\,
	datab => charge_time(2),
	datad => VCC,
	cin => \Add6~3\,
	combout => \Add6~4_combout\,
	cout => \Add6~5\);

-- Location: LCCOMB_X12_Y9_N0
\Selector26~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector26~1_combout\ = (\Selector26~0_combout\) # ((\state.s2~regout\ & \Add6~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector26~0_combout\,
	datac => \state.s2~regout\,
	datad => \Add6~4_combout\,
	combout => \Selector26~1_combout\);

-- Location: LCFF_X12_Y9_N1
\charge_time[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector26~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => charge_time(2));

-- Location: LCCOMB_X12_Y11_N6
\Add6~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add6~6_combout\ = (\Selector43~0_combout\ & ((charge_time(3) & (!\Add6~5\)) # (!charge_time(3) & ((\Add6~5\) # (GND))))) # (!\Selector43~0_combout\ & ((charge_time(3) & (\Add6~5\ & VCC)) # (!charge_time(3) & (!\Add6~5\))))
-- \Add6~7\ = CARRY((\Selector43~0_combout\ & ((!\Add6~5\) # (!charge_time(3)))) # (!\Selector43~0_combout\ & (!charge_time(3) & !\Add6~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Selector43~0_combout\,
	datab => charge_time(3),
	datad => VCC,
	cin => \Add6~5\,
	combout => \Add6~6_combout\,
	cout => \Add6~7\);

-- Location: LCCOMB_X12_Y9_N6
\Selector25~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector25~1_combout\ = (\Selector25~0_combout\) # ((\state.s2~regout\ & \Add6~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector25~0_combout\,
	datac => \state.s2~regout\,
	datad => \Add6~6_combout\,
	combout => \Selector25~1_combout\);

-- Location: LCFF_X12_Y9_N7
\charge_time[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector25~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => charge_time(3));

-- Location: LCCOMB_X12_Y11_N12
\Add6~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add6~12_combout\ = ((\Selector43~0_combout\ $ (charge_time(6) $ (\Add6~11\)))) # (GND)
-- \Add6~13\ = CARRY((\Selector43~0_combout\ & (charge_time(6) & !\Add6~11\)) # (!\Selector43~0_combout\ & ((charge_time(6)) # (!\Add6~11\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Selector43~0_combout\,
	datab => charge_time(6),
	datad => VCC,
	cin => \Add6~11\,
	combout => \Add6~12_combout\,
	cout => \Add6~13\);

-- Location: LCCOMB_X14_Y11_N2
\Selector22~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector22~1_combout\ = (\Selector22~0_combout\) # ((\state.s2~regout\ & \Add6~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector22~0_combout\,
	datac => \state.s2~regout\,
	datad => \Add6~12_combout\,
	combout => \Selector22~1_combout\);

-- Location: LCFF_X15_Y10_N19
\charge_time[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \Selector22~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => charge_time(6));

-- Location: LCCOMB_X12_Y11_N14
\Add6~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add6~14_combout\ = (charge_time(7) & ((\Selector43~0_combout\ & (!\Add6~13\)) # (!\Selector43~0_combout\ & (\Add6~13\ & VCC)))) # (!charge_time(7) & ((\Selector43~0_combout\ & ((\Add6~13\) # (GND))) # (!\Selector43~0_combout\ & (!\Add6~13\))))
-- \Add6~15\ = CARRY((charge_time(7) & (\Selector43~0_combout\ & !\Add6~13\)) # (!charge_time(7) & ((\Selector43~0_combout\) # (!\Add6~13\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => charge_time(7),
	datab => \Selector43~0_combout\,
	datad => VCC,
	cin => \Add6~13\,
	combout => \Add6~14_combout\,
	cout => \Add6~15\);

-- Location: LCCOMB_X12_Y11_N16
\Add6~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add6~16_combout\ = ((charge_time(8) $ (\Selector43~0_combout\ $ (\Add6~15\)))) # (GND)
-- \Add6~17\ = CARRY((charge_time(8) & ((!\Add6~15\) # (!\Selector43~0_combout\))) # (!charge_time(8) & (!\Selector43~0_combout\ & !\Add6~15\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => charge_time(8),
	datab => \Selector43~0_combout\,
	datad => VCC,
	cin => \Add6~15\,
	combout => \Add6~16_combout\,
	cout => \Add6~17\);

-- Location: LCCOMB_X12_Y11_N18
\Add6~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add6~18_combout\ = (charge_time(9) & ((\Selector43~0_combout\ & (!\Add6~17\)) # (!\Selector43~0_combout\ & (\Add6~17\ & VCC)))) # (!charge_time(9) & ((\Selector43~0_combout\ & ((\Add6~17\) # (GND))) # (!\Selector43~0_combout\ & (!\Add6~17\))))
-- \Add6~19\ = CARRY((charge_time(9) & (\Selector43~0_combout\ & !\Add6~17\)) # (!charge_time(9) & ((\Selector43~0_combout\) # (!\Add6~17\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => charge_time(9),
	datab => \Selector43~0_combout\,
	datad => VCC,
	cin => \Add6~17\,
	combout => \Add6~18_combout\,
	cout => \Add6~19\);

-- Location: LCFF_X8_Y11_N5
\timer[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \timer[4]~9_combout\,
	ena => \ALT_INV_count10s[8]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => timer(4));

-- Location: LCCOMB_X14_Y11_N0
\Mult0|mult_core|romout[1][5]\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[1][5]~combout\ = (timer(5)) # (timer(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => timer(5),
	datad => timer(4),
	combout => \Mult0|mult_core|romout[1][5]~combout\);

-- Location: LCCOMB_X10_Y11_N0
\Mult0|mult_core|romout[0][8]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|romout[0][8]~2_combout\ = (timer(3)) # ((timer(2)) # (timer(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => timer(3),
	datab => timer(2),
	datad => timer(1),
	combout => \Mult0|mult_core|romout[0][8]~2_combout\);

-- Location: LCCOMB_X14_Y11_N16
\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~4_combout\ = ((timer(4) $ (\Mult0|mult_core|romout[0][8]~2_combout\ $ (!\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~3\)))) # (GND)
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\ = CARRY((timer(4) & ((\Mult0|mult_core|romout[0][8]~2_combout\) # (!\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~3\))) # (!timer(4) & (\Mult0|mult_core|romout[0][8]~2_combout\ & 
-- !\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => timer(4),
	datab => \Mult0|mult_core|romout[0][8]~2_combout\,
	datad => VCC,
	cin => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~3\,
	combout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~4_combout\,
	cout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\);

-- Location: LCCOMB_X14_Y11_N18
\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_combout\ = (\Mult0|mult_core|romout[1][4]~3_combout\ & ((\Mult0|mult_core|romout[0][8]~2_combout\ & (\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\ & VCC)) # 
-- (!\Mult0|mult_core|romout[0][8]~2_combout\ & (!\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\)))) # (!\Mult0|mult_core|romout[1][4]~3_combout\ & ((\Mult0|mult_core|romout[0][8]~2_combout\ & 
-- (!\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\)) # (!\Mult0|mult_core|romout[0][8]~2_combout\ & ((\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\) # (GND)))))
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~7\ = CARRY((\Mult0|mult_core|romout[1][4]~3_combout\ & (!\Mult0|mult_core|romout[0][8]~2_combout\ & !\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\)) # 
-- (!\Mult0|mult_core|romout[1][4]~3_combout\ & ((!\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\) # (!\Mult0|mult_core|romout[0][8]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|mult_core|romout[1][4]~3_combout\,
	datab => \Mult0|mult_core|romout[0][8]~2_combout\,
	datad => VCC,
	cin => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~5\,
	combout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_combout\,
	cout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~7\);

-- Location: LCCOMB_X14_Y11_N20
\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~8_combout\ = ((\Mult0|mult_core|romout[0][9]~4_combout\ $ (\Mult0|mult_core|romout[1][5]~combout\ $ (!\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~7\)))) # (GND)
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\ = CARRY((\Mult0|mult_core|romout[0][9]~4_combout\ & ((\Mult0|mult_core|romout[1][5]~combout\) # (!\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~7\))) # 
-- (!\Mult0|mult_core|romout[0][9]~4_combout\ & (\Mult0|mult_core|romout[1][5]~combout\ & !\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|mult_core|romout[0][9]~4_combout\,
	datab => \Mult0|mult_core|romout[1][5]~combout\,
	datad => VCC,
	cin => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~7\,
	combout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~8_combout\,
	cout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~9\);

-- Location: LCCOMB_X13_Y11_N8
\Selector19~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector19~0_combout\ = (\state.s1~regout\ & ((\ispressed~combout\ & (charge_time(9))) # (!\ispressed~combout\ & ((\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~8_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.s1~regout\,
	datab => \ispressed~combout\,
	datac => charge_time(9),
	datad => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~8_combout\,
	combout => \Selector19~0_combout\);

-- Location: LCCOMB_X12_Y9_N4
\Selector19~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector19~1_combout\ = (\Selector19~0_combout\) # ((\Add6~18_combout\ & \state.s2~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add6~18_combout\,
	datac => \state.s2~regout\,
	datad => \Selector19~0_combout\,
	combout => \Selector19~1_combout\);

-- Location: LCFF_X12_Y9_N5
\charge_time[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector19~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => charge_time(9));

-- Location: LCCOMB_X12_Y11_N22
\Add6~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add6~22_combout\ = (charge_time(11) & ((\Selector43~0_combout\ & (!\Add6~21\)) # (!\Selector43~0_combout\ & (\Add6~21\ & VCC)))) # (!charge_time(11) & ((\Selector43~0_combout\ & ((\Add6~21\) # (GND))) # (!\Selector43~0_combout\ & (!\Add6~21\))))
-- \Add6~23\ = CARRY((charge_time(11) & (\Selector43~0_combout\ & !\Add6~21\)) # (!charge_time(11) & ((\Selector43~0_combout\) # (!\Add6~21\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => charge_time(11),
	datab => \Selector43~0_combout\,
	datad => VCC,
	cin => \Add6~21\,
	combout => \Add6~22_combout\,
	cout => \Add6~23\);

-- Location: LCCOMB_X14_Y11_N10
\Selector17~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector17~0_combout\ = (\state.s1~regout\ & ((\ispressed~combout\ & ((charge_time(11)))) # (!\ispressed~combout\ & (\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~12_combout\,
	datab => \ispressed~combout\,
	datac => charge_time(11),
	datad => \state.s1~regout\,
	combout => \Selector17~0_combout\);

-- Location: LCCOMB_X15_Y11_N26
\Selector17~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector17~1_combout\ = (\Selector17~0_combout\) # ((\Add6~22_combout\ & \state.s2~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add6~22_combout\,
	datac => \state.s2~regout\,
	datad => \Selector17~0_combout\,
	combout => \Selector17~1_combout\);

-- Location: LCFF_X15_Y9_N9
\charge_time[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \Selector17~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => charge_time(11));

-- Location: LCCOMB_X12_Y9_N30
\LessThan2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan2~2_combout\ = (!charge_time(10) & (!charge_time(8) & (!charge_time(9) & !charge_time(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => charge_time(10),
	datab => charge_time(8),
	datac => charge_time(9),
	datad => charge_time(11),
	combout => \LessThan2~2_combout\);

-- Location: LCCOMB_X12_Y11_N24
\Add6~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add6~24_combout\ = ((charge_time(12) $ (\Selector43~0_combout\ $ (\Add6~23\)))) # (GND)
-- \Add6~25\ = CARRY((charge_time(12) & ((!\Add6~23\) # (!\Selector43~0_combout\))) # (!charge_time(12) & (!\Selector43~0_combout\ & !\Add6~23\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => charge_time(12),
	datab => \Selector43~0_combout\,
	datad => VCC,
	cin => \Add6~23\,
	combout => \Add6~24_combout\,
	cout => \Add6~25\);

-- Location: LCCOMB_X14_Y11_N26
\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14_combout\ = (\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13\ & ((timer(4)) # ((!timer(5))))) # (!\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13\ & (((!timer(4) & timer(5))) # (GND)))
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~15\ = CARRY((timer(4)) # ((!\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13\) # (!timer(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010010111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => timer(4),
	datab => timer(5),
	datad => VCC,
	cin => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~13\,
	combout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14_combout\,
	cout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~15\);

-- Location: LCCOMB_X13_Y11_N0
\Selector16~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector16~0_combout\ = (\state.s1~regout\ & ((\ispressed~combout\ & ((charge_time(12)))) # (!\ispressed~combout\ & (\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.s1~regout\,
	datab => \ispressed~combout\,
	datac => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~14_combout\,
	datad => charge_time(12),
	combout => \Selector16~0_combout\);

-- Location: LCCOMB_X13_Y11_N30
\Selector16~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector16~1_combout\ = (\Selector16~0_combout\) # ((\Add6~24_combout\ & \state.s2~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add6~24_combout\,
	datac => \state.s2~regout\,
	datad => \Selector16~0_combout\,
	combout => \Selector16~1_combout\);

-- Location: LCFF_X15_Y9_N11
\charge_time[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \Selector16~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => charge_time(12));

-- Location: LCCOMB_X14_Y11_N8
\Selector21~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector21~0_combout\ = (\state.s1~regout\ & ((\ispressed~combout\ & (charge_time(7))) # (!\ispressed~combout\ & ((\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.s1~regout\,
	datab => charge_time(7),
	datac => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~4_combout\,
	datad => \ispressed~combout\,
	combout => \Selector21~0_combout\);

-- Location: LCCOMB_X15_Y11_N28
\Selector21~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector21~1_combout\ = (\Selector21~0_combout\) # ((\Add6~14_combout\ & \state.s2~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add6~14_combout\,
	datac => \state.s2~regout\,
	datad => \Selector21~0_combout\,
	combout => \Selector21~1_combout\);

-- Location: LCFF_X15_Y9_N5
\charge_time[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \Selector21~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => charge_time(7));

-- Location: LCCOMB_X12_Y9_N26
\LessThan2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan2~1_combout\ = (\LessThan2~0_combout\) # (((!charge_time(6)) # (!charge_time(5))) # (!charge_time(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~0_combout\,
	datab => charge_time(7),
	datac => charge_time(5),
	datad => charge_time(6),
	combout => \LessThan2~1_combout\);

-- Location: LCCOMB_X12_Y9_N16
\LessThan2~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan2~3_combout\ = (!charge_time(13) & (\LessThan2~2_combout\ & (!charge_time(12) & \LessThan2~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => charge_time(13),
	datab => \LessThan2~2_combout\,
	datac => charge_time(12),
	datad => \LessThan2~1_combout\,
	combout => \LessThan2~3_combout\);

-- Location: LCCOMB_X10_Y8_N12
\Selector45~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector45~1_combout\ = (\Selector45~0_combout\) # ((!\LessThan2~3_combout\ & (\charge_start~regout\ & \state.s2~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector45~0_combout\,
	datab => \LessThan2~3_combout\,
	datac => \charge_start~regout\,
	datad => \state.s2~regout\,
	combout => \Selector45~1_combout\);

-- Location: LCFF_X10_Y8_N13
charge_start : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector45~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \charge_start~regout\);

-- Location: LCCOMB_X12_Y8_N8
\Selector43~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector43~0_combout\ = (\LessThan2~3_combout\) # (!\charge_start~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \LessThan2~3_combout\,
	datad => \charge_start~regout\,
	combout => \Selector43~0_combout\);

-- Location: LCCOMB_X14_Y11_N6
\Selector20~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector20~0_combout\ = (\state.s1~regout\ & ((\ispressed~combout\ & (charge_time(8))) # (!\ispressed~combout\ & ((\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.s1~regout\,
	datab => \ispressed~combout\,
	datac => charge_time(8),
	datad => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~6_combout\,
	combout => \Selector20~0_combout\);

-- Location: LCCOMB_X17_Y9_N8
\Selector20~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector20~1_combout\ = (\Selector20~0_combout\) # ((\Add6~16_combout\ & \state.s2~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add6~16_combout\,
	datac => \state.s2~regout\,
	datad => \Selector20~0_combout\,
	combout => \Selector20~1_combout\);

-- Location: LCFF_X17_Y9_N9
\charge_time[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector20~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => charge_time(8));

-- Location: LCCOMB_X15_Y9_N18
\Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\ = (charge_time(8) & (\Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~1\ & VCC)) # (!charge_time(8) & (!\Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~1\))
-- \Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~3\ = CARRY((!charge_time(8) & !\Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => charge_time(8),
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~1\,
	combout => \Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~3\);

-- Location: LCCOMB_X12_Y11_N26
\Add6~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add6~26_combout\ = charge_time(13) $ (\Add6~25\ $ (!\Selector43~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => charge_time(13),
	datad => \Selector43~0_combout\,
	cin => \Add6~25\,
	combout => \Add6~26_combout\);

-- Location: LCCOMB_X14_Y11_N28
\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~16_combout\ = \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~15\ $ (((!timer(4)) # (!timer(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => timer(5),
	datad => timer(4),
	cin => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~15\,
	combout => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~16_combout\);

-- Location: LCCOMB_X13_Y11_N12
\Selector15~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector15~0_combout\ = (\state.s1~regout\ & ((\ispressed~combout\ & (charge_time(13))) # (!\ispressed~combout\ & ((\Mult0|mult_core|padder|adder[0]|auto_generated|op_1~16_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => charge_time(13),
	datab => \Mult0|mult_core|padder|adder[0]|auto_generated|op_1~16_combout\,
	datac => \ispressed~combout\,
	datad => \state.s1~regout\,
	combout => \Selector15~0_combout\);

-- Location: LCCOMB_X13_Y11_N26
\Selector15~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector15~1_combout\ = (\Selector15~0_combout\) # ((\Add6~26_combout\ & \state.s2~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add6~26_combout\,
	datac => \state.s2~regout\,
	datad => \Selector15~0_combout\,
	combout => \Selector15~1_combout\);

-- Location: LCFF_X15_Y9_N1
\charge_time[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \Selector15~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => charge_time(13));

-- Location: LCCOMB_X15_Y9_N20
\Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~4_combout\ = (charge_time(9) & (\Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~3\ $ (GND))) # (!charge_time(9) & (!\Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~3\ & 
-- VCC))
-- \Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~5\ = CARRY((charge_time(9) & !\Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => charge_time(9),
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~3\,
	combout => \Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~4_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~5\);

-- Location: LCCOMB_X15_Y9_N22
\Div0|auto_generated|divider|divider|add_sub_7_result_int[4]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_7_result_int[4]~6_combout\ = (charge_time(10) & (!\Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~5\)) # (!charge_time(10) & ((\Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~5\) # 
-- (GND)))
-- \Div0|auto_generated|divider|divider|add_sub_7_result_int[4]~7\ = CARRY((!\Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~5\) # (!charge_time(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => charge_time(10),
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~5\,
	combout => \Div0|auto_generated|divider|divider|add_sub_7_result_int[4]~6_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_7_result_int[4]~7\);

-- Location: LCCOMB_X15_Y9_N30
\Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\ = !\Div0|auto_generated|divider|divider|add_sub_7_result_int[7]~13\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div0|auto_generated|divider|divider|add_sub_7_result_int[7]~13\,
	combout => \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\);

-- Location: LCCOMB_X14_Y9_N28
\Div0|auto_generated|divider|divider|StageOut[70]~120\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[70]~120_combout\ = (charge_time(13) & \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => charge_time(13),
	datad => \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[70]~120_combout\);

-- Location: LCCOMB_X14_Y9_N22
\Div0|auto_generated|divider|divider|StageOut[69]~122\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[69]~122_combout\ = (charge_time(12) & \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => charge_time(12),
	datad => \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[69]~122_combout\);

-- Location: LCCOMB_X14_Y9_N26
\Div0|auto_generated|divider|divider|StageOut[68]~124\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[68]~124_combout\ = (charge_time(11) & \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => charge_time(11),
	datad => \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[68]~124_combout\);

-- Location: LCCOMB_X15_Y9_N12
\Div0|auto_generated|divider|divider|StageOut[67]~126\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[67]~126_combout\ = (charge_time(10) & \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => charge_time(10),
	datad => \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[67]~126_combout\);

-- Location: LCCOMB_X15_Y9_N0
\Div0|auto_generated|divider|divider|StageOut[66]~129\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[66]~129_combout\ = (\Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~4_combout\ & !\Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~4_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[66]~129_combout\);

-- Location: LCCOMB_X17_Y9_N26
\Div0|auto_generated|divider|divider|StageOut[65]~130\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[65]~130_combout\ = (charge_time(8) & \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => charge_time(8),
	datad => \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[65]~130_combout\);

-- Location: LCCOMB_X15_Y9_N8
\Div0|auto_generated|divider|divider|StageOut[64]~133\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[64]~133_combout\ = (\Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\ & !\Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[64]~133_combout\);

-- Location: LCCOMB_X15_Y10_N18
\Div0|auto_generated|divider|divider|StageOut[63]~135\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[63]~135_combout\ = (charge_time(6) & !\Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => charge_time(6),
	datad => \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[63]~135_combout\);

-- Location: LCCOMB_X14_Y9_N4
\Div0|auto_generated|divider|divider|add_sub_8_result_int[1]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_8_result_int[1]~0_combout\ = (((\Div0|auto_generated|divider|divider|StageOut[63]~134_combout\) # (\Div0|auto_generated|divider|divider|StageOut[63]~135_combout\)))
-- \Div0|auto_generated|divider|divider|add_sub_8_result_int[1]~1\ = CARRY((\Div0|auto_generated|divider|divider|StageOut[63]~134_combout\) # (\Div0|auto_generated|divider|divider|StageOut[63]~135_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[63]~134_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[63]~135_combout\,
	datad => VCC,
	combout => \Div0|auto_generated|divider|divider|add_sub_8_result_int[1]~0_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_8_result_int[1]~1\);

-- Location: LCCOMB_X14_Y9_N6
\Div0|auto_generated|divider|divider|add_sub_8_result_int[2]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_8_result_int[2]~2_combout\ = (\Div0|auto_generated|divider|divider|add_sub_8_result_int[1]~1\ & (((\Div0|auto_generated|divider|divider|StageOut[64]~132_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[64]~133_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_8_result_int[1]~1\ & (!\Div0|auto_generated|divider|divider|StageOut[64]~132_combout\ & 
-- (!\Div0|auto_generated|divider|divider|StageOut[64]~133_combout\)))
-- \Div0|auto_generated|divider|divider|add_sub_8_result_int[2]~3\ = CARRY((!\Div0|auto_generated|divider|divider|StageOut[64]~132_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[64]~133_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_8_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[64]~132_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[64]~133_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_8_result_int[1]~1\,
	combout => \Div0|auto_generated|divider|divider|add_sub_8_result_int[2]~2_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_8_result_int[2]~3\);

-- Location: LCCOMB_X14_Y9_N10
\Div0|auto_generated|divider|divider|add_sub_8_result_int[4]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_8_result_int[4]~6_combout\ = (\Div0|auto_generated|divider|divider|StageOut[66]~128_combout\ & (((!\Div0|auto_generated|divider|divider|add_sub_8_result_int[3]~5\)))) # 
-- (!\Div0|auto_generated|divider|divider|StageOut[66]~128_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[66]~129_combout\ & (!\Div0|auto_generated|divider|divider|add_sub_8_result_int[3]~5\)) # 
-- (!\Div0|auto_generated|divider|divider|StageOut[66]~129_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_8_result_int[3]~5\) # (GND)))))
-- \Div0|auto_generated|divider|divider|add_sub_8_result_int[4]~7\ = CARRY(((!\Div0|auto_generated|divider|divider|StageOut[66]~128_combout\ & !\Div0|auto_generated|divider|divider|StageOut[66]~129_combout\)) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_8_result_int[3]~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[66]~128_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[66]~129_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_8_result_int[3]~5\,
	combout => \Div0|auto_generated|divider|divider|add_sub_8_result_int[4]~6_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_8_result_int[4]~7\);

-- Location: LCCOMB_X14_Y9_N12
\Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\ = (\Div0|auto_generated|divider|divider|add_sub_8_result_int[4]~7\ & (((\Div0|auto_generated|divider|divider|StageOut[67]~127_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[67]~126_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_8_result_int[4]~7\ & ((((\Div0|auto_generated|divider|divider|StageOut[67]~127_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[67]~126_combout\)))))
-- \Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~9\ = CARRY((!\Div0|auto_generated|divider|divider|add_sub_8_result_int[4]~7\ & ((\Div0|auto_generated|divider|divider|StageOut[67]~127_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[67]~126_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[67]~127_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[67]~126_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_8_result_int[4]~7\,
	combout => \Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~9\);

-- Location: LCCOMB_X14_Y9_N14
\Div0|auto_generated|divider|divider|add_sub_8_result_int[6]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_8_result_int[6]~10_combout\ = (\Div0|auto_generated|divider|divider|StageOut[68]~125_combout\ & (((!\Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~9\)))) # 
-- (!\Div0|auto_generated|divider|divider|StageOut[68]~125_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[68]~124_combout\ & (!\Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~9\)) # 
-- (!\Div0|auto_generated|divider|divider|StageOut[68]~124_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~9\) # (GND)))))
-- \Div0|auto_generated|divider|divider|add_sub_8_result_int[6]~11\ = CARRY(((!\Div0|auto_generated|divider|divider|StageOut[68]~125_combout\ & !\Div0|auto_generated|divider|divider|StageOut[68]~124_combout\)) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[68]~125_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[68]~124_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~9\,
	combout => \Div0|auto_generated|divider|divider|add_sub_8_result_int[6]~10_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_8_result_int[6]~11\);

-- Location: LCCOMB_X14_Y9_N16
\Div0|auto_generated|divider|divider|add_sub_8_result_int[7]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_8_result_int[7]~12_combout\ = (\Div0|auto_generated|divider|divider|add_sub_8_result_int[6]~11\ & (((\Div0|auto_generated|divider|divider|StageOut[69]~123_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[69]~122_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_8_result_int[6]~11\ & ((((\Div0|auto_generated|divider|divider|StageOut[69]~123_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[69]~122_combout\)))))
-- \Div0|auto_generated|divider|divider|add_sub_8_result_int[7]~13\ = CARRY((!\Div0|auto_generated|divider|divider|add_sub_8_result_int[6]~11\ & ((\Div0|auto_generated|divider|divider|StageOut[69]~123_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[69]~122_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[69]~123_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[69]~122_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_8_result_int[6]~11\,
	combout => \Div0|auto_generated|divider|divider|add_sub_8_result_int[7]~12_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_8_result_int[7]~13\);

-- Location: LCCOMB_X14_Y9_N18
\Div0|auto_generated|divider|divider|add_sub_8_result_int[8]~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_8_result_int[8]~15_cout\ = CARRY((!\Div0|auto_generated|divider|divider|StageOut[70]~121_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[70]~120_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_8_result_int[7]~13\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[70]~121_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[70]~120_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_8_result_int[7]~13\,
	cout => \Div0|auto_generated|divider|divider|add_sub_8_result_int[8]~15_cout\);

-- Location: LCCOMB_X14_Y9_N20
\Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\ = \Div0|auto_generated|divider|divider|add_sub_8_result_int[8]~15_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div0|auto_generated|divider|divider|add_sub_8_result_int[8]~15_cout\,
	combout => \Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\);

-- Location: LCCOMB_X15_Y10_N24
\Div0|auto_generated|divider|divider|StageOut[75]~210\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[75]~210_combout\ = (\Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\ & (charge_time(8))) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => charge_time(8),
	datab => \Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[75]~210_combout\);

-- Location: LCCOMB_X15_Y10_N28
\Div0|auto_generated|divider|divider|StageOut[74]~141\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[74]~141_combout\ = (\Div0|auto_generated|divider|divider|add_sub_8_result_int[2]~2_combout\ & !\Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_8_result_int[2]~2_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[74]~141_combout\);

-- Location: LCCOMB_X15_Y10_N30
\Div0|auto_generated|divider|divider|StageOut[73]~142\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[73]~142_combout\ = (charge_time(6) & \Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => charge_time(6),
	datad => \Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[73]~142_combout\);

-- Location: LCCOMB_X15_Y10_N0
\Div0|auto_generated|divider|divider|StageOut[72]~145\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[72]~145_combout\ = (charge_time(5) & !\Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => charge_time(5),
	datad => \Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[72]~145_combout\);

-- Location: LCCOMB_X14_Y10_N16
\Div0|auto_generated|divider|divider|add_sub_9_result_int[3]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_9_result_int[3]~4_combout\ = (\Div0|auto_generated|divider|divider|add_sub_9_result_int[2]~3\ & (((\Div0|auto_generated|divider|divider|StageOut[74]~211_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[74]~141_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_9_result_int[2]~3\ & ((((\Div0|auto_generated|divider|divider|StageOut[74]~211_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[74]~141_combout\)))))
-- \Div0|auto_generated|divider|divider|add_sub_9_result_int[3]~5\ = CARRY((!\Div0|auto_generated|divider|divider|add_sub_9_result_int[2]~3\ & ((\Div0|auto_generated|divider|divider|StageOut[74]~211_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[74]~141_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[74]~211_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[74]~141_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_9_result_int[2]~3\,
	combout => \Div0|auto_generated|divider|divider|add_sub_9_result_int[3]~4_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_9_result_int[3]~5\);

-- Location: LCCOMB_X14_Y10_N18
\Div0|auto_generated|divider|divider|add_sub_9_result_int[4]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_9_result_int[4]~6_combout\ = (\Div0|auto_generated|divider|divider|StageOut[75]~140_combout\ & (((!\Div0|auto_generated|divider|divider|add_sub_9_result_int[3]~5\)))) # 
-- (!\Div0|auto_generated|divider|divider|StageOut[75]~140_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[75]~210_combout\ & (!\Div0|auto_generated|divider|divider|add_sub_9_result_int[3]~5\)) # 
-- (!\Div0|auto_generated|divider|divider|StageOut[75]~210_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_9_result_int[3]~5\) # (GND)))))
-- \Div0|auto_generated|divider|divider|add_sub_9_result_int[4]~7\ = CARRY(((!\Div0|auto_generated|divider|divider|StageOut[75]~140_combout\ & !\Div0|auto_generated|divider|divider|StageOut[75]~210_combout\)) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_9_result_int[3]~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[75]~140_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[75]~210_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_9_result_int[3]~5\,
	combout => \Div0|auto_generated|divider|divider|add_sub_9_result_int[4]~6_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_9_result_int[4]~7\);

-- Location: LCCOMB_X15_Y10_N12
\Div0|auto_generated|divider|divider|StageOut[79]~136\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[79]~136_combout\ = (\Div0|auto_generated|divider|divider|add_sub_8_result_int[7]~12_combout\ & !\Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_8_result_int[7]~12_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[79]~136_combout\);

-- Location: LCCOMB_X14_Y9_N0
\Div0|auto_generated|divider|divider|StageOut[78]~137\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[78]~137_combout\ = (!\Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\ & \Div0|auto_generated|divider|divider|add_sub_8_result_int[6]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_8_result_int[6]~10_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[78]~137_combout\);

-- Location: LCCOMB_X14_Y9_N2
\Div0|auto_generated|divider|divider|StageOut[77]~138\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[77]~138_combout\ = (!\Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\ & \Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[77]~138_combout\);

-- Location: LCCOMB_X13_Y9_N24
\Div0|auto_generated|divider|divider|StageOut[76]~209\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[76]~209_combout\ = (\Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\ & (charge_time(9))) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	datab => charge_time(9),
	datac => \Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~4_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[76]~209_combout\);

-- Location: LCCOMB_X14_Y10_N20
\Div0|auto_generated|divider|divider|add_sub_9_result_int[5]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_9_result_int[5]~8_combout\ = (\Div0|auto_generated|divider|divider|add_sub_9_result_int[4]~7\ & (((\Div0|auto_generated|divider|divider|StageOut[76]~139_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[76]~209_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_9_result_int[4]~7\ & ((((\Div0|auto_generated|divider|divider|StageOut[76]~139_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[76]~209_combout\)))))
-- \Div0|auto_generated|divider|divider|add_sub_9_result_int[5]~9\ = CARRY((!\Div0|auto_generated|divider|divider|add_sub_9_result_int[4]~7\ & ((\Div0|auto_generated|divider|divider|StageOut[76]~139_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[76]~209_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[76]~139_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[76]~209_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_9_result_int[4]~7\,
	combout => \Div0|auto_generated|divider|divider|add_sub_9_result_int[5]~8_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_9_result_int[5]~9\);

-- Location: LCCOMB_X14_Y10_N22
\Div0|auto_generated|divider|divider|add_sub_9_result_int[6]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_9_result_int[6]~10_combout\ = (\Div0|auto_generated|divider|divider|StageOut[77]~208_combout\ & (((!\Div0|auto_generated|divider|divider|add_sub_9_result_int[5]~9\)))) # 
-- (!\Div0|auto_generated|divider|divider|StageOut[77]~208_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[77]~138_combout\ & (!\Div0|auto_generated|divider|divider|add_sub_9_result_int[5]~9\)) # 
-- (!\Div0|auto_generated|divider|divider|StageOut[77]~138_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_9_result_int[5]~9\) # (GND)))))
-- \Div0|auto_generated|divider|divider|add_sub_9_result_int[6]~11\ = CARRY(((!\Div0|auto_generated|divider|divider|StageOut[77]~208_combout\ & !\Div0|auto_generated|divider|divider|StageOut[77]~138_combout\)) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_9_result_int[5]~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[77]~208_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[77]~138_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_9_result_int[5]~9\,
	combout => \Div0|auto_generated|divider|divider|add_sub_9_result_int[6]~10_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_9_result_int[6]~11\);

-- Location: LCCOMB_X14_Y10_N24
\Div0|auto_generated|divider|divider|add_sub_9_result_int[7]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_9_result_int[7]~12_combout\ = (\Div0|auto_generated|divider|divider|add_sub_9_result_int[6]~11\ & (((\Div0|auto_generated|divider|divider|StageOut[78]~207_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[78]~137_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_9_result_int[6]~11\ & ((((\Div0|auto_generated|divider|divider|StageOut[78]~207_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[78]~137_combout\)))))
-- \Div0|auto_generated|divider|divider|add_sub_9_result_int[7]~13\ = CARRY((!\Div0|auto_generated|divider|divider|add_sub_9_result_int[6]~11\ & ((\Div0|auto_generated|divider|divider|StageOut[78]~207_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[78]~137_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[78]~207_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[78]~137_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_9_result_int[6]~11\,
	combout => \Div0|auto_generated|divider|divider|add_sub_9_result_int[7]~12_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_9_result_int[7]~13\);

-- Location: LCCOMB_X14_Y10_N26
\Div0|auto_generated|divider|divider|add_sub_9_result_int[8]~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_9_result_int[8]~15_cout\ = CARRY((!\Div0|auto_generated|divider|divider|StageOut[79]~206_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[79]~136_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_9_result_int[7]~13\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[79]~206_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[79]~136_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_9_result_int[7]~13\,
	cout => \Div0|auto_generated|divider|divider|add_sub_9_result_int[8]~15_cout\);

-- Location: LCCOMB_X14_Y10_N28
\Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\ = \Div0|auto_generated|divider|divider|add_sub_9_result_int[8]~15_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div0|auto_generated|divider|divider|add_sub_9_result_int[8]~15_cout\,
	combout => \Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\);

-- Location: LCCOMB_X14_Y10_N30
\Div0|auto_generated|divider|divider|StageOut[85]~149\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[85]~149_combout\ = (\Div0|auto_generated|divider|divider|add_sub_9_result_int[4]~6_combout\ & !\Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|add_sub_9_result_int[4]~6_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[85]~149_combout\);

-- Location: LCCOMB_X14_Y10_N8
\Div0|auto_generated|divider|divider|StageOut[84]~150\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[84]~150_combout\ = (\Div0|auto_generated|divider|divider|add_sub_9_result_int[3]~4_combout\ & !\Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_9_result_int[3]~4_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[84]~150_combout\);

-- Location: LCCOMB_X15_Y10_N14
\Div0|auto_generated|divider|divider|StageOut[83]~212\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[83]~212_combout\ = (\Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\ & (charge_time(6))) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_8_result_int[1]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	datab => charge_time(6),
	datac => \Div0|auto_generated|divider|divider|add_sub_8_result_int[1]~0_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[83]~212_combout\);

-- Location: LCCOMB_X13_Y9_N18
\Div0|auto_generated|divider|divider|StageOut[82]~152\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[82]~152_combout\ = (charge_time(5) & \Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => charge_time(5),
	datad => \Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[82]~152_combout\);

-- Location: LCCOMB_X10_Y10_N12
\Div0|auto_generated|divider|divider|StageOut[81]~154\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[81]~154_combout\ = (charge_time(4) & \Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => charge_time(4),
	datad => \Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[81]~154_combout\);

-- Location: LCCOMB_X13_Y10_N12
\Div0|auto_generated|divider|divider|add_sub_10_result_int[1]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_10_result_int[1]~0_combout\ = (((\Div0|auto_generated|divider|divider|StageOut[81]~155_combout\) # (\Div0|auto_generated|divider|divider|StageOut[81]~154_combout\)))
-- \Div0|auto_generated|divider|divider|add_sub_10_result_int[1]~1\ = CARRY((\Div0|auto_generated|divider|divider|StageOut[81]~155_combout\) # (\Div0|auto_generated|divider|divider|StageOut[81]~154_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[81]~155_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[81]~154_combout\,
	datad => VCC,
	combout => \Div0|auto_generated|divider|divider|add_sub_10_result_int[1]~0_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_10_result_int[1]~1\);

-- Location: LCCOMB_X13_Y10_N14
\Div0|auto_generated|divider|divider|add_sub_10_result_int[2]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_10_result_int[2]~2_combout\ = (\Div0|auto_generated|divider|divider|add_sub_10_result_int[1]~1\ & (((\Div0|auto_generated|divider|divider|StageOut[82]~153_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[82]~152_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_10_result_int[1]~1\ & (!\Div0|auto_generated|divider|divider|StageOut[82]~153_combout\ & 
-- (!\Div0|auto_generated|divider|divider|StageOut[82]~152_combout\)))
-- \Div0|auto_generated|divider|divider|add_sub_10_result_int[2]~3\ = CARRY((!\Div0|auto_generated|divider|divider|StageOut[82]~153_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[82]~152_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_10_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[82]~153_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[82]~152_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_10_result_int[1]~1\,
	combout => \Div0|auto_generated|divider|divider|add_sub_10_result_int[2]~2_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_10_result_int[2]~3\);

-- Location: LCCOMB_X13_Y10_N18
\Div0|auto_generated|divider|divider|add_sub_10_result_int[4]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_10_result_int[4]~6_combout\ = (\Div0|auto_generated|divider|divider|StageOut[84]~190_combout\ & (((!\Div0|auto_generated|divider|divider|add_sub_10_result_int[3]~5\)))) # 
-- (!\Div0|auto_generated|divider|divider|StageOut[84]~190_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[84]~150_combout\ & (!\Div0|auto_generated|divider|divider|add_sub_10_result_int[3]~5\)) # 
-- (!\Div0|auto_generated|divider|divider|StageOut[84]~150_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_10_result_int[3]~5\) # (GND)))))
-- \Div0|auto_generated|divider|divider|add_sub_10_result_int[4]~7\ = CARRY(((!\Div0|auto_generated|divider|divider|StageOut[84]~190_combout\ & !\Div0|auto_generated|divider|divider|StageOut[84]~150_combout\)) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_10_result_int[3]~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[84]~190_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[84]~150_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_10_result_int[3]~5\,
	combout => \Div0|auto_generated|divider|divider|add_sub_10_result_int[4]~6_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_10_result_int[4]~7\);

-- Location: LCCOMB_X13_Y10_N20
\Div0|auto_generated|divider|divider|add_sub_10_result_int[5]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_10_result_int[5]~8_combout\ = (\Div0|auto_generated|divider|divider|add_sub_10_result_int[4]~7\ & (((\Div0|auto_generated|divider|divider|StageOut[85]~189_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[85]~149_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_10_result_int[4]~7\ & ((((\Div0|auto_generated|divider|divider|StageOut[85]~189_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[85]~149_combout\)))))
-- \Div0|auto_generated|divider|divider|add_sub_10_result_int[5]~9\ = CARRY((!\Div0|auto_generated|divider|divider|add_sub_10_result_int[4]~7\ & ((\Div0|auto_generated|divider|divider|StageOut[85]~189_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[85]~149_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[85]~189_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[85]~149_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_10_result_int[4]~7\,
	combout => \Div0|auto_generated|divider|divider|add_sub_10_result_int[5]~8_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_10_result_int[5]~9\);

-- Location: LCCOMB_X14_Y10_N0
\Div0|auto_generated|divider|divider|StageOut[88]~146\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[88]~146_combout\ = (\Div0|auto_generated|divider|divider|add_sub_9_result_int[7]~12_combout\ & !\Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_9_result_int[7]~12_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[88]~146_combout\);

-- Location: LCCOMB_X14_Y10_N2
\Div0|auto_generated|divider|divider|StageOut[87]~147\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[87]~147_combout\ = (\Div0|auto_generated|divider|divider|add_sub_9_result_int[6]~10_combout\ & !\Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|add_sub_9_result_int[6]~10_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[87]~147_combout\);

-- Location: LCCOMB_X13_Y9_N28
\Div0|auto_generated|divider|divider|StageOut[86]~188\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[86]~188_combout\ = (\Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[76]~209_combout\) # 
-- ((!\Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\ & \Div0|auto_generated|divider|divider|add_sub_8_result_int[4]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[76]~209_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_8_result_int[4]~6_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[86]~188_combout\);

-- Location: LCCOMB_X13_Y10_N22
\Div0|auto_generated|divider|divider|add_sub_10_result_int[6]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_10_result_int[6]~10_combout\ = (\Div0|auto_generated|divider|divider|StageOut[86]~148_combout\ & (((!\Div0|auto_generated|divider|divider|add_sub_10_result_int[5]~9\)))) # 
-- (!\Div0|auto_generated|divider|divider|StageOut[86]~148_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[86]~188_combout\ & (!\Div0|auto_generated|divider|divider|add_sub_10_result_int[5]~9\)) # 
-- (!\Div0|auto_generated|divider|divider|StageOut[86]~188_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_10_result_int[5]~9\) # (GND)))))
-- \Div0|auto_generated|divider|divider|add_sub_10_result_int[6]~11\ = CARRY(((!\Div0|auto_generated|divider|divider|StageOut[86]~148_combout\ & !\Div0|auto_generated|divider|divider|StageOut[86]~188_combout\)) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_10_result_int[5]~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[86]~148_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[86]~188_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_10_result_int[5]~9\,
	combout => \Div0|auto_generated|divider|divider|add_sub_10_result_int[6]~10_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_10_result_int[6]~11\);

-- Location: LCCOMB_X13_Y10_N26
\Div0|auto_generated|divider|divider|add_sub_10_result_int[8]~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_10_result_int[8]~15_cout\ = CARRY((!\Div0|auto_generated|divider|divider|StageOut[88]~186_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[88]~146_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_10_result_int[7]~13\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[88]~186_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[88]~146_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_10_result_int[7]~13\,
	cout => \Div0|auto_generated|divider|divider|add_sub_10_result_int[8]~15_cout\);

-- Location: LCCOMB_X13_Y10_N28
\Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\ = \Div0|auto_generated|divider|divider|add_sub_10_result_int[8]~15_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div0|auto_generated|divider|divider|add_sub_10_result_int[8]~15_cout\,
	combout => \Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\);

-- Location: LCCOMB_X13_Y10_N30
\Div0|auto_generated|divider|divider|StageOut[95]~158\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[95]~158_combout\ = (\Div0|auto_generated|divider|divider|add_sub_10_result_int[5]~8_combout\ & !\Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_10_result_int[5]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[95]~158_combout\);

-- Location: LCCOMB_X13_Y9_N2
\Div0|auto_generated|divider|divider|StageOut[74]~211\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[74]~211_combout\ = (\Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\ & ((charge_time(7)))) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\ & (\Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\,
	datab => charge_time(7),
	datac => \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[74]~211_combout\);

-- Location: LCCOMB_X13_Y9_N30
\Div0|auto_generated|divider|divider|StageOut[84]~190\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[84]~190_combout\ = (\Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[74]~211_combout\) # 
-- ((\Div0|auto_generated|divider|divider|add_sub_8_result_int[2]~2_combout\ & !\Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_8_result_int[2]~2_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[74]~211_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[84]~190_combout\);

-- Location: LCCOMB_X13_Y9_N12
\Div0|auto_generated|divider|divider|StageOut[94]~194\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[94]~194_combout\ = (\Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[84]~190_combout\) # 
-- ((\Div0|auto_generated|divider|divider|add_sub_9_result_int[3]~4_combout\ & !\Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_9_result_int[3]~4_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\,
	datad => \Div0|auto_generated|divider|divider|StageOut[84]~190_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[94]~194_combout\);

-- Location: LCCOMB_X15_Y10_N22
\Div0|auto_generated|divider|divider|StageOut[93]~195\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[93]~195_combout\ = (\Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[83]~212_combout\) # 
-- ((\Div0|auto_generated|divider|divider|add_sub_9_result_int[2]~2_combout\ & !\Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_9_result_int[2]~2_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\,
	datac => \Div0|auto_generated|divider|divider|StageOut[83]~212_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[93]~195_combout\);

-- Location: LCCOMB_X13_Y11_N22
\Div0|auto_generated|divider|divider|StageOut[92]~213\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[92]~213_combout\ = (\Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\ & ((charge_time(5)))) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\ & (\Div0|auto_generated|divider|divider|add_sub_9_result_int[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_9_result_int[1]~0_combout\,
	datab => charge_time(5),
	datac => \Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[92]~213_combout\);

-- Location: LCCOMB_X13_Y10_N0
\Div0|auto_generated|divider|divider|StageOut[91]~163\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[91]~163_combout\ = (\Div0|auto_generated|divider|divider|add_sub_10_result_int[1]~0_combout\ & !\Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_10_result_int[1]~0_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[91]~163_combout\);

-- Location: LCCOMB_X12_Y10_N22
\Div0|auto_generated|divider|divider|StageOut[90]~164\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[90]~164_combout\ = (charge_time(3) & \Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => charge_time(3),
	datad => \Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[90]~164_combout\);

-- Location: LCCOMB_X12_Y10_N4
\Div0|auto_generated|divider|divider|add_sub_11_result_int[1]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_11_result_int[1]~0_combout\ = (((\Div0|auto_generated|divider|divider|StageOut[90]~165_combout\) # (\Div0|auto_generated|divider|divider|StageOut[90]~164_combout\)))
-- \Div0|auto_generated|divider|divider|add_sub_11_result_int[1]~1\ = CARRY((\Div0|auto_generated|divider|divider|StageOut[90]~165_combout\) # (\Div0|auto_generated|divider|divider|StageOut[90]~164_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[90]~165_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[90]~164_combout\,
	datad => VCC,
	combout => \Div0|auto_generated|divider|divider|add_sub_11_result_int[1]~0_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_11_result_int[1]~1\);

-- Location: LCCOMB_X12_Y10_N10
\Div0|auto_generated|divider|divider|add_sub_11_result_int[4]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_11_result_int[4]~6_combout\ = (\Div0|auto_generated|divider|divider|StageOut[93]~160_combout\ & (((!\Div0|auto_generated|divider|divider|add_sub_11_result_int[3]~5\)))) # 
-- (!\Div0|auto_generated|divider|divider|StageOut[93]~160_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[93]~195_combout\ & (!\Div0|auto_generated|divider|divider|add_sub_11_result_int[3]~5\)) # 
-- (!\Div0|auto_generated|divider|divider|StageOut[93]~195_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_11_result_int[3]~5\) # (GND)))))
-- \Div0|auto_generated|divider|divider|add_sub_11_result_int[4]~7\ = CARRY(((!\Div0|auto_generated|divider|divider|StageOut[93]~160_combout\ & !\Div0|auto_generated|divider|divider|StageOut[93]~195_combout\)) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_11_result_int[3]~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[93]~160_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[93]~195_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_11_result_int[3]~5\,
	combout => \Div0|auto_generated|divider|divider|add_sub_11_result_int[4]~6_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_11_result_int[4]~7\);

-- Location: LCCOMB_X12_Y10_N14
\Div0|auto_generated|divider|divider|add_sub_11_result_int[6]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_11_result_int[6]~10_combout\ = (\Div0|auto_generated|divider|divider|StageOut[95]~193_combout\ & (((!\Div0|auto_generated|divider|divider|add_sub_11_result_int[5]~9\)))) # 
-- (!\Div0|auto_generated|divider|divider|StageOut[95]~193_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[95]~158_combout\ & (!\Div0|auto_generated|divider|divider|add_sub_11_result_int[5]~9\)) # 
-- (!\Div0|auto_generated|divider|divider|StageOut[95]~158_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_11_result_int[5]~9\) # (GND)))))
-- \Div0|auto_generated|divider|divider|add_sub_11_result_int[6]~11\ = CARRY(((!\Div0|auto_generated|divider|divider|StageOut[95]~193_combout\ & !\Div0|auto_generated|divider|divider|StageOut[95]~158_combout\)) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_11_result_int[5]~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[95]~193_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[95]~158_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_11_result_int[5]~9\,
	combout => \Div0|auto_generated|divider|divider|add_sub_11_result_int[6]~10_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_11_result_int[6]~11\);

-- Location: LCCOMB_X15_Y10_N8
\Div0|auto_generated|divider|divider|StageOut[95]~193\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[95]~193_combout\ = (\Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[85]~189_combout\) # 
-- ((!\Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\ & \Div0|auto_generated|divider|divider|add_sub_9_result_int[4]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[85]~189_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_9_result_int[4]~6_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[95]~193_combout\);

-- Location: LCCOMB_X14_Y10_N10
\Div0|auto_generated|divider|divider|StageOut[77]~208\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[77]~208_combout\ = (\Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\ & (charge_time(10))) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_7_result_int[4]~6_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => charge_time(10),
	datab => \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_7_result_int[4]~6_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[77]~208_combout\);

-- Location: LCCOMB_X13_Y10_N6
\Div0|auto_generated|divider|divider|StageOut[87]~187\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[87]~187_combout\ = (\Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[77]~208_combout\) # 
-- ((\Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\ & !\Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	datac => \Div0|auto_generated|divider|divider|StageOut[77]~208_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[87]~187_combout\);

-- Location: LCCOMB_X12_Y10_N0
\Div0|auto_generated|divider|divider|StageOut[97]~191\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[97]~191_combout\ = (\Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[87]~187_combout\) # 
-- ((!\Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\ & \Div0|auto_generated|divider|divider|add_sub_9_result_int[6]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_9_result_int[6]~10_combout\,
	datac => \Div0|auto_generated|divider|divider|StageOut[87]~187_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[97]~191_combout\);

-- Location: LCCOMB_X12_Y10_N30
\Div0|auto_generated|divider|divider|StageOut[96]~192\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[96]~192_combout\ = (\Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[86]~188_combout\) # 
-- ((!\Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\ & \Div0|auto_generated|divider|divider|add_sub_9_result_int[5]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_9_result_int[5]~8_combout\,
	datac => \Div0|auto_generated|divider|divider|StageOut[86]~188_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[96]~192_combout\);

-- Location: LCCOMB_X12_Y10_N18
\Div0|auto_generated|divider|divider|add_sub_11_result_int[8]~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_11_result_int[8]~15_cout\ = CARRY((!\Div0|auto_generated|divider|divider|StageOut[97]~156_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[97]~191_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_11_result_int[7]~13\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[97]~156_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[97]~191_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_11_result_int[7]~13\,
	cout => \Div0|auto_generated|divider|divider|add_sub_11_result_int[8]~15_cout\);

-- Location: LCCOMB_X12_Y10_N20
\Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\ = \Div0|auto_generated|divider|divider|add_sub_11_result_int[8]~15_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div0|auto_generated|divider|divider|add_sub_11_result_int[8]~15_cout\,
	combout => \Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\);

-- Location: LCCOMB_X10_Y10_N22
\Div0|auto_generated|divider|divider|StageOut[105]~197\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[105]~197_combout\ = (\Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[95]~193_combout\) # 
-- ((!\Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\ & \Div0|auto_generated|divider|divider|add_sub_10_result_int[5]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_10_result_int[5]~8_combout\,
	datac => \Div0|auto_generated|divider|divider|StageOut[95]~193_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[105]~197_combout\);

-- Location: LCCOMB_X9_Y10_N22
\Div0|auto_generated|divider|divider|StageOut[106]~196\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[106]~196_combout\ = (\Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[96]~192_combout\) # 
-- ((!\Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\ & \Div0|auto_generated|divider|divider|add_sub_10_result_int[6]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[96]~192_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_10_result_int[6]~10_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[106]~196_combout\);

-- Location: LCCOMB_X13_Y9_N22
\Div0|auto_generated|divider|divider|StageOut[104]~198\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[104]~198_combout\ = (\Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[94]~194_combout\) # 
-- ((\Div0|auto_generated|divider|divider|add_sub_10_result_int[4]~6_combout\ & !\Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[94]~194_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_10_result_int[4]~6_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[104]~198_combout\);

-- Location: LCCOMB_X9_Y10_N30
\Div0|auto_generated|divider|divider|StageOut[103]~169\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[103]~169_combout\ = (\Div0|auto_generated|divider|divider|add_sub_11_result_int[4]~6_combout\ & !\Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_11_result_int[4]~6_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[103]~169_combout\);

-- Location: LCCOMB_X13_Y11_N16
\Div0|auto_generated|divider|divider|StageOut[102]~200\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[102]~200_combout\ = (\Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[92]~213_combout\) # 
-- ((!\Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\ & \Div0|auto_generated|divider|divider|add_sub_10_result_int[2]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[92]~213_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_10_result_int[2]~2_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[102]~200_combout\);

-- Location: LCCOMB_X10_Y10_N14
\Div0|auto_generated|divider|divider|StageOut[101]~214\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[101]~214_combout\ = (\Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\ & (charge_time(4))) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_10_result_int[1]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => charge_time(4),
	datab => \Div0|auto_generated|divider|divider|add_sub_10_result_int[1]~0_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[101]~214_combout\);

-- Location: LCCOMB_X10_Y10_N0
\Div0|auto_generated|divider|divider|StageOut[100]~173\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[100]~173_combout\ = (\Div0|auto_generated|divider|divider|add_sub_11_result_int[1]~0_combout\ & !\Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_11_result_int[1]~0_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[100]~173_combout\);

-- Location: LCCOMB_X10_Y10_N24
\Div0|auto_generated|divider|divider|StageOut[99]~175\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[99]~175_combout\ = (charge_time(2) & !\Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => charge_time(2),
	datad => \Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[99]~175_combout\);

-- Location: LCCOMB_X9_Y10_N2
\Div0|auto_generated|divider|divider|add_sub_12_result_int[2]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_12_result_int[2]~2_combout\ = (\Div0|auto_generated|divider|divider|add_sub_12_result_int[1]~1\ & (((\Div0|auto_generated|divider|divider|StageOut[100]~172_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[100]~173_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_12_result_int[1]~1\ & (!\Div0|auto_generated|divider|divider|StageOut[100]~172_combout\ & 
-- (!\Div0|auto_generated|divider|divider|StageOut[100]~173_combout\)))
-- \Div0|auto_generated|divider|divider|add_sub_12_result_int[2]~3\ = CARRY((!\Div0|auto_generated|divider|divider|StageOut[100]~172_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[100]~173_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_12_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[100]~172_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[100]~173_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_12_result_int[1]~1\,
	combout => \Div0|auto_generated|divider|divider|add_sub_12_result_int[2]~2_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_12_result_int[2]~3\);

-- Location: LCCOMB_X9_Y10_N4
\Div0|auto_generated|divider|divider|add_sub_12_result_int[3]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_12_result_int[3]~4_combout\ = (\Div0|auto_generated|divider|divider|add_sub_12_result_int[2]~3\ & (((\Div0|auto_generated|divider|divider|StageOut[101]~171_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[101]~214_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_12_result_int[2]~3\ & ((((\Div0|auto_generated|divider|divider|StageOut[101]~171_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[101]~214_combout\)))))
-- \Div0|auto_generated|divider|divider|add_sub_12_result_int[3]~5\ = CARRY((!\Div0|auto_generated|divider|divider|add_sub_12_result_int[2]~3\ & ((\Div0|auto_generated|divider|divider|StageOut[101]~171_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[101]~214_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[101]~171_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[101]~214_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_12_result_int[2]~3\,
	combout => \Div0|auto_generated|divider|divider|add_sub_12_result_int[3]~4_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_12_result_int[3]~5\);

-- Location: LCCOMB_X9_Y10_N6
\Div0|auto_generated|divider|divider|add_sub_12_result_int[4]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_12_result_int[4]~6_combout\ = (\Div0|auto_generated|divider|divider|StageOut[102]~170_combout\ & (((!\Div0|auto_generated|divider|divider|add_sub_12_result_int[3]~5\)))) # 
-- (!\Div0|auto_generated|divider|divider|StageOut[102]~170_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[102]~200_combout\ & (!\Div0|auto_generated|divider|divider|add_sub_12_result_int[3]~5\)) # 
-- (!\Div0|auto_generated|divider|divider|StageOut[102]~200_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_12_result_int[3]~5\) # (GND)))))
-- \Div0|auto_generated|divider|divider|add_sub_12_result_int[4]~7\ = CARRY(((!\Div0|auto_generated|divider|divider|StageOut[102]~170_combout\ & !\Div0|auto_generated|divider|divider|StageOut[102]~200_combout\)) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_12_result_int[3]~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[102]~170_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[102]~200_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_12_result_int[3]~5\,
	combout => \Div0|auto_generated|divider|divider|add_sub_12_result_int[4]~6_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_12_result_int[4]~7\);

-- Location: LCCOMB_X9_Y10_N10
\Div0|auto_generated|divider|divider|add_sub_12_result_int[6]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_12_result_int[6]~10_combout\ = (\Div0|auto_generated|divider|divider|StageOut[104]~168_combout\ & (((!\Div0|auto_generated|divider|divider|add_sub_12_result_int[5]~9\)))) # 
-- (!\Div0|auto_generated|divider|divider|StageOut[104]~168_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[104]~198_combout\ & (!\Div0|auto_generated|divider|divider|add_sub_12_result_int[5]~9\)) # 
-- (!\Div0|auto_generated|divider|divider|StageOut[104]~198_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_12_result_int[5]~9\) # (GND)))))
-- \Div0|auto_generated|divider|divider|add_sub_12_result_int[6]~11\ = CARRY(((!\Div0|auto_generated|divider|divider|StageOut[104]~168_combout\ & !\Div0|auto_generated|divider|divider|StageOut[104]~198_combout\)) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_12_result_int[5]~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[104]~168_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[104]~198_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_12_result_int[5]~9\,
	combout => \Div0|auto_generated|divider|divider|add_sub_12_result_int[6]~10_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_12_result_int[6]~11\);

-- Location: LCCOMB_X9_Y10_N14
\Div0|auto_generated|divider|divider|add_sub_12_result_int[8]~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_12_result_int[8]~15_cout\ = CARRY((!\Div0|auto_generated|divider|divider|StageOut[106]~166_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[106]~196_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_12_result_int[7]~13\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[106]~166_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[106]~196_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_12_result_int[7]~13\,
	cout => \Div0|auto_generated|divider|divider|add_sub_12_result_int[8]~15_cout\);

-- Location: LCCOMB_X9_Y10_N16
\Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\ = \Div0|auto_generated|divider|divider|add_sub_12_result_int[8]~15_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div0|auto_generated|divider|divider|add_sub_12_result_int[8]~15_cout\,
	combout => \Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\);

-- Location: LCCOMB_X7_Y10_N22
\Div0|auto_generated|divider|divider|StageOut[115]~201\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[115]~201_combout\ = (\Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[105]~197_combout\) # 
-- ((!\Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\ & \Div0|auto_generated|divider|divider|add_sub_11_result_int[6]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_11_result_int[6]~10_combout\,
	datac => \Div0|auto_generated|divider|divider|StageOut[105]~197_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[115]~201_combout\);

-- Location: LCCOMB_X8_Y10_N30
\Div0|auto_generated|divider|divider|StageOut[114]~177\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[114]~177_combout\ = (\Div0|auto_generated|divider|divider|add_sub_12_result_int[6]~10_combout\ & !\Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_12_result_int[6]~10_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[114]~177_combout\);

-- Location: LCCOMB_X9_Y10_N18
\Div0|auto_generated|divider|divider|StageOut[113]~203\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[113]~203_combout\ = (\Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[103]~199_combout\) # 
-- ((\Div0|auto_generated|divider|divider|add_sub_11_result_int[4]~6_combout\ & !\Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[103]~199_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_11_result_int[4]~6_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[113]~203_combout\);

-- Location: LCCOMB_X8_Y10_N28
\Div0|auto_generated|divider|divider|StageOut[112]~179\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[112]~179_combout\ = (!\Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\ & \Div0|auto_generated|divider|divider|add_sub_12_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_12_result_int[4]~6_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[112]~179_combout\);

-- Location: LCCOMB_X8_Y10_N22
\Div0|auto_generated|divider|divider|StageOut[111]~180\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[111]~180_combout\ = (!\Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\ & \Div0|auto_generated|divider|divider|add_sub_12_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_12_result_int[3]~4_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[111]~180_combout\);

-- Location: LCCOMB_X9_Y10_N24
\Div0|auto_generated|divider|divider|StageOut[110]~181\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[110]~181_combout\ = (!\Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\ & \Div0|auto_generated|divider|divider|add_sub_12_result_int[2]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_12_result_int[2]~2_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[110]~181_combout\);

-- Location: LCCOMB_X7_Y10_N4
\Div0|auto_generated|divider|divider|StageOut[109]~182\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[109]~182_combout\ = (charge_time(2) & \Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => charge_time(2),
	datad => \Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[109]~182_combout\);

-- Location: LCCOMB_X7_Y10_N24
\Div0|auto_generated|divider|divider|StageOut[108]~185\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[108]~185_combout\ = (charge_time(1) & !\Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => charge_time(1),
	datad => \Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[108]~185_combout\);

-- Location: LCCOMB_X8_Y10_N2
\Div0|auto_generated|divider|divider|add_sub_13_result_int[1]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_13_result_int[1]~1_cout\ = CARRY((\Div0|auto_generated|divider|divider|StageOut[108]~184_combout\) # (\Div0|auto_generated|divider|divider|StageOut[108]~185_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[108]~184_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[108]~185_combout\,
	datad => VCC,
	cout => \Div0|auto_generated|divider|divider|add_sub_13_result_int[1]~1_cout\);

-- Location: LCCOMB_X8_Y10_N4
\Div0|auto_generated|divider|divider|add_sub_13_result_int[2]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_13_result_int[2]~3_cout\ = CARRY((!\Div0|auto_generated|divider|divider|StageOut[109]~183_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[109]~182_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_13_result_int[1]~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[109]~183_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[109]~182_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_13_result_int[1]~1_cout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_13_result_int[2]~3_cout\);

-- Location: LCCOMB_X8_Y10_N6
\Div0|auto_generated|divider|divider|add_sub_13_result_int[3]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_13_result_int[3]~5_cout\ = CARRY((!\Div0|auto_generated|divider|divider|add_sub_13_result_int[2]~3_cout\ & ((\Div0|auto_generated|divider|divider|StageOut[110]~215_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[110]~181_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[110]~215_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[110]~181_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_13_result_int[2]~3_cout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_13_result_int[3]~5_cout\);

-- Location: LCCOMB_X8_Y10_N8
\Div0|auto_generated|divider|divider|add_sub_13_result_int[4]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_13_result_int[4]~7_cout\ = CARRY(((!\Div0|auto_generated|divider|divider|StageOut[111]~205_combout\ & !\Div0|auto_generated|divider|divider|StageOut[111]~180_combout\)) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_13_result_int[3]~5_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[111]~205_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[111]~180_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_13_result_int[3]~5_cout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_13_result_int[4]~7_cout\);

-- Location: LCCOMB_X8_Y10_N10
\Div0|auto_generated|divider|divider|add_sub_13_result_int[5]~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_13_result_int[5]~9_cout\ = CARRY((!\Div0|auto_generated|divider|divider|add_sub_13_result_int[4]~7_cout\ & ((\Div0|auto_generated|divider|divider|StageOut[112]~204_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[112]~179_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[112]~204_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[112]~179_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_13_result_int[4]~7_cout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_13_result_int[5]~9_cout\);

-- Location: LCCOMB_X8_Y10_N12
\Div0|auto_generated|divider|divider|add_sub_13_result_int[6]~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_13_result_int[6]~11_cout\ = CARRY(((!\Div0|auto_generated|divider|divider|StageOut[113]~178_combout\ & !\Div0|auto_generated|divider|divider|StageOut[113]~203_combout\)) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_13_result_int[5]~9_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[113]~178_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[113]~203_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_13_result_int[5]~9_cout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_13_result_int[6]~11_cout\);

-- Location: LCCOMB_X8_Y10_N14
\Div0|auto_generated|divider|divider|add_sub_13_result_int[7]~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_13_result_int[7]~13_cout\ = CARRY((!\Div0|auto_generated|divider|divider|add_sub_13_result_int[6]~11_cout\ & ((\Div0|auto_generated|divider|divider|StageOut[114]~202_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[114]~177_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[114]~202_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[114]~177_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_13_result_int[6]~11_cout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_13_result_int[7]~13_cout\);

-- Location: LCCOMB_X8_Y10_N16
\Div0|auto_generated|divider|divider|add_sub_13_result_int[8]~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_13_result_int[8]~15_cout\ = CARRY((!\Div0|auto_generated|divider|divider|StageOut[115]~176_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[115]~201_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_13_result_int[7]~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[115]~176_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[115]~201_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_13_result_int[7]~13_cout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_13_result_int[8]~15_cout\);

-- Location: LCCOMB_X8_Y10_N18
\Div0|auto_generated|divider|divider|add_sub_13_result_int[9]~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_13_result_int[9]~16_combout\ = \Div0|auto_generated|divider|divider|add_sub_13_result_int[8]~15_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div0|auto_generated|divider|divider|add_sub_13_result_int[8]~15_cout\,
	combout => \Div0|auto_generated|divider|divider|add_sub_13_result_int[9]~16_combout\);

-- Location: LCCOMB_X8_Y10_N0
\Selector44~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector44~1_combout\ = (\Selector44~0_combout\) # ((!\Selector43~0_combout\ & (\state.s2~regout\ & !\Div0|auto_generated|divider|divider|add_sub_13_result_int[9]~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector43~0_combout\,
	datab => \state.s2~regout\,
	datac => \Selector44~0_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_13_result_int[9]~16_combout\,
	combout => \Selector44~1_combout\);

-- Location: LCFF_X8_Y10_N1
\time0[0]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector44~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \time0[0]~reg0_regout\);

-- Location: LCCOMB_X8_Y11_N26
\always0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \always0~0_combout\ = (\time0[1]~reg0_regout\) # ((\money0[3]~reg0_regout\) # ((\money0[1]~reg0_regout\) # (\time0[0]~reg0_regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \time0[1]~reg0_regout\,
	datab => \money0[3]~reg0_regout\,
	datac => \money0[1]~reg0_regout\,
	datad => \time0[0]~reg0_regout\,
	combout => \always0~0_combout\);

-- Location: LCCOMB_X8_Y11_N30
\always0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \always0~3_combout\ = (\money1[1]~reg0_regout\) # (\money1[2]~reg0_regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \money1[1]~reg0_regout\,
	datad => \money1[2]~reg0_regout\,
	combout => \always0~3_combout\);

-- Location: LCCOMB_X8_Y11_N24
\always0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \always0~2_combout\ = (\money1[3]~reg0_regout\) # ((\money0[2]~reg0_regout\) # ((\money0[0]~reg0_regout\) # (\money1[0]~reg0_regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \money1[3]~reg0_regout\,
	datab => \money0[2]~reg0_regout\,
	datac => \money0[0]~reg0_regout\,
	datad => \money1[0]~reg0_regout\,
	combout => \always0~2_combout\);

-- Location: LCCOMB_X8_Y8_N14
\Selector11~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector11~1_combout\ = (\inputbottom~combout\(2) & ((\inputbottom~combout\(0)) # ((\time1[0]~reg0_regout\) # (\inputbottom~combout\(1))))) # (!\inputbottom~combout\(2) & (!\inputbottom~combout\(0) & (\time1[0]~reg0_regout\ & \inputbottom~combout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inputbottom~combout\(2),
	datab => \inputbottom~combout\(0),
	datac => \time1[0]~reg0_regout\,
	datad => \inputbottom~combout\(1),
	combout => \Selector11~1_combout\);

-- Location: LCCOMB_X8_Y8_N28
\Selector11~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector11~2_combout\ = (\Selector11~0_combout\ & (((\Selector11~1_combout\ & \inputbottom~combout\(3))))) # (!\Selector11~0_combout\ & (!\LessThan0~2_combout\ & ((\Selector11~1_combout\) # (\inputbottom~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector11~0_combout\,
	datab => \LessThan0~2_combout\,
	datac => \Selector11~1_combout\,
	datad => \inputbottom~combout\(3),
	combout => \Selector11~2_combout\);

-- Location: LCCOMB_X12_Y8_N12
\time1[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \time1[0]~0_combout\ = (\Selector27~0_combout\ & (\Selector11~2_combout\)) # (!\Selector27~0_combout\ & ((\time1[0]~reg0_regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector11~2_combout\,
	datac => \time1[0]~reg0_regout\,
	datad => \Selector27~0_combout\,
	combout => \time1[0]~0_combout\);

-- Location: LCCOMB_X15_Y8_N18
\Div1|auto_generated|divider|divider|add_sub_10_result_int[1]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_10_result_int[1]~0_combout\ = \Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\ $ (GND)
-- \Div1|auto_generated|divider|divider|add_sub_10_result_int[1]~1\ = CARRY(!\Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\,
	datad => VCC,
	combout => \Div1|auto_generated|divider|divider|add_sub_10_result_int[1]~0_combout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_10_result_int[1]~1\);

-- Location: LCCOMB_X15_Y8_N20
\Div1|auto_generated|divider|divider|add_sub_10_result_int[2]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_10_result_int[2]~2_combout\ = (\Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\ & (!\Div1|auto_generated|divider|divider|add_sub_10_result_int[1]~1\)) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\ & (\Div1|auto_generated|divider|divider|add_sub_10_result_int[1]~1\ & VCC))
-- \Div1|auto_generated|divider|divider|add_sub_10_result_int[2]~3\ = CARRY((\Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\ & !\Div1|auto_generated|divider|divider|add_sub_10_result_int[1]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_10_result_int[1]~1\,
	combout => \Div1|auto_generated|divider|divider|add_sub_10_result_int[2]~2_combout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_10_result_int[2]~3\);

-- Location: LCCOMB_X15_Y8_N24
\Div1|auto_generated|divider|divider|add_sub_10_result_int[4]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_10_result_int[4]~7_cout\ = CARRY(!\Div1|auto_generated|divider|divider|add_sub_10_result_int[3]~5\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_10_result_int[3]~5\,
	cout => \Div1|auto_generated|divider|divider|add_sub_10_result_int[4]~7_cout\);

-- Location: LCCOMB_X15_Y8_N26
\Div1|auto_generated|divider|divider|add_sub_10_result_int[5]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_10_result_int[5]~8_combout\ = \Div1|auto_generated|divider|divider|add_sub_10_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div1|auto_generated|divider|divider|add_sub_10_result_int[4]~7_cout\,
	combout => \Div1|auto_generated|divider|divider|add_sub_10_result_int[5]~8_combout\);

-- Location: LCCOMB_X15_Y8_N12
\Div1|auto_generated|divider|divider|StageOut[53]~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[53]~36_combout\ = (!\Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\ & \Div1|auto_generated|divider|divider|add_sub_10_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~14_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_10_result_int[5]~8_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[53]~36_combout\);

-- Location: LCCOMB_X14_Y8_N28
\Div1|auto_generated|divider|divider|StageOut[52]~39\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[52]~39_combout\ = (!\Div1|auto_generated|divider|divider|add_sub_10_result_int[5]~8_combout\ & \Div1|auto_generated|divider|divider|add_sub_10_result_int[2]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div1|auto_generated|divider|divider|add_sub_10_result_int[5]~8_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_10_result_int[2]~2_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[52]~39_combout\);

-- Location: LCCOMB_X14_Y8_N14
\Div1|auto_generated|divider|divider|StageOut[51]~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[51]~40_combout\ = (\Div1|auto_generated|divider|divider|add_sub_10_result_int[5]~8_combout\ & !\Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div1|auto_generated|divider|divider|add_sub_10_result_int[5]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[51]~40_combout\);

-- Location: LCCOMB_X14_Y8_N22
\Div1|auto_generated|divider|divider|StageOut[50]~42\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[50]~42_combout\ = (\Div1|auto_generated|divider|divider|add_sub_10_result_int[5]~8_combout\ & !\Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_10_result_int[5]~8_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[50]~42_combout\);

-- Location: LCCOMB_X14_Y8_N0
\Div1|auto_generated|divider|divider|add_sub_11_result_int[1]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_11_result_int[1]~0_combout\ = (((\Div1|auto_generated|divider|divider|StageOut[50]~43_combout\) # (\Div1|auto_generated|divider|divider|StageOut[50]~42_combout\)))
-- \Div1|auto_generated|divider|divider|add_sub_11_result_int[1]~1\ = CARRY((\Div1|auto_generated|divider|divider|StageOut[50]~43_combout\) # (\Div1|auto_generated|divider|divider|StageOut[50]~42_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[50]~43_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[50]~42_combout\,
	datad => VCC,
	combout => \Div1|auto_generated|divider|divider|add_sub_11_result_int[1]~0_combout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_11_result_int[1]~1\);

-- Location: LCCOMB_X14_Y8_N6
\Div1|auto_generated|divider|divider|add_sub_11_result_int[4]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_11_result_int[4]~7_cout\ = CARRY((!\Div1|auto_generated|divider|divider|StageOut[53]~37_combout\ & (!\Div1|auto_generated|divider|divider|StageOut[53]~36_combout\ & 
-- !\Div1|auto_generated|divider|divider|add_sub_11_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[53]~37_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[53]~36_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_11_result_int[3]~5\,
	cout => \Div1|auto_generated|divider|divider|add_sub_11_result_int[4]~7_cout\);

-- Location: LCCOMB_X14_Y8_N8
\Div1|auto_generated|divider|divider|add_sub_11_result_int[5]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_11_result_int[5]~8_combout\ = \Div1|auto_generated|divider|divider|add_sub_11_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div1|auto_generated|divider|divider|add_sub_11_result_int[4]~7_cout\,
	combout => \Div1|auto_generated|divider|divider|add_sub_11_result_int[5]~8_combout\);

-- Location: LCCOMB_X13_Y8_N14
\Div1|auto_generated|divider|divider|StageOut[57]~57\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[57]~57_combout\ = (\Div1|auto_generated|divider|divider|add_sub_11_result_int[5]~8_combout\ & ((\Div1|auto_generated|divider|divider|add_sub_10_result_int[5]~8_combout\ & 
-- ((!\Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\))) # (!\Div1|auto_generated|divider|divider|add_sub_10_result_int[5]~8_combout\ & (\Div1|auto_generated|divider|divider|add_sub_10_result_int[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_10_result_int[5]~8_combout\,
	datab => \Div1|auto_generated|divider|divider|add_sub_10_result_int[1]~0_combout\,
	datac => \Div1|auto_generated|divider|divider|add_sub_11_result_int[5]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_9_result_int[9]~16_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[57]~57_combout\);

-- Location: LCCOMB_X14_Y8_N30
\Div1|auto_generated|divider|divider|StageOut[56]~46\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[56]~46_combout\ = (!\Div1|auto_generated|divider|divider|add_sub_11_result_int[5]~8_combout\ & \Div1|auto_generated|divider|divider|add_sub_11_result_int[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div1|auto_generated|divider|divider|add_sub_11_result_int[5]~8_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_11_result_int[1]~0_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[56]~46_combout\);

-- Location: LCCOMB_X13_Y8_N10
\Div1|auto_generated|divider|divider|add_sub_11_result_int[0]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_11_result_int[0]~10_combout\ = !\Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\,
	combout => \Div1|auto_generated|divider|divider|add_sub_11_result_int[0]~10_combout\);

-- Location: LCCOMB_X13_Y8_N22
\Div1|auto_generated|divider|divider|StageOut[55]~48\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[55]~48_combout\ = (!\Div1|auto_generated|divider|divider|add_sub_11_result_int[5]~8_combout\ & \Div1|auto_generated|divider|divider|add_sub_11_result_int[0]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div1|auto_generated|divider|divider|add_sub_11_result_int[5]~8_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_11_result_int[0]~10_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[55]~48_combout\);

-- Location: LCCOMB_X13_Y8_N4
\Div1|auto_generated|divider|divider|add_sub_12_result_int[3]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_12_result_int[3]~4_combout\ = (\Div1|auto_generated|divider|divider|add_sub_12_result_int[2]~3\ & (((\Div1|auto_generated|divider|divider|StageOut[57]~45_combout\) # 
-- (\Div1|auto_generated|divider|divider|StageOut[57]~57_combout\)))) # (!\Div1|auto_generated|divider|divider|add_sub_12_result_int[2]~3\ & ((((\Div1|auto_generated|divider|divider|StageOut[57]~45_combout\) # 
-- (\Div1|auto_generated|divider|divider|StageOut[57]~57_combout\)))))
-- \Div1|auto_generated|divider|divider|add_sub_12_result_int[3]~5\ = CARRY((!\Div1|auto_generated|divider|divider|add_sub_12_result_int[2]~3\ & ((\Div1|auto_generated|divider|divider|StageOut[57]~45_combout\) # 
-- (\Div1|auto_generated|divider|divider|StageOut[57]~57_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[57]~45_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[57]~57_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_12_result_int[2]~3\,
	combout => \Div1|auto_generated|divider|divider|add_sub_12_result_int[3]~4_combout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_12_result_int[3]~5\);

-- Location: LCCOMB_X13_Y8_N28
\Div1|auto_generated|divider|divider|StageOut[58]~56\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[58]~56_combout\ = (\Div1|auto_generated|divider|divider|add_sub_11_result_int[5]~8_combout\ & ((\Div1|auto_generated|divider|divider|add_sub_10_result_int[5]~8_combout\ & 
-- ((!\Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\))) # (!\Div1|auto_generated|divider|divider|add_sub_10_result_int[5]~8_combout\ & (\Div1|auto_generated|divider|divider|add_sub_10_result_int[2]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_10_result_int[5]~8_combout\,
	datab => \Div1|auto_generated|divider|divider|add_sub_10_result_int[2]~2_combout\,
	datac => \Div1|auto_generated|divider|divider|add_sub_11_result_int[5]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_8_result_int[9]~16_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[58]~56_combout\);

-- Location: LCCOMB_X13_Y8_N6
\Div1|auto_generated|divider|divider|add_sub_12_result_int[4]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_12_result_int[4]~7_cout\ = CARRY((!\Div1|auto_generated|divider|divider|StageOut[58]~44_combout\ & (!\Div1|auto_generated|divider|divider|StageOut[58]~56_combout\ & 
-- !\Div1|auto_generated|divider|divider|add_sub_12_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[58]~44_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[58]~56_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_12_result_int[3]~5\,
	cout => \Div1|auto_generated|divider|divider|add_sub_12_result_int[4]~7_cout\);

-- Location: LCCOMB_X13_Y8_N8
\Div1|auto_generated|divider|divider|add_sub_12_result_int[5]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_12_result_int[5]~8_combout\ = \Div1|auto_generated|divider|divider|add_sub_12_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div1|auto_generated|divider|divider|add_sub_12_result_int[4]~7_cout\,
	combout => \Div1|auto_generated|divider|divider|add_sub_12_result_int[5]~8_combout\);

-- Location: LCCOMB_X13_Y8_N12
\Div1|auto_generated|divider|divider|StageOut[63]~49\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[63]~49_combout\ = (\Div1|auto_generated|divider|divider|add_sub_12_result_int[3]~4_combout\ & !\Div1|auto_generated|divider|divider|add_sub_12_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div1|auto_generated|divider|divider|add_sub_12_result_int[3]~4_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_12_result_int[5]~8_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[63]~49_combout\);

-- Location: LCCOMB_X14_Y8_N18
\Div1|auto_generated|divider|divider|add_sub_10_result_int[0]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_10_result_int[0]~10_combout\ = !\Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\,
	combout => \Div1|auto_generated|divider|divider|add_sub_10_result_int[0]~10_combout\);

-- Location: LCCOMB_X13_Y8_N24
\Div1|auto_generated|divider|divider|StageOut[56]~58\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[56]~58_combout\ = (\Div1|auto_generated|divider|divider|add_sub_11_result_int[5]~8_combout\ & ((\Div1|auto_generated|divider|divider|add_sub_10_result_int[5]~8_combout\ & 
-- (!\Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\)) # (!\Div1|auto_generated|divider|divider|add_sub_10_result_int[5]~8_combout\ & ((\Div1|auto_generated|divider|divider|add_sub_10_result_int[0]~10_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_10_result_int[5]~8_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\,
	datac => \Div1|auto_generated|divider|divider|add_sub_11_result_int[5]~8_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_10_result_int[0]~10_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[56]~58_combout\);

-- Location: LCCOMB_X13_Y8_N30
\Div1|auto_generated|divider|divider|StageOut[62]~55\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[62]~55_combout\ = (\Div1|auto_generated|divider|divider|add_sub_12_result_int[5]~8_combout\ & ((\Div1|auto_generated|divider|divider|StageOut[56]~58_combout\) # 
-- ((!\Div1|auto_generated|divider|divider|add_sub_11_result_int[5]~8_combout\ & \Div1|auto_generated|divider|divider|add_sub_11_result_int[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_11_result_int[5]~8_combout\,
	datab => \Div1|auto_generated|divider|divider|add_sub_11_result_int[1]~0_combout\,
	datac => \Div1|auto_generated|divider|divider|add_sub_12_result_int[5]~8_combout\,
	datad => \Div1|auto_generated|divider|divider|StageOut[56]~58_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[62]~55_combout\);

-- Location: LCCOMB_X13_Y8_N18
\Div1|auto_generated|divider|divider|StageOut[61]~59\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[61]~59_combout\ = (\Div1|auto_generated|divider|divider|add_sub_12_result_int[5]~8_combout\ & ((\Div1|auto_generated|divider|divider|add_sub_11_result_int[5]~8_combout\ & 
-- ((!\Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\))) # (!\Div1|auto_generated|divider|divider|add_sub_11_result_int[5]~8_combout\ & (\Div1|auto_generated|divider|divider|add_sub_11_result_int[0]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_11_result_int[0]~10_combout\,
	datab => \Div1|auto_generated|divider|divider|add_sub_11_result_int[5]~8_combout\,
	datac => \Div1|auto_generated|divider|divider|add_sub_12_result_int[5]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[61]~59_combout\);

-- Location: LCCOMB_X12_Y8_N28
\Div1|auto_generated|divider|divider|StageOut[60]~52\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[60]~52_combout\ = (\Div1|auto_generated|divider|divider|add_sub_12_result_int[5]~8_combout\ & !\Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div1|auto_generated|divider|divider|add_sub_12_result_int[5]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[60]~52_combout\);

-- Location: LCCOMB_X12_Y8_N16
\Div1|auto_generated|divider|divider|add_sub_13_result_int[1]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_13_result_int[1]~1_cout\ = CARRY((\Div1|auto_generated|divider|divider|StageOut[60]~53_combout\) # (\Div1|auto_generated|divider|divider|StageOut[60]~52_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[60]~53_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[60]~52_combout\,
	datad => VCC,
	cout => \Div1|auto_generated|divider|divider|add_sub_13_result_int[1]~1_cout\);

-- Location: LCCOMB_X12_Y8_N18
\Div1|auto_generated|divider|divider|add_sub_13_result_int[2]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_13_result_int[2]~3_cout\ = CARRY((!\Div1|auto_generated|divider|divider|StageOut[61]~51_combout\ & (!\Div1|auto_generated|divider|divider|StageOut[61]~59_combout\ & 
-- !\Div1|auto_generated|divider|divider|add_sub_13_result_int[1]~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[61]~51_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[61]~59_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_13_result_int[1]~1_cout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_13_result_int[2]~3_cout\);

-- Location: LCCOMB_X12_Y8_N20
\Div1|auto_generated|divider|divider|add_sub_13_result_int[3]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_13_result_int[3]~5_cout\ = CARRY((!\Div1|auto_generated|divider|divider|add_sub_13_result_int[2]~3_cout\ & ((\Div1|auto_generated|divider|divider|StageOut[62]~50_combout\) # 
-- (\Div1|auto_generated|divider|divider|StageOut[62]~55_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[62]~50_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[62]~55_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_13_result_int[2]~3_cout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_13_result_int[3]~5_cout\);

-- Location: LCCOMB_X12_Y8_N22
\Div1|auto_generated|divider|divider|add_sub_13_result_int[4]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_13_result_int[4]~7_cout\ = CARRY((!\Div1|auto_generated|divider|divider|StageOut[63]~54_combout\ & (!\Div1|auto_generated|divider|divider|StageOut[63]~49_combout\ & 
-- !\Div1|auto_generated|divider|divider|add_sub_13_result_int[3]~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[63]~54_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[63]~49_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_13_result_int[3]~5_cout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_13_result_int[4]~7_cout\);

-- Location: LCCOMB_X12_Y8_N24
\Div1|auto_generated|divider|divider|add_sub_13_result_int[5]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_13_result_int[5]~8_combout\ = \Div1|auto_generated|divider|divider|add_sub_13_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div1|auto_generated|divider|divider|add_sub_13_result_int[4]~7_cout\,
	combout => \Div1|auto_generated|divider|divider|add_sub_13_result_int[5]~8_combout\);

-- Location: LCCOMB_X12_Y8_N4
\time1~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \time1~6_combout\ = (!\LessThan2~3_combout\ & (!\Div1|auto_generated|divider|divider|add_sub_13_result_int[5]~8_combout\ & \charge_start~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~3_combout\,
	datac => \Div1|auto_generated|divider|divider|add_sub_13_result_int[5]~8_combout\,
	datad => \charge_start~regout\,
	combout => \time1~6_combout\);

-- Location: LCFF_X12_Y8_N13
\time1[0]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \time1[0]~0_combout\,
	sdata => \time1~6_combout\,
	sload => \state.s2~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \time1[0]~reg0_regout\);

-- Location: LCCOMB_X8_Y11_N8
\always0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \always0~4_combout\ = (\time1[2]~reg0_regout\) # ((\always0~3_combout\) # ((\always0~2_combout\) # (\time1[0]~reg0_regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \time1[2]~reg0_regout\,
	datab => \always0~3_combout\,
	datac => \always0~2_combout\,
	datad => \time1[0]~reg0_regout\,
	combout => \always0~4_combout\);

-- Location: LCCOMB_X8_Y11_N14
\count10s[8]~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \count10s[8]~20_combout\ = (\count10s[8]~19_combout\) # ((!\always0~1_combout\ & (!\always0~0_combout\ & !\always0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \always0~1_combout\,
	datab => \always0~0_combout\,
	datac => \always0~4_combout\,
	datad => \count10s[8]~19_combout\,
	combout => \count10s[8]~20_combout\);

-- Location: LCFF_X9_Y11_N9
\count10s[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \count10s[0]~13_combout\,
	sclr => \count10s[8]~19_combout\,
	ena => \count10s[8]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count10s(0));

-- Location: LCCOMB_X9_Y11_N14
\count10s[3]~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \count10s[3]~21_combout\ = (count10s(3) & (!\count10s[2]~18\)) # (!count10s(3) & ((\count10s[2]~18\) # (GND)))
-- \count10s[3]~22\ = CARRY((!\count10s[2]~18\) # (!count10s(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count10s(3),
	datad => VCC,
	cin => \count10s[2]~18\,
	combout => \count10s[3]~21_combout\,
	cout => \count10s[3]~22\);

-- Location: LCFF_X9_Y11_N15
\count10s[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \count10s[3]~21_combout\,
	sclr => \count10s[8]~19_combout\,
	ena => \count10s[8]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count10s(3));

-- Location: LCCOMB_X9_Y11_N18
\count10s[5]~25\ : cycloneii_lcell_comb
-- Equation(s):
-- \count10s[5]~25_combout\ = (count10s(5) & (!\count10s[4]~24\)) # (!count10s(5) & ((\count10s[4]~24\) # (GND)))
-- \count10s[5]~26\ = CARRY((!\count10s[4]~24\) # (!count10s(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count10s(5),
	datad => VCC,
	cin => \count10s[4]~24\,
	combout => \count10s[5]~25_combout\,
	cout => \count10s[5]~26\);

-- Location: LCFF_X9_Y11_N19
\count10s[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \count10s[5]~25_combout\,
	sclr => \count10s[8]~19_combout\,
	ena => \count10s[8]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count10s(5));

-- Location: LCCOMB_X9_Y11_N22
\count10s[7]~29\ : cycloneii_lcell_comb
-- Equation(s):
-- \count10s[7]~29_combout\ = (count10s(7) & (!\count10s[6]~28\)) # (!count10s(7) & ((\count10s[6]~28\) # (GND)))
-- \count10s[7]~30\ = CARRY((!\count10s[6]~28\) # (!count10s(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count10s(7),
	datad => VCC,
	cin => \count10s[6]~28\,
	combout => \count10s[7]~29_combout\,
	cout => \count10s[7]~30\);

-- Location: LCFF_X9_Y11_N23
\count10s[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \count10s[7]~29_combout\,
	sclr => \count10s[8]~19_combout\,
	ena => \count10s[8]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count10s(7));

-- Location: LCCOMB_X9_Y11_N26
\count10s[9]~33\ : cycloneii_lcell_comb
-- Equation(s):
-- \count10s[9]~33_combout\ = (count10s(9) & (!\count10s[8]~32\)) # (!count10s(9) & ((\count10s[8]~32\) # (GND)))
-- \count10s[9]~34\ = CARRY((!\count10s[8]~32\) # (!count10s(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count10s(9),
	datad => VCC,
	cin => \count10s[8]~32\,
	combout => \count10s[9]~33_combout\,
	cout => \count10s[9]~34\);

-- Location: LCFF_X9_Y11_N27
\count10s[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \count10s[9]~33_combout\,
	sclr => \count10s[8]~19_combout\,
	ena => \count10s[8]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count10s(9));

-- Location: LCCOMB_X9_Y11_N28
\count10s[10]~35\ : cycloneii_lcell_comb
-- Equation(s):
-- \count10s[10]~35_combout\ = (count10s(10) & (\count10s[9]~34\ $ (GND))) # (!count10s(10) & (!\count10s[9]~34\ & VCC))
-- \count10s[10]~36\ = CARRY((count10s(10) & !\count10s[9]~34\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count10s(10),
	datad => VCC,
	cin => \count10s[9]~34\,
	combout => \count10s[10]~35_combout\,
	cout => \count10s[10]~36\);

-- Location: LCFF_X9_Y11_N29
\count10s[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \count10s[10]~35_combout\,
	sclr => \count10s[8]~19_combout\,
	ena => \count10s[8]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count10s(10));

-- Location: LCCOMB_X9_Y11_N30
\count10s[11]~37\ : cycloneii_lcell_comb
-- Equation(s):
-- \count10s[11]~37_combout\ = \count10s[10]~36\ $ (count10s(11))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => count10s(11),
	cin => \count10s[10]~36\,
	combout => \count10s[11]~37_combout\);

-- Location: LCFF_X9_Y11_N31
\count10s[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \count10s[11]~37_combout\,
	sclr => \count10s[8]~19_combout\,
	ena => \count10s[8]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count10s(11));

-- Location: LCCOMB_X9_Y11_N4
\LessThan3~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan3~2_combout\ = ((\LessThan3~1_combout\ & (!count10s(9) & !count10s(10)))) # (!count10s(11))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan3~1_combout\,
	datab => count10s(11),
	datac => count10s(9),
	datad => count10s(10),
	combout => \LessThan3~2_combout\);

-- Location: LCCOMB_X10_Y8_N0
\Selector49~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector49~0_combout\ = (\state.s1~regout\ & ((!\ispressed~combout\) # (!\money1[3]~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \money1[3]~6_combout\,
	datab => \state.s1~regout\,
	datad => \ispressed~combout\,
	combout => \Selector49~0_combout\);

-- Location: LCCOMB_X10_Y8_N4
\Selector49~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector49~3_combout\ = (\ispressed~combout\ & ((\Selector49~2_combout\) # ((\LessThan3~2_combout\ & \Selector49~0_combout\)))) # (!\ispressed~combout\ & (((\LessThan3~2_combout\ & \Selector49~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ispressed~combout\,
	datab => \Selector49~2_combout\,
	datac => \LessThan3~2_combout\,
	datad => \Selector49~0_combout\,
	combout => \Selector49~3_combout\);

-- Location: LCCOMB_X10_Y8_N8
\state.s1~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \state.s1~feeder_combout\ = \Selector49~3_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector49~3_combout\,
	combout => \state.s1~feeder_combout\);

-- Location: LCCOMB_X10_Y8_N20
\charge_start~_wirecell\ : cycloneii_lcell_comb
-- Equation(s):
-- \charge_start~_wirecell_combout\ = !\charge_start~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \charge_start~regout\,
	combout => \charge_start~_wirecell_combout\);

-- Location: LCFF_X10_Y8_N9
\state.s1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \state.s1~feeder_combout\,
	sdata => \charge_start~_wirecell_combout\,
	sload => \state.s2~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \state.s1~regout\);

-- Location: LCCOMB_X8_Y8_N12
\money1[0]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \money1[0]~3_combout\ = (!\inputbottom~combout\(0) & (\inputbottom~combout\(3) & (\inputbottom~combout\(2) $ (\inputbottom~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inputbottom~combout\(2),
	datab => \inputbottom~combout\(1),
	datac => \inputbottom~combout\(0),
	datad => \inputbottom~combout\(3),
	combout => \money1[0]~3_combout\);

-- Location: LCCOMB_X10_Y8_N26
\money1[0]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \money1[0]~7_combout\ = ((\money1[0]~3_combout\) # (!\ispressed~combout\)) # (!\state.s1~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.s1~regout\,
	datac => \money1[0]~3_combout\,
	datad => \ispressed~combout\,
	combout => \money1[0]~7_combout\);

-- Location: LCCOMB_X10_Y8_N2
\money1[0]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \money1[0]~4_combout\ = ((\state.s2~regout\ & ((\LessThan2~3_combout\) # (!\charge_start~regout\)))) # (!\money1[0]~7_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \charge_start~regout\,
	datab => \money1[0]~7_combout\,
	datac => \LessThan2~3_combout\,
	datad => \state.s2~regout\,
	combout => \money1[0]~4_combout\);

-- Location: LCFF_X8_Y8_N3
\money0[0]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector36~0_combout\,
	ena => \money1[0]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \money0[0]~reg0_regout\);

-- Location: LCCOMB_X8_Y9_N28
\Add0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~3_combout\ = (\money0[2]~reg0_regout\ & ((\money0[1]~reg0_regout\ & ((\money0[0]~reg0_regout\) # (\money0[3]~reg0_regout\))) # (!\money0[1]~reg0_regout\ & (\money0[0]~reg0_regout\ & \money0[3]~reg0_regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \money0[1]~reg0_regout\,
	datab => \money0[0]~reg0_regout\,
	datac => \money0[3]~reg0_regout\,
	datad => \money0[2]~reg0_regout\,
	combout => \Add0~3_combout\);

-- Location: LCCOMB_X8_Y9_N26
\Add0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (\money0[1]~reg0_regout\ & ((\money0[3]~reg0_regout\) # ((\money0[0]~reg0_regout\ & \money0[2]~reg0_regout\)))) # (!\money0[1]~reg0_regout\ & (\money0[0]~reg0_regout\ & (\money0[3]~reg0_regout\ & \money0[2]~reg0_regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \money0[1]~reg0_regout\,
	datab => \money0[0]~reg0_regout\,
	datac => \money0[3]~reg0_regout\,
	datad => \money0[2]~reg0_regout\,
	combout => \Add0~2_combout\);

-- Location: LCCOMB_X8_Y9_N30
\Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = \money0[1]~reg0_regout\ $ (\money0[3]~reg0_regout\ $ (((\money0[0]~reg0_regout\ & \money0[2]~reg0_regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \money0[1]~reg0_regout\,
	datab => \money0[0]~reg0_regout\,
	datac => \money0[3]~reg0_regout\,
	datad => \money0[2]~reg0_regout\,
	combout => \Add0~0_combout\);

-- Location: LCCOMB_X8_Y9_N2
\Add1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~0_combout\ = (\inputbottom~combout\(1) & (\money0[0]~reg0_regout\ $ (VCC))) # (!\inputbottom~combout\(1) & (\money0[0]~reg0_regout\ & VCC))
-- \Add1~1\ = CARRY((\inputbottom~combout\(1) & \money0[0]~reg0_regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inputbottom~combout\(1),
	datab => \money0[0]~reg0_regout\,
	datad => VCC,
	combout => \Add1~0_combout\,
	cout => \Add1~1\);

-- Location: LCCOMB_X8_Y9_N4
\Add1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~2_combout\ = (\inputbottom~combout\(2) & ((\money0[1]~reg0_regout\ & (\Add1~1\ & VCC)) # (!\money0[1]~reg0_regout\ & (!\Add1~1\)))) # (!\inputbottom~combout\(2) & ((\money0[1]~reg0_regout\ & (!\Add1~1\)) # (!\money0[1]~reg0_regout\ & ((\Add1~1\) # 
-- (GND)))))
-- \Add1~3\ = CARRY((\inputbottom~combout\(2) & (!\money0[1]~reg0_regout\ & !\Add1~1\)) # (!\inputbottom~combout\(2) & ((!\Add1~1\) # (!\money0[1]~reg0_regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inputbottom~combout\(2),
	datab => \money0[1]~reg0_regout\,
	datad => VCC,
	cin => \Add1~1\,
	combout => \Add1~2_combout\,
	cout => \Add1~3\);

-- Location: LCCOMB_X8_Y9_N8
\Add1~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~6_combout\ = (\Add0~0_combout\ & (!\Add1~5\)) # (!\Add0~0_combout\ & ((\Add1~5\) # (GND)))
-- \Add1~7\ = CARRY((!\Add1~5\) # (!\Add0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~0_combout\,
	datad => VCC,
	cin => \Add1~5\,
	combout => \Add1~6_combout\,
	cout => \Add1~7\);

-- Location: LCCOMB_X8_Y9_N10
\Add1~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~8_combout\ = (\Add1~7\ & ((\money0[2]~reg0_regout\ $ (\Add0~2_combout\)))) # (!\Add1~7\ & (\money0[2]~reg0_regout\ $ (\Add0~2_combout\ $ (VCC))))
-- \Add1~9\ = CARRY((!\Add1~7\ & (\money0[2]~reg0_regout\ $ (\Add0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100000110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \money0[2]~reg0_regout\,
	datab => \Add0~2_combout\,
	datad => VCC,
	cin => \Add1~7\,
	combout => \Add1~8_combout\,
	cout => \Add1~9\);

-- Location: LCCOMB_X8_Y9_N14
\Add1~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~12_combout\ = \Add1~11\ $ (((!\Add0~3_combout\) # (!\money0[3]~reg0_regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \money0[3]~reg0_regout\,
	datad => \Add0~3_combout\,
	cin => \Add1~11\,
	combout => \Add1~12_combout\);

-- Location: LCCOMB_X8_Y9_N22
\LessThan0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = (\inputbottom~combout\(0)) # (\Add1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inputbottom~combout\(0),
	datad => \Add1~0_combout\,
	combout => \LessThan0~0_combout\);

-- Location: LCCOMB_X8_Y9_N20
\LessThan0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan0~1_combout\ = (\Add1~6_combout\ & ((\Add1~4_combout\) # ((\Add1~2_combout\ & \LessThan0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~4_combout\,
	datab => \Add1~2_combout\,
	datac => \Add1~6_combout\,
	datad => \LessThan0~0_combout\,
	combout => \LessThan0~1_combout\);

-- Location: LCCOMB_X8_Y9_N18
\LessThan0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan0~2_combout\ = (\Add1~10_combout\) # ((\Add1~12_combout\) # ((\LessThan0~1_combout\) # (\Add1~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~10_combout\,
	datab => \Add1~12_combout\,
	datac => \LessThan0~1_combout\,
	datad => \Add1~8_combout\,
	combout => \LessThan0~2_combout\);

-- Location: LCCOMB_X8_Y11_N28
\Selector32~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector32~0_combout\ = (\money0[0]~reg0_regout\ & (!\LessThan0~2_combout\ & ((\money1[0]~2_combout\) # (!\inputbottom~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \money0[0]~reg0_regout\,
	datab => \inputbottom~combout\(3),
	datac => \LessThan0~2_combout\,
	datad => \money1[0]~2_combout\,
	combout => \Selector32~0_combout\);

-- Location: LCFF_X8_Y11_N29
\money1[0]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector32~0_combout\,
	sclr => \state.s2~regout\,
	ena => \money1[0]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \money1[0]~reg0_regout\);

-- Location: LCCOMB_X8_Y11_N12
\Selector29~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector29~0_combout\ = (!\state.s2~regout\ & (!\LessThan0~2_combout\ & (\money1[3]~6_combout\ & \money0[3]~reg0_regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.s2~regout\,
	datab => \LessThan0~2_combout\,
	datac => \money1[3]~6_combout\,
	datad => \money0[3]~reg0_regout\,
	combout => \Selector29~0_combout\);

-- Location: LCFF_X8_Y11_N13
\money1[3]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector29~0_combout\,
	ena => \money1[0]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \money1[3]~reg0_regout\);

-- Location: LCCOMB_X8_Y8_N30
\Selector32~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector32~1_combout\ = (!\inputbottom~combout\(2) & (\inputbottom~combout\(1) & (\inputbottom~combout\(0) & \inputbottom~combout\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inputbottom~combout\(2),
	datab => \inputbottom~combout\(1),
	datac => \inputbottom~combout\(0),
	datad => \inputbottom~combout\(3),
	combout => \Selector32~1_combout\);

-- Location: LCCOMB_X9_Y8_N0
\Selector39~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector39~0_combout\ = (\state.s2~regout\ & (((\Selector43~0_combout\)))) # (!\state.s2~regout\ & ((\LessThan0~2_combout\) # ((\Selector32~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~2_combout\,
	datab => \Selector43~0_combout\,
	datac => \Selector32~1_combout\,
	datad => \state.s2~regout\,
	combout => \Selector39~0_combout\);

-- Location: LCCOMB_X12_Y8_N14
\Selector39~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector39~1_combout\ = (!\Selector39~0_combout\ & ((\state.s2~regout\ & ((!\Div1|auto_generated|divider|divider|add_sub_12_result_int[5]~8_combout\))) # (!\state.s2~regout\ & (\money0[0]~reg0_regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.s2~regout\,
	datab => \money0[0]~reg0_regout\,
	datac => \Div1|auto_generated|divider|divider|add_sub_12_result_int[5]~8_combout\,
	datad => \Selector39~0_combout\,
	combout => \Selector39~1_combout\);

-- Location: LCCOMB_X10_Y8_N6
\time1[1]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \time1[1]~4_combout\ = (\state.s0~regout\ & (((!\money1[0]~3_combout\ & \ispressed~combout\)) # (!\state.s1~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.s0~regout\,
	datab => \state.s1~regout\,
	datac => \money1[0]~3_combout\,
	datad => \ispressed~combout\,
	combout => \time1[1]~4_combout\);

-- Location: LCFF_X12_Y8_N15
\time1[1]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector39~1_combout\,
	ena => \time1[1]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \time1[1]~reg0_regout\);

-- Location: LCCOMB_X9_Y8_N28
\time1[2]~reg0feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \time1[2]~reg0feeder_combout\ = \time1[2]~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \time1[2]~1_combout\,
	combout => \time1[2]~reg0feeder_combout\);

-- Location: LCCOMB_X9_Y8_N4
\Selector38~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector38~2_combout\ = (\charge_start~regout\ & (!\LessThan2~3_combout\ & !\Div1|auto_generated|divider|divider|add_sub_11_result_int[5]~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \charge_start~regout\,
	datac => \LessThan2~3_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_11_result_int[5]~8_combout\,
	combout => \Selector38~2_combout\);

-- Location: LCFF_X9_Y8_N29
\time1[2]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \time1[2]~reg0feeder_combout\,
	sdata => \Selector38~2_combout\,
	sload => \state.s2~regout\,
	ena => \time1[1]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \time1[2]~reg0_regout\);

-- Location: LCCOMB_X9_Y8_N2
\Selector37~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector37~0_combout\ = (!\Selector39~0_combout\ & ((\state.s2~regout\ & (!\Div1|auto_generated|divider|divider|add_sub_10_result_int[5]~8_combout\)) # (!\state.s2~regout\ & ((\money0[2]~reg0_regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_10_result_int[5]~8_combout\,
	datab => \Selector39~0_combout\,
	datac => \money0[2]~reg0_regout\,
	datad => \state.s2~regout\,
	combout => \Selector37~0_combout\);

-- Location: LCFF_X9_Y8_N3
\time1[3]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector37~0_combout\,
	ena => \time1[1]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \time1[3]~reg0_regout\);

-- Location: LCCOMB_X9_Y8_N22
\Selector43~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector43~2_combout\ = (\state.s2~regout\ & (((\Selector43~0_combout\)))) # (!\state.s2~regout\ & (((\LessThan0~2_combout\)) # (!\money1[3]~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \money1[3]~6_combout\,
	datab => \Selector43~0_combout\,
	datac => \LessThan0~2_combout\,
	datad => \state.s2~regout\,
	combout => \Selector43~2_combout\);

-- Location: LCCOMB_X8_Y8_N22
\Selector43~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector43~1_combout\ = (\inputbottom~combout\(2) & (!\inputbottom~combout\(0) & ((\inputbottom~combout\(1)) # (\inputbottom~combout\(3))))) # (!\inputbottom~combout\(2) & ((\inputbottom~combout\(0) $ (\inputbottom~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111101011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inputbottom~combout\(2),
	datab => \inputbottom~combout\(1),
	datac => \inputbottom~combout\(0),
	datad => \inputbottom~combout\(3),
	combout => \Selector43~1_combout\);

-- Location: LCCOMB_X9_Y8_N12
\Add8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add8~0_combout\ = (\time1[0]~reg0_regout\ & (\Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\ $ (GND))) # (!\time1[0]~reg0_regout\ & ((GND) # (!\Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\)))
-- \Add8~1\ = CARRY((!\Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\) # (!\time1[0]~reg0_regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \time1[0]~reg0_regout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_12_result_int[9]~16_combout\,
	datad => VCC,
	combout => \Add8~0_combout\,
	cout => \Add8~1\);

-- Location: LCCOMB_X9_Y8_N24
\Selector43~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector43~3_combout\ = (!\Selector43~2_combout\ & ((\state.s2~regout\ & ((\Add8~0_combout\))) # (!\state.s2~regout\ & (\Selector43~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.s2~regout\,
	datab => \Selector43~2_combout\,
	datac => \Selector43~1_combout\,
	datad => \Add8~0_combout\,
	combout => \Selector43~3_combout\);

-- Location: LCFF_X9_Y8_N25
\time0[1]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector43~3_combout\,
	ena => \time1[1]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \time0[1]~reg0_regout\);

-- Location: LCCOMB_X9_Y8_N14
\Add8~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add8~2_combout\ = (\time1[1]~reg0_regout\ & ((\Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\ & ((\Add8~1\) # (GND))) # (!\Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\ & (!\Add8~1\)))) # 
-- (!\time1[1]~reg0_regout\ & ((\Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\ & (!\Add8~1\)) # (!\Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\ & (\Add8~1\ & VCC))))
-- \Add8~3\ = CARRY((\time1[1]~reg0_regout\ & ((\Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\) # (!\Add8~1\))) # (!\time1[1]~reg0_regout\ & (\Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\ & !\Add8~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \time1[1]~reg0_regout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_11_result_int[9]~16_combout\,
	datad => VCC,
	cin => \Add8~1\,
	combout => \Add8~2_combout\,
	cout => \Add8~3\);

-- Location: LCCOMB_X8_Y8_N16
\Selector42~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector42~0_combout\ = (\inputbottom~combout\(1) & ((\inputbottom~combout\(0)) # ((!\inputbottom~combout\(2) & !\inputbottom~combout\(3))))) # (!\inputbottom~combout\(1) & (((!\inputbottom~combout\(0) & \inputbottom~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inputbottom~combout\(2),
	datab => \inputbottom~combout\(1),
	datac => \inputbottom~combout\(0),
	datad => \inputbottom~combout\(3),
	combout => \Selector42~0_combout\);

-- Location: LCCOMB_X9_Y8_N18
\Selector42~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector42~1_combout\ = (!\Selector43~2_combout\ & ((\state.s2~regout\ & (\Add8~2_combout\)) # (!\state.s2~regout\ & ((\Selector42~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.s2~regout\,
	datab => \Selector43~2_combout\,
	datac => \Add8~2_combout\,
	datad => \Selector42~0_combout\,
	combout => \Selector42~1_combout\);

-- Location: LCFF_X9_Y8_N19
\time0[2]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector42~1_combout\,
	ena => \time1[1]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \time0[2]~reg0_regout\);

-- Location: LCCOMB_X9_Y8_N8
\Add7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add7~0_combout\ = \time1[2]~reg0_regout\ $ (\time1[0]~reg0_regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \time1[2]~reg0_regout\,
	datad => \time1[0]~reg0_regout\,
	combout => \Add7~0_combout\);

-- Location: LCCOMB_X9_Y8_N16
\Add8~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add8~4_combout\ = \Add7~0_combout\ $ (\Add8~3\ $ (!\Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add7~0_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_10_result_int[9]~16_combout\,
	cin => \Add8~3\,
	combout => \Add8~4_combout\);

-- Location: LCCOMB_X9_Y8_N6
\Selector41~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector41~4_combout\ = (\charge_start~regout\ & (!\LessThan2~3_combout\ & (\Add8~4_combout\ & \state.s2~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \charge_start~regout\,
	datab => \LessThan2~3_combout\,
	datac => \Add8~4_combout\,
	datad => \state.s2~regout\,
	combout => \Selector41~4_combout\);

-- Location: LCCOMB_X9_Y8_N20
\Selector41~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector41~3_combout\ = (\Selector41~4_combout\) # ((\Selector41~2_combout\ & (!\state.s2~regout\ & !\LessThan0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector41~2_combout\,
	datab => \state.s2~regout\,
	datac => \LessThan0~2_combout\,
	datad => \Selector41~4_combout\,
	combout => \Selector41~3_combout\);

-- Location: LCFF_X9_Y8_N21
\time0[3]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector41~3_combout\,
	ena => \time1[1]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \time0[3]~reg0_regout\);

-- Location: LCCOMB_X10_Y8_N24
\Selector48~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector48~1_combout\ = (!\Selector48~0_combout\ & ((\LessThan3~2_combout\) # (!\Selector49~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector48~0_combout\,
	datac => \LessThan3~2_combout\,
	datad => \Selector49~0_combout\,
	combout => \Selector48~1_combout\);

-- Location: LCFF_X10_Y8_N25
\state.s0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Selector48~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \state.s0~regout\);

-- Location: LCCOMB_X10_Y8_N14
\enable~reg0feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \enable~reg0feeder_combout\ = \state.s0~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state.s0~regout\,
	combout => \enable~reg0feeder_combout\);

-- Location: LCFF_X10_Y8_N15
\enable~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \enable~reg0feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \enable~reg0_regout\);

-- Location: PIN_14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\money1[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \money1[0]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_money1(0));

-- Location: PIN_13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\money1[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \money1[1]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_money1(1));

-- Location: PIN_12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\money1[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \money1[2]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_money1(2));

-- Location: PIN_15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\money1[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \money1[3]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_money1(3));

-- Location: PIN_191,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\money0[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \money0[0]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_money0(0));

-- Location: PIN_195,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\money0[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \money0[1]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_money0(1));

-- Location: PIN_193,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\money0[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \money0[2]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_money0(2));

-- Location: PIN_199,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\money0[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \money0[3]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_money0(3));

-- Location: PIN_185,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\time1[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \time1[0]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_time1(0));

-- Location: PIN_70,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\time1[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \time1[1]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_time1(1));

-- Location: PIN_197,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\time1[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \time1[2]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_time1(2));

-- Location: PIN_69,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\time1[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \time1[3]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_time1(3));

-- Location: PIN_203,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\time0[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \time0[0]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_time0(0));

-- Location: PIN_198,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\time0[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \time0[1]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_time0(1));

-- Location: PIN_72,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\time0[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \time0[2]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_time0(2));

-- Location: PIN_68,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\time0[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \time0[3]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_time0(3));

-- Location: PIN_189,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\enable~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \enable~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_enable);
END structure;


