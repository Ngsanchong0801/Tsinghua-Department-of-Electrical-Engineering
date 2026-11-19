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

-- DATE "05/23/2024 13:11:15"

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

ENTITY 	EDA3_coincharger IS
    PORT (
	OA : OUT std_logic;
	CLK : IN std_logic;
	c3 : IN std_logic;
	c2 : IN std_logic;
	c1 : IN std_logic;
	c0 : IN std_logic;
	OB : OUT std_logic;
	OC : OUT std_logic;
	OD : OUT std_logic;
	OE : OUT std_logic;
	\OF\ : OUT std_logic;
	OG : OUT std_logic;
	DIG0 : OUT std_logic;
	DIG1 : OUT std_logic;
	DIG2 : OUT std_logic;
	DIG3 : OUT std_logic;
	r : OUT std_logic_vector(3 DOWNTO 0)
	);
END EDA3_coincharger;

-- Design Ports Information
-- OA	=>  Location: PIN_44,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- OB	=>  Location: PIN_40,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- OC	=>  Location: PIN_45,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- OD	=>  Location: PIN_47,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- OE	=>  Location: PIN_48,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- OF	=>  Location: PIN_41,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- OG	=>  Location: PIN_43,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- DIG0	=>  Location: PIN_35,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- DIG1	=>  Location: PIN_36,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- DIG2	=>  Location: PIN_37,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- DIG3	=>  Location: PIN_39,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- r[3]	=>  Location: PIN_34,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- r[2]	=>  Location: PIN_33,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- r[1]	=>  Location: PIN_32,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- r[0]	=>  Location: PIN_31,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- CLK	=>  Location: PIN_132,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- c0	=>  Location: PIN_13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- c1	=>  Location: PIN_14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- c2	=>  Location: PIN_15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- c3	=>  Location: PIN_30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF EDA3_coincharger IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_OA : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL ww_c3 : std_logic;
SIGNAL ww_c2 : std_logic;
SIGNAL ww_c1 : std_logic;
SIGNAL ww_c0 : std_logic;
SIGNAL ww_OB : std_logic;
SIGNAL ww_OC : std_logic;
SIGNAL ww_OD : std_logic;
SIGNAL ww_OE : std_logic;
SIGNAL \ww_OF\ : std_logic;
SIGNAL ww_OG : std_logic;
SIGNAL ww_DIG0 : std_logic;
SIGNAL ww_DIG1 : std_logic;
SIGNAL ww_DIG2 : std_logic;
SIGNAL ww_DIG3 : std_logic;
SIGNAL ww_r : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst2|clk_250Hz~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CLK~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst2|Add0~0_combout\ : std_logic;
SIGNAL \inst2|Add0~4_combout\ : std_logic;
SIGNAL \inst2|Add0~28_combout\ : std_logic;
SIGNAL \inst2|Add0~30_combout\ : std_logic;
SIGNAL \inst2|Equal0~3_combout\ : std_logic;
SIGNAL \inst4|hold~regout\ : std_logic;
SIGNAL \inst2|count~5_combout\ : std_logic;
SIGNAL \inst4|hold~1_combout\ : std_logic;
SIGNAL \inst4|pressed[1]~1_combout\ : std_logic;
SIGNAL \inst4|Selector3~2_combout\ : std_logic;
SIGNAL \inst4|temp[1]~0_combout\ : std_logic;
SIGNAL \inst4|temp[1]~1_combout\ : std_logic;
SIGNAL \inst4|temp[1]~2_combout\ : std_logic;
SIGNAL \inst4|temp[1]~3_combout\ : std_logic;
SIGNAL \inst4|temp[1]~4_combout\ : std_logic;
SIGNAL \inst4|Selector1~0_combout\ : std_logic;
SIGNAL \inst4|Selector0~3_combout\ : std_logic;
SIGNAL \CLK~combout\ : std_logic;
SIGNAL \CLK~clkctrl_outclk\ : std_logic;
SIGNAL \inst4|inputbottom[1]~feeder_combout\ : std_logic;
SIGNAL \inst2|Add0~1\ : std_logic;
SIGNAL \inst2|Add0~2_combout\ : std_logic;
SIGNAL \inst2|Add0~3\ : std_logic;
SIGNAL \inst2|Add0~5\ : std_logic;
SIGNAL \inst2|Add0~6_combout\ : std_logic;
SIGNAL \inst2|Add0~7\ : std_logic;
SIGNAL \inst2|Add0~9\ : std_logic;
SIGNAL \inst2|Add0~10_combout\ : std_logic;
SIGNAL \inst2|count~3_combout\ : std_logic;
SIGNAL \inst2|Add0~11\ : std_logic;
SIGNAL \inst2|Add0~12_combout\ : std_logic;
SIGNAL \inst2|Add0~13\ : std_logic;
SIGNAL \inst2|Add0~14_combout\ : std_logic;
SIGNAL \inst2|count~2_combout\ : std_logic;
SIGNAL \inst2|Add0~15\ : std_logic;
SIGNAL \inst2|Add0~16_combout\ : std_logic;
SIGNAL \inst2|Add0~17\ : std_logic;
SIGNAL \inst2|Add0~18_combout\ : std_logic;
SIGNAL \inst2|count~1_combout\ : std_logic;
SIGNAL \inst2|Add0~19\ : std_logic;
SIGNAL \inst2|Add0~21\ : std_logic;
SIGNAL \inst2|Add0~22_combout\ : std_logic;
SIGNAL \inst2|Add0~20_combout\ : std_logic;
SIGNAL \inst2|count~4_combout\ : std_logic;
SIGNAL \inst2|Equal0~2_combout\ : std_logic;
SIGNAL \inst2|Equal0~0_combout\ : std_logic;
SIGNAL \inst2|Add0~8_combout\ : std_logic;
SIGNAL \inst2|Equal0~1_combout\ : std_logic;
SIGNAL \inst2|Equal0~4_combout\ : std_logic;
SIGNAL \inst2|Add0~23\ : std_logic;
SIGNAL \inst2|Add0~24_combout\ : std_logic;
SIGNAL \inst2|Add0~25\ : std_logic;
SIGNAL \inst2|Add0~26_combout\ : std_logic;
SIGNAL \inst2|Add0~27\ : std_logic;
SIGNAL \inst2|Add0~29\ : std_logic;
SIGNAL \inst2|Add0~31\ : std_logic;
SIGNAL \inst2|Add0~32_combout\ : std_logic;
SIGNAL \inst2|count~0_combout\ : std_logic;
SIGNAL \inst2|clk_250Hz~0_combout\ : std_logic;
SIGNAL \inst2|clk_250Hz~regout\ : std_logic;
SIGNAL \inst2|clk_250Hz~clkctrl_outclk\ : std_logic;
SIGNAL \inst4|row.s2~feeder_combout\ : std_logic;
SIGNAL \inst4|row.s2~regout\ : std_logic;
SIGNAL \inst4|row.s3~0_combout\ : std_logic;
SIGNAL \inst4|row.s3~regout\ : std_logic;
SIGNAL \inst4|row.s0~0_combout\ : std_logic;
SIGNAL \inst4|row.s0~regout\ : std_logic;
SIGNAL \inst4|row.s1~feeder_combout\ : std_logic;
SIGNAL \inst4|row.s1~regout\ : std_logic;
SIGNAL \inst4|Selector3~0_combout\ : std_logic;
SIGNAL \c0~combout\ : std_logic;
SIGNAL \c3~combout\ : std_logic;
SIGNAL \c2~combout\ : std_logic;
SIGNAL \inst4|Selector3~1_combout\ : std_logic;
SIGNAL \inst4|Selector3~4_combout\ : std_logic;
SIGNAL \inst4|Selector3~3_combout\ : std_logic;
SIGNAL \inst4|Selector3~5_combout\ : std_logic;
SIGNAL \inst4|inputbottom[0]~feeder_combout\ : std_logic;
SIGNAL \inst4|count_1~3_combout\ : std_logic;
SIGNAL \inst4|count_1~2_combout\ : std_logic;
SIGNAL \inst4|count_1~1_combout\ : std_logic;
SIGNAL \inst4|hold~0_combout\ : std_logic;
SIGNAL \inst4|count_1~0_combout\ : std_logic;
SIGNAL \inst4|WideOr0~0_combout\ : std_logic;
SIGNAL \inst4|pressed[0]~0_combout\ : std_logic;
SIGNAL \inst4|pressed[3]~3_combout\ : std_logic;
SIGNAL \inst4|pressed[2]~2_combout\ : std_logic;
SIGNAL \inst4|Equal0~0_combout\ : std_logic;
SIGNAL \inst4|ispressed~0_combout\ : std_logic;
SIGNAL \inst4|Selector1~1_combout\ : std_logic;
SIGNAL \inst4|Selector1~3_combout\ : std_logic;
SIGNAL \inst4|Selector1~4_combout\ : std_logic;
SIGNAL \inst4|Selector1~2_combout\ : std_logic;
SIGNAL \inst4|inputbottom[2]~feeder_combout\ : std_logic;
SIGNAL \c1~combout\ : std_logic;
SIGNAL \inst4|Selector0~1_combout\ : std_logic;
SIGNAL \inst4|Selector0~0_combout\ : std_logic;
SIGNAL \inst4|Selector0~2_combout\ : std_logic;
SIGNAL \inst4|Selector0~4_combout\ : std_logic;
SIGNAL \inst4|Selector0~5_combout\ : std_logic;
SIGNAL \inst|WideOr0~0_combout\ : std_logic;
SIGNAL \inst4|ispressed~regout\ : std_logic;
SIGNAL \inst|OA0~regout\ : std_logic;
SIGNAL \inst|OA1~feeder_combout\ : std_logic;
SIGNAL \inst|OA1~regout\ : std_logic;
SIGNAL \inst|OA~0_combout\ : std_logic;
SIGNAL \inst|OA~regout\ : std_logic;
SIGNAL \inst|WideOr1~0_combout\ : std_logic;
SIGNAL \inst|OB0~regout\ : std_logic;
SIGNAL \inst|OB1~feeder_combout\ : std_logic;
SIGNAL \inst|OB1~regout\ : std_logic;
SIGNAL \inst|OB~0_combout\ : std_logic;
SIGNAL \inst|OB~regout\ : std_logic;
SIGNAL \inst|WideOr2~0_combout\ : std_logic;
SIGNAL \inst|OC0~regout\ : std_logic;
SIGNAL \inst|OC1~regout\ : std_logic;
SIGNAL \inst|OC~0_combout\ : std_logic;
SIGNAL \inst|OC~regout\ : std_logic;
SIGNAL \inst|WideOr3~0_combout\ : std_logic;
SIGNAL \inst|OD0~regout\ : std_logic;
SIGNAL \inst|OD1~feeder_combout\ : std_logic;
SIGNAL \inst|OD1~regout\ : std_logic;
SIGNAL \inst|OD~0_combout\ : std_logic;
SIGNAL \inst|OD~regout\ : std_logic;
SIGNAL \inst|WideOr4~0_combout\ : std_logic;
SIGNAL \inst|OE0~regout\ : std_logic;
SIGNAL \inst|OE1~feeder_combout\ : std_logic;
SIGNAL \inst|OE1~regout\ : std_logic;
SIGNAL \inst|OE~0_combout\ : std_logic;
SIGNAL \inst|OE~regout\ : std_logic;
SIGNAL \inst|WideOr5~0_combout\ : std_logic;
SIGNAL \inst|OF0~regout\ : std_logic;
SIGNAL \inst|OF1~feeder_combout\ : std_logic;
SIGNAL \inst|OF1~regout\ : std_logic;
SIGNAL \inst|OF~0_combout\ : std_logic;
SIGNAL \inst|OF~regout\ : std_logic;
SIGNAL \inst|WideOr6~0_combout\ : std_logic;
SIGNAL \inst|OG0~regout\ : std_logic;
SIGNAL \inst|OG1~feeder_combout\ : std_logic;
SIGNAL \inst|OG1~regout\ : std_logic;
SIGNAL \inst|OG~0_combout\ : std_logic;
SIGNAL \inst|OG~regout\ : std_logic;
SIGNAL \inst|count~0_combout\ : std_logic;
SIGNAL \inst|count~regout\ : std_logic;
SIGNAL \inst|DIG2~feeder_combout\ : std_logic;
SIGNAL \inst|DIG2~regout\ : std_logic;
SIGNAL \inst|DIG3~0_combout\ : std_logic;
SIGNAL \inst|DIG3~regout\ : std_logic;
SIGNAL \inst2|count\ : std_logic_vector(16 DOWNTO 0);
SIGNAL \inst4|temp\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst4|pressed\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst4|inputbottom\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst4|count_1\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst2|ALT_INV_clk_250Hz~clkctrl_outclk\ : std_logic;
SIGNAL \inst4|ALT_INV_ispressed~regout\ : std_logic;
SIGNAL \inst4|ALT_INV_row.s0~regout\ : std_logic;
SIGNAL \inst4|ALT_INV_row.s1~regout\ : std_logic;
SIGNAL \inst4|ALT_INV_row.s2~regout\ : std_logic;
SIGNAL \inst|ALT_INV_DIG3~regout\ : std_logic;
SIGNAL \inst|ALT_INV_DIG2~regout\ : std_logic;
SIGNAL \inst|ALT_INV_OG~regout\ : std_logic;
SIGNAL \inst|ALT_INV_OF~regout\ : std_logic;
SIGNAL \inst|ALT_INV_OE~regout\ : std_logic;
SIGNAL \inst|ALT_INV_OD~regout\ : std_logic;
SIGNAL \inst|ALT_INV_OC~regout\ : std_logic;
SIGNAL \inst|ALT_INV_OB~regout\ : std_logic;
SIGNAL \inst|ALT_INV_OA~regout\ : std_logic;

BEGIN

OA <= ww_OA;
ww_CLK <= CLK;
ww_c3 <= c3;
ww_c2 <= c2;
ww_c1 <= c1;
ww_c0 <= c0;
OB <= ww_OB;
OC <= ww_OC;
OD <= ww_OD;
OE <= ww_OE;
\OF\ <= \ww_OF\;
OG <= ww_OG;
DIG0 <= ww_DIG0;
DIG1 <= ww_DIG1;
DIG2 <= ww_DIG2;
DIG3 <= ww_DIG3;
r <= ww_r;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\inst2|clk_250Hz~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \inst2|clk_250Hz~regout\);

\CLK~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \CLK~combout\);
\inst2|ALT_INV_clk_250Hz~clkctrl_outclk\ <= NOT \inst2|clk_250Hz~clkctrl_outclk\;
\inst4|ALT_INV_ispressed~regout\ <= NOT \inst4|ispressed~regout\;
\inst4|ALT_INV_row.s0~regout\ <= NOT \inst4|row.s0~regout\;
\inst4|ALT_INV_row.s1~regout\ <= NOT \inst4|row.s1~regout\;
\inst4|ALT_INV_row.s2~regout\ <= NOT \inst4|row.s2~regout\;
\inst|ALT_INV_DIG3~regout\ <= NOT \inst|DIG3~regout\;
\inst|ALT_INV_DIG2~regout\ <= NOT \inst|DIG2~regout\;
\inst|ALT_INV_OG~regout\ <= NOT \inst|OG~regout\;
\inst|ALT_INV_OF~regout\ <= NOT \inst|OF~regout\;
\inst|ALT_INV_OE~regout\ <= NOT \inst|OE~regout\;
\inst|ALT_INV_OD~regout\ <= NOT \inst|OD~regout\;
\inst|ALT_INV_OC~regout\ <= NOT \inst|OC~regout\;
\inst|ALT_INV_OB~regout\ <= NOT \inst|OB~regout\;
\inst|ALT_INV_OA~regout\ <= NOT \inst|OA~regout\;

-- Location: LCCOMB_X4_Y6_N16
\inst2|Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~0_combout\ = \inst2|count\(0) $ (VCC)
-- \inst2|Add0~1\ = CARRY(\inst2|count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|count\(0),
	datad => VCC,
	combout => \inst2|Add0~0_combout\,
	cout => \inst2|Add0~1\);

-- Location: LCCOMB_X4_Y6_N20
\inst2|Add0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~4_combout\ = (\inst2|count\(2) & (\inst2|Add0~3\ $ (GND))) # (!\inst2|count\(2) & (!\inst2|Add0~3\ & VCC))
-- \inst2|Add0~5\ = CARRY((\inst2|count\(2) & !\inst2|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|count\(2),
	datad => VCC,
	cin => \inst2|Add0~3\,
	combout => \inst2|Add0~4_combout\,
	cout => \inst2|Add0~5\);

-- Location: LCCOMB_X4_Y5_N12
\inst2|Add0~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~28_combout\ = (\inst2|count\(14) & (\inst2|Add0~27\ $ (GND))) # (!\inst2|count\(14) & (!\inst2|Add0~27\ & VCC))
-- \inst2|Add0~29\ = CARRY((\inst2|count\(14) & !\inst2|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|count\(14),
	datad => VCC,
	cin => \inst2|Add0~27\,
	combout => \inst2|Add0~28_combout\,
	cout => \inst2|Add0~29\);

-- Location: LCCOMB_X4_Y5_N14
\inst2|Add0~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~30_combout\ = (\inst2|count\(15) & (!\inst2|Add0~29\)) # (!\inst2|count\(15) & ((\inst2|Add0~29\) # (GND)))
-- \inst2|Add0~31\ = CARRY((!\inst2|Add0~29\) # (!\inst2|count\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|count\(15),
	datad => VCC,
	cin => \inst2|Add0~29\,
	combout => \inst2|Add0~30_combout\,
	cout => \inst2|Add0~31\);

-- Location: LCFF_X2_Y6_N1
\inst4|inputbottom[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|ALT_INV_clk_250Hz~clkctrl_outclk\,
	datain => \inst4|inputbottom[1]~feeder_combout\,
	ena => \inst4|ispressed~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|inputbottom\(1));

-- Location: LCFF_X4_Y6_N21
\inst2|count[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \inst2|Add0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|count\(2));

-- Location: LCFF_X4_Y6_N17
\inst2|count[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \inst2|Add0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|count\(0));

-- Location: LCFF_X4_Y5_N25
\inst2|count[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \inst2|count~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|count\(15));

-- Location: LCFF_X4_Y5_N13
\inst2|count[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \inst2|Add0~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|count\(14));

-- Location: LCCOMB_X3_Y5_N30
\inst2|Equal0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Equal0~3_combout\ = (!\inst2|count\(12) & (!\inst2|count\(14) & (!\inst2|count\(13) & \inst2|count\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|count\(12),
	datab => \inst2|count\(14),
	datac => \inst2|count\(13),
	datad => \inst2|count\(15),
	combout => \inst2|Equal0~3_combout\);

-- Location: LCFF_X2_Y6_N7
\inst4|hold\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|ALT_INV_clk_250Hz~clkctrl_outclk\,
	datain => \inst4|hold~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|hold~regout\);

-- Location: LCFF_X1_Y6_N11
\inst4|pressed[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst4|pressed[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|pressed\(1));

-- Location: LCFF_X3_Y6_N31
\inst4|temp[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst4|temp[1]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|temp\(1));

-- Location: LCCOMB_X4_Y5_N24
\inst2|count~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|count~5_combout\ = (\inst2|Add0~30_combout\ & ((!\inst2|Equal0~4_combout\) # (!\inst2|count\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst2|count\(16),
	datac => \inst2|Add0~30_combout\,
	datad => \inst2|Equal0~4_combout\,
	combout => \inst2|count~5_combout\);

-- Location: LCCOMB_X2_Y6_N6
\inst4|hold~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|hold~1_combout\ = (!\inst4|Equal0~0_combout\ & ((\inst4|hold~regout\) # ((\inst4|count_1\(3) & \inst4|hold~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|Equal0~0_combout\,
	datab => \inst4|count_1\(3),
	datac => \inst4|hold~regout\,
	datad => \inst4|hold~0_combout\,
	combout => \inst4|hold~1_combout\);

-- Location: LCCOMB_X1_Y6_N10
\inst4|pressed[1]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|pressed[1]~1_combout\ = (\inst4|row.s1~regout\ & (\inst4|WideOr0~0_combout\)) # (!\inst4|row.s1~regout\ & ((\inst4|pressed\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst4|WideOr0~0_combout\,
	datac => \inst4|pressed\(1),
	datad => \inst4|row.s1~regout\,
	combout => \inst4|pressed[1]~1_combout\);

-- Location: LCCOMB_X2_Y6_N26
\inst4|Selector3~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|Selector3~2_combout\ = (\c1~combout\ & (\c3~combout\ & (\c0~combout\ $ (\c2~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c1~combout\,
	datab => \c0~combout\,
	datac => \c3~combout\,
	datad => \c2~combout\,
	combout => \inst4|Selector3~2_combout\);

-- Location: LCCOMB_X1_Y6_N2
\inst4|temp[1]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|temp[1]~0_combout\ = ((\c2~combout\ & \inst4|row.s2~regout\)) # (!\inst4|row.s3~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \c2~combout\,
	datac => \inst4|row.s3~regout\,
	datad => \inst4|row.s2~regout\,
	combout => \inst4|temp[1]~0_combout\);

-- Location: LCCOMB_X2_Y6_N16
\inst4|temp[1]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|temp[1]~1_combout\ = (!\c1~combout\ & (\c3~combout\ & \inst4|temp[1]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c1~combout\,
	datac => \c3~combout\,
	datad => \inst4|temp[1]~0_combout\,
	combout => \inst4|temp[1]~1_combout\);

-- Location: LCCOMB_X2_Y6_N22
\inst4|temp[1]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|temp[1]~2_combout\ = (!\c3~combout\ & ((\inst4|row.s0~regout\) # ((\c2~combout\ & \inst4|row.s1~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c2~combout\,
	datab => \c3~combout\,
	datac => \inst4|row.s1~regout\,
	datad => \inst4|row.s0~regout\,
	combout => \inst4|temp[1]~2_combout\);

-- Location: LCCOMB_X2_Y6_N8
\inst4|temp[1]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|temp[1]~3_combout\ = (\inst4|temp[1]~2_combout\) # ((!\c2~combout\ & ((\inst4|row.s0~regout\) # (!\inst4|row.s3~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c2~combout\,
	datab => \inst4|row.s3~regout\,
	datac => \inst4|row.s0~regout\,
	datad => \inst4|temp[1]~2_combout\,
	combout => \inst4|temp[1]~3_combout\);

-- Location: LCCOMB_X3_Y6_N30
\inst4|temp[1]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|temp[1]~4_combout\ = (\inst4|WideOr0~0_combout\ & ((\inst4|temp[1]~1_combout\) # ((\inst4|temp[1]~3_combout\)))) # (!\inst4|WideOr0~0_combout\ & (((\inst4|temp\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|WideOr0~0_combout\,
	datab => \inst4|temp[1]~1_combout\,
	datac => \inst4|temp\(1),
	datad => \inst4|temp[1]~3_combout\,
	combout => \inst4|temp[1]~4_combout\);

-- Location: LCCOMB_X1_Y6_N20
\inst4|Selector1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|Selector1~0_combout\ = (\inst4|row.s2~regout\ & ((\inst4|temp\(2)) # (\inst4|WideOr0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|row.s2~regout\,
	datac => \inst4|temp\(2),
	datad => \inst4|WideOr0~0_combout\,
	combout => \inst4|Selector1~0_combout\);

-- Location: LCCOMB_X1_Y5_N12
\inst4|Selector0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|Selector0~3_combout\ = (\c2~combout\ & (\c1~combout\ & (\c3~combout\ $ (\c0~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c3~combout\,
	datab => \c0~combout\,
	datac => \c2~combout\,
	datad => \c1~combout\,
	combout => \inst4|Selector0~3_combout\);

-- Location: PIN_132,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\CLK~I\ : cycloneii_io
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
	padio => ww_CLK,
	combout => \CLK~combout\);

-- Location: CLKCTRL_G6
\CLK~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLK~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLK~clkctrl_outclk\);

-- Location: LCCOMB_X2_Y6_N0
\inst4|inputbottom[1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inputbottom[1]~feeder_combout\ = \inst4|temp\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst4|temp\(1),
	combout => \inst4|inputbottom[1]~feeder_combout\);

-- Location: LCCOMB_X4_Y6_N18
\inst2|Add0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~2_combout\ = (\inst2|count\(1) & (!\inst2|Add0~1\)) # (!\inst2|count\(1) & ((\inst2|Add0~1\) # (GND)))
-- \inst2|Add0~3\ = CARRY((!\inst2|Add0~1\) # (!\inst2|count\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|count\(1),
	datad => VCC,
	cin => \inst2|Add0~1\,
	combout => \inst2|Add0~2_combout\,
	cout => \inst2|Add0~3\);

-- Location: LCFF_X4_Y6_N19
\inst2|count[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \inst2|Add0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|count\(1));

-- Location: LCCOMB_X4_Y6_N22
\inst2|Add0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~6_combout\ = (\inst2|count\(3) & (!\inst2|Add0~5\)) # (!\inst2|count\(3) & ((\inst2|Add0~5\) # (GND)))
-- \inst2|Add0~7\ = CARRY((!\inst2|Add0~5\) # (!\inst2|count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|count\(3),
	datad => VCC,
	cin => \inst2|Add0~5\,
	combout => \inst2|Add0~6_combout\,
	cout => \inst2|Add0~7\);

-- Location: LCFF_X4_Y6_N23
\inst2|count[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \inst2|Add0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|count\(3));

-- Location: LCCOMB_X4_Y6_N24
\inst2|Add0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~8_combout\ = (\inst2|count\(4) & (\inst2|Add0~7\ $ (GND))) # (!\inst2|count\(4) & (!\inst2|Add0~7\ & VCC))
-- \inst2|Add0~9\ = CARRY((\inst2|count\(4) & !\inst2|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|count\(4),
	datad => VCC,
	cin => \inst2|Add0~7\,
	combout => \inst2|Add0~8_combout\,
	cout => \inst2|Add0~9\);

-- Location: LCCOMB_X4_Y6_N26
\inst2|Add0~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~10_combout\ = (\inst2|count\(5) & (!\inst2|Add0~9\)) # (!\inst2|count\(5) & ((\inst2|Add0~9\) # (GND)))
-- \inst2|Add0~11\ = CARRY((!\inst2|Add0~9\) # (!\inst2|count\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|count\(5),
	datad => VCC,
	cin => \inst2|Add0~9\,
	combout => \inst2|Add0~10_combout\,
	cout => \inst2|Add0~11\);

-- Location: LCCOMB_X4_Y6_N14
\inst2|count~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|count~3_combout\ = (\inst2|Add0~10_combout\ & ((!\inst2|Equal0~4_combout\) # (!\inst2|count\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst2|Add0~10_combout\,
	datac => \inst2|count\(16),
	datad => \inst2|Equal0~4_combout\,
	combout => \inst2|count~3_combout\);

-- Location: LCFF_X4_Y6_N15
\inst2|count[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \inst2|count~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|count\(5));

-- Location: LCCOMB_X4_Y6_N28
\inst2|Add0~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~12_combout\ = (\inst2|count\(6) & (\inst2|Add0~11\ $ (GND))) # (!\inst2|count\(6) & (!\inst2|Add0~11\ & VCC))
-- \inst2|Add0~13\ = CARRY((\inst2|count\(6) & !\inst2|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|count\(6),
	datad => VCC,
	cin => \inst2|Add0~11\,
	combout => \inst2|Add0~12_combout\,
	cout => \inst2|Add0~13\);

-- Location: LCFF_X4_Y6_N29
\inst2|count[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \inst2|Add0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|count\(6));

-- Location: LCCOMB_X4_Y6_N30
\inst2|Add0~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~14_combout\ = (\inst2|count\(7) & (!\inst2|Add0~13\)) # (!\inst2|count\(7) & ((\inst2|Add0~13\) # (GND)))
-- \inst2|Add0~15\ = CARRY((!\inst2|Add0~13\) # (!\inst2|count\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|count\(7),
	datad => VCC,
	cin => \inst2|Add0~13\,
	combout => \inst2|Add0~14_combout\,
	cout => \inst2|Add0~15\);

-- Location: LCCOMB_X4_Y6_N0
\inst2|count~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|count~2_combout\ = (\inst2|Add0~14_combout\ & ((!\inst2|Equal0~4_combout\) # (!\inst2|count\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst2|Add0~14_combout\,
	datac => \inst2|count\(16),
	datad => \inst2|Equal0~4_combout\,
	combout => \inst2|count~2_combout\);

-- Location: LCFF_X4_Y6_N1
\inst2|count[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \inst2|count~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|count\(7));

-- Location: LCCOMB_X4_Y5_N0
\inst2|Add0~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~16_combout\ = (\inst2|count\(8) & (\inst2|Add0~15\ $ (GND))) # (!\inst2|count\(8) & (!\inst2|Add0~15\ & VCC))
-- \inst2|Add0~17\ = CARRY((\inst2|count\(8) & !\inst2|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|count\(8),
	datad => VCC,
	cin => \inst2|Add0~15\,
	combout => \inst2|Add0~16_combout\,
	cout => \inst2|Add0~17\);

-- Location: LCFF_X4_Y5_N1
\inst2|count[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \inst2|Add0~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|count\(8));

-- Location: LCCOMB_X4_Y5_N2
\inst2|Add0~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~18_combout\ = (\inst2|count\(9) & (!\inst2|Add0~17\)) # (!\inst2|count\(9) & ((\inst2|Add0~17\) # (GND)))
-- \inst2|Add0~19\ = CARRY((!\inst2|Add0~17\) # (!\inst2|count\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|count\(9),
	datad => VCC,
	cin => \inst2|Add0~17\,
	combout => \inst2|Add0~18_combout\,
	cout => \inst2|Add0~19\);

-- Location: LCCOMB_X4_Y5_N28
\inst2|count~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|count~1_combout\ = (\inst2|Add0~18_combout\ & ((!\inst2|Equal0~4_combout\) # (!\inst2|count\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst2|count\(16),
	datac => \inst2|Equal0~4_combout\,
	datad => \inst2|Add0~18_combout\,
	combout => \inst2|count~1_combout\);

-- Location: LCFF_X4_Y5_N29
\inst2|count[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \inst2|count~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|count\(9));

-- Location: LCCOMB_X4_Y5_N4
\inst2|Add0~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~20_combout\ = (\inst2|count\(10) & (\inst2|Add0~19\ $ (GND))) # (!\inst2|count\(10) & (!\inst2|Add0~19\ & VCC))
-- \inst2|Add0~21\ = CARRY((\inst2|count\(10) & !\inst2|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|count\(10),
	datad => VCC,
	cin => \inst2|Add0~19\,
	combout => \inst2|Add0~20_combout\,
	cout => \inst2|Add0~21\);

-- Location: LCCOMB_X4_Y5_N6
\inst2|Add0~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~22_combout\ = (\inst2|count\(11) & (!\inst2|Add0~21\)) # (!\inst2|count\(11) & ((\inst2|Add0~21\) # (GND)))
-- \inst2|Add0~23\ = CARRY((!\inst2|Add0~21\) # (!\inst2|count\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|count\(11),
	datad => VCC,
	cin => \inst2|Add0~21\,
	combout => \inst2|Add0~22_combout\,
	cout => \inst2|Add0~23\);

-- Location: LCFF_X4_Y5_N7
\inst2|count[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \inst2|Add0~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|count\(11));

-- Location: LCCOMB_X4_Y5_N20
\inst2|count~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|count~4_combout\ = (\inst2|Add0~20_combout\ & ((!\inst2|Equal0~4_combout\) # (!\inst2|count\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst2|count\(16),
	datac => \inst2|Add0~20_combout\,
	datad => \inst2|Equal0~4_combout\,
	combout => \inst2|count~4_combout\);

-- Location: LCFF_X4_Y5_N21
\inst2|count[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \inst2|count~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|count\(10));

-- Location: LCCOMB_X4_Y5_N22
\inst2|Equal0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Equal0~2_combout\ = (\inst2|count\(0) & (!\inst2|count\(11) & (\inst2|count\(10) & \inst2|count\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|count\(0),
	datab => \inst2|count\(11),
	datac => \inst2|count\(10),
	datad => \inst2|count\(1),
	combout => \inst2|Equal0~2_combout\);

-- Location: LCCOMB_X4_Y5_N26
\inst2|Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Equal0~0_combout\ = (\inst2|count\(9) & (!\inst2|count\(8) & (\inst2|count\(7) & !\inst2|count\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|count\(9),
	datab => \inst2|count\(8),
	datac => \inst2|count\(7),
	datad => \inst2|count\(6),
	combout => \inst2|Equal0~0_combout\);

-- Location: LCFF_X4_Y6_N25
\inst2|count[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \inst2|Add0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|count\(4));

-- Location: LCCOMB_X4_Y6_N12
\inst2|Equal0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Equal0~1_combout\ = (\inst2|count\(2) & (!\inst2|count\(5) & (\inst2|count\(4) & \inst2|count\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|count\(2),
	datab => \inst2|count\(5),
	datac => \inst2|count\(4),
	datad => \inst2|count\(3),
	combout => \inst2|Equal0~1_combout\);

-- Location: LCCOMB_X4_Y5_N18
\inst2|Equal0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Equal0~4_combout\ = (\inst2|Equal0~3_combout\ & (\inst2|Equal0~2_combout\ & (\inst2|Equal0~0_combout\ & \inst2|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|Equal0~3_combout\,
	datab => \inst2|Equal0~2_combout\,
	datac => \inst2|Equal0~0_combout\,
	datad => \inst2|Equal0~1_combout\,
	combout => \inst2|Equal0~4_combout\);

-- Location: LCCOMB_X4_Y5_N8
\inst2|Add0~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~24_combout\ = (\inst2|count\(12) & (\inst2|Add0~23\ $ (GND))) # (!\inst2|count\(12) & (!\inst2|Add0~23\ & VCC))
-- \inst2|Add0~25\ = CARRY((\inst2|count\(12) & !\inst2|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|count\(12),
	datad => VCC,
	cin => \inst2|Add0~23\,
	combout => \inst2|Add0~24_combout\,
	cout => \inst2|Add0~25\);

-- Location: LCFF_X4_Y5_N9
\inst2|count[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \inst2|Add0~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|count\(12));

-- Location: LCCOMB_X4_Y5_N10
\inst2|Add0~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~26_combout\ = (\inst2|count\(13) & (!\inst2|Add0~25\)) # (!\inst2|count\(13) & ((\inst2|Add0~25\) # (GND)))
-- \inst2|Add0~27\ = CARRY((!\inst2|Add0~25\) # (!\inst2|count\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst2|count\(13),
	datad => VCC,
	cin => \inst2|Add0~25\,
	combout => \inst2|Add0~26_combout\,
	cout => \inst2|Add0~27\);

-- Location: LCFF_X4_Y5_N11
\inst2|count[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \inst2|Add0~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|count\(13));

-- Location: LCCOMB_X4_Y5_N16
\inst2|Add0~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|Add0~32_combout\ = \inst2|Add0~31\ $ (!\inst2|count\(16))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \inst2|count\(16),
	cin => \inst2|Add0~31\,
	combout => \inst2|Add0~32_combout\);

-- Location: LCCOMB_X4_Y5_N30
\inst2|count~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|count~0_combout\ = (\inst2|Add0~32_combout\ & ((!\inst2|count\(16)) # (!\inst2|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst2|Equal0~4_combout\,
	datac => \inst2|count\(16),
	datad => \inst2|Add0~32_combout\,
	combout => \inst2|count~0_combout\);

-- Location: LCFF_X4_Y5_N31
\inst2|count[16]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \inst2|count~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|count\(16));

-- Location: LCCOMB_X3_Y5_N0
\inst2|clk_250Hz~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|clk_250Hz~0_combout\ = \inst2|clk_250Hz~regout\ $ (((\inst2|count\(16) & \inst2|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst2|count\(16),
	datac => \inst2|clk_250Hz~regout\,
	datad => \inst2|Equal0~4_combout\,
	combout => \inst2|clk_250Hz~0_combout\);

-- Location: LCFF_X3_Y5_N1
\inst2|clk_250Hz\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \inst2|clk_250Hz~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|clk_250Hz~regout\);

-- Location: CLKCTRL_G1
\inst2|clk_250Hz~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \inst2|clk_250Hz~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \inst2|clk_250Hz~clkctrl_outclk\);

-- Location: LCCOMB_X1_Y6_N6
\inst4|row.s2~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|row.s2~feeder_combout\ = \inst4|row.s1~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst4|row.s1~regout\,
	combout => \inst4|row.s2~feeder_combout\);

-- Location: LCFF_X1_Y6_N7
\inst4|row.s2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst4|row.s2~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|row.s2~regout\);

-- Location: LCCOMB_X1_Y6_N16
\inst4|row.s3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|row.s3~0_combout\ = !\inst4|row.s2~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst4|row.s2~regout\,
	combout => \inst4|row.s3~0_combout\);

-- Location: LCFF_X1_Y6_N17
\inst4|row.s3\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst4|row.s3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|row.s3~regout\);

-- Location: LCCOMB_X3_Y6_N26
\inst4|row.s0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|row.s0~0_combout\ = !\inst4|row.s3~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst4|row.s3~regout\,
	combout => \inst4|row.s0~0_combout\);

-- Location: LCFF_X3_Y6_N27
\inst4|row.s0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst4|row.s0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|row.s0~regout\);

-- Location: LCCOMB_X3_Y6_N16
\inst4|row.s1~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|row.s1~feeder_combout\ = \inst4|row.s0~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst4|row.s0~regout\,
	combout => \inst4|row.s1~feeder_combout\);

-- Location: LCFF_X3_Y6_N17
\inst4|row.s1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst4|row.s1~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|row.s1~regout\);

-- Location: LCCOMB_X1_Y6_N4
\inst4|Selector3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|Selector3~0_combout\ = (\inst4|row.s0~regout\) # (\inst4|row.s2~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst4|row.s0~regout\,
	datad => \inst4|row.s2~regout\,
	combout => \inst4|Selector3~0_combout\);

-- Location: PIN_13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\c0~I\ : cycloneii_io
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
	padio => ww_c0,
	combout => \c0~combout\);

-- Location: PIN_30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\c3~I\ : cycloneii_io
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
	padio => ww_c3,
	combout => \c3~combout\);

-- Location: PIN_15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\c2~I\ : cycloneii_io
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
	padio => ww_c2,
	combout => \c2~combout\);

-- Location: LCCOMB_X2_Y6_N4
\inst4|Selector3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|Selector3~1_combout\ = (\c2~combout\ & ((\c1~combout\ & (\c0~combout\ $ (\c3~combout\))) # (!\c1~combout\ & (\c0~combout\ & \c3~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c1~combout\,
	datab => \c0~combout\,
	datac => \c3~combout\,
	datad => \c2~combout\,
	combout => \inst4|Selector3~1_combout\);

-- Location: LCCOMB_X1_Y6_N24
\inst4|Selector3~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|Selector3~4_combout\ = (\inst4|Selector3~1_combout\ & (\inst4|Selector3~2_combout\)) # (!\inst4|Selector3~1_combout\ & (\inst4|Selector3~0_combout\ & ((\inst4|Selector3~2_combout\) # (\inst4|temp\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|Selector3~2_combout\,
	datab => \inst4|temp\(0),
	datac => \inst4|Selector3~0_combout\,
	datad => \inst4|Selector3~1_combout\,
	combout => \inst4|Selector3~4_combout\);

-- Location: LCCOMB_X1_Y6_N22
\inst4|Selector3~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|Selector3~3_combout\ = (\inst4|Selector3~2_combout\ & (((!\inst4|Selector3~0_combout\ & \inst4|Selector3~1_combout\)))) # (!\inst4|Selector3~2_combout\ & ((\inst4|Selector3~1_combout\) # ((\inst4|temp\(0) & !\inst4|Selector3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|Selector3~2_combout\,
	datab => \inst4|temp\(0),
	datac => \inst4|Selector3~0_combout\,
	datad => \inst4|Selector3~1_combout\,
	combout => \inst4|Selector3~3_combout\);

-- Location: LCCOMB_X1_Y6_N18
\inst4|Selector3~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|Selector3~5_combout\ = (\inst4|Selector3~3_combout\ & (((\inst4|row.s1~regout\ & !\inst4|Selector3~4_combout\)) # (!\inst4|row.s3~regout\))) # (!\inst4|Selector3~3_combout\ & (((\inst4|Selector3~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|row.s3~regout\,
	datab => \inst4|row.s1~regout\,
	datac => \inst4|Selector3~4_combout\,
	datad => \inst4|Selector3~3_combout\,
	combout => \inst4|Selector3~5_combout\);

-- Location: LCFF_X1_Y6_N19
\inst4|temp[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst4|Selector3~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|temp\(0));

-- Location: LCCOMB_X2_Y6_N18
\inst4|inputbottom[0]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inputbottom[0]~feeder_combout\ = \inst4|temp\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst4|temp\(0),
	combout => \inst4|inputbottom[0]~feeder_combout\);

-- Location: LCCOMB_X3_Y6_N14
\inst4|count_1~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|count_1~3_combout\ = (!\inst4|Equal0~0_combout\ & !\inst4|count_1\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|Equal0~0_combout\,
	datac => \inst4|count_1\(0),
	combout => \inst4|count_1~3_combout\);

-- Location: LCFF_X3_Y6_N15
\inst4|count_1[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst4|count_1~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|count_1\(0));

-- Location: LCCOMB_X3_Y6_N20
\inst4|count_1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|count_1~2_combout\ = (!\inst4|Equal0~0_combout\ & (\inst4|count_1\(1) $ (\inst4|count_1\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|Equal0~0_combout\,
	datac => \inst4|count_1\(1),
	datad => \inst4|count_1\(0),
	combout => \inst4|count_1~2_combout\);

-- Location: LCFF_X3_Y6_N21
\inst4|count_1[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst4|count_1~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|count_1\(1));

-- Location: LCCOMB_X3_Y6_N22
\inst4|count_1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|count_1~1_combout\ = (!\inst4|Equal0~0_combout\ & (\inst4|count_1\(2) $ (((\inst4|count_1\(0) & \inst4|count_1\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|Equal0~0_combout\,
	datab => \inst4|count_1\(0),
	datac => \inst4|count_1\(2),
	datad => \inst4|count_1\(1),
	combout => \inst4|count_1~1_combout\);

-- Location: LCFF_X3_Y6_N23
\inst4|count_1[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst4|count_1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|count_1\(2));

-- Location: LCCOMB_X3_Y6_N28
\inst4|hold~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|hold~0_combout\ = (\inst4|count_1\(0) & (\inst4|count_1\(1) & \inst4|count_1\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst4|count_1\(0),
	datac => \inst4|count_1\(1),
	datad => \inst4|count_1\(2),
	combout => \inst4|hold~0_combout\);

-- Location: LCCOMB_X3_Y6_N24
\inst4|count_1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|count_1~0_combout\ = (!\inst4|Equal0~0_combout\ & (\inst4|hold~0_combout\ $ (\inst4|count_1\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010000010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|Equal0~0_combout\,
	datab => \inst4|hold~0_combout\,
	datac => \inst4|count_1\(3),
	combout => \inst4|count_1~0_combout\);

-- Location: LCFF_X3_Y6_N25
\inst4|count_1[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst4|count_1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|count_1\(3));

-- Location: LCCOMB_X2_Y6_N30
\inst4|WideOr0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|WideOr0~0_combout\ = (\c1~combout\ & ((\c0~combout\ & (\c3~combout\ $ (\c2~combout\))) # (!\c0~combout\ & (\c3~combout\ & \c2~combout\)))) # (!\c1~combout\ & (\c0~combout\ & (\c3~combout\ & \c2~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c1~combout\,
	datab => \c0~combout\,
	datac => \c3~combout\,
	datad => \c2~combout\,
	combout => \inst4|WideOr0~0_combout\);

-- Location: LCCOMB_X1_Y6_N8
\inst4|pressed[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|pressed[0]~0_combout\ = (\inst4|row.s0~regout\ & (\inst4|WideOr0~0_combout\)) # (!\inst4|row.s0~regout\ & ((\inst4|pressed\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|row.s0~regout\,
	datab => \inst4|WideOr0~0_combout\,
	datac => \inst4|pressed\(0),
	combout => \inst4|pressed[0]~0_combout\);

-- Location: LCFF_X1_Y6_N9
\inst4|pressed[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst4|pressed[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|pressed\(0));

-- Location: LCCOMB_X1_Y6_N14
\inst4|pressed[3]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|pressed[3]~3_combout\ = (\inst4|row.s3~regout\ & (\inst4|pressed\(3))) # (!\inst4|row.s3~regout\ & ((\inst4|WideOr0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|row.s3~regout\,
	datac => \inst4|pressed\(3),
	datad => \inst4|WideOr0~0_combout\,
	combout => \inst4|pressed[3]~3_combout\);

-- Location: LCFF_X1_Y6_N15
\inst4|pressed[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst4|pressed[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|pressed\(3));

-- Location: LCCOMB_X1_Y6_N28
\inst4|pressed[2]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|pressed[2]~2_combout\ = (\inst4|row.s2~regout\ & ((\inst4|WideOr0~0_combout\))) # (!\inst4|row.s2~regout\ & (\inst4|pressed\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|row.s2~regout\,
	datac => \inst4|pressed\(2),
	datad => \inst4|WideOr0~0_combout\,
	combout => \inst4|pressed[2]~2_combout\);

-- Location: LCFF_X1_Y6_N29
\inst4|pressed[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst4|pressed[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|pressed\(2));

-- Location: LCCOMB_X1_Y6_N0
\inst4|Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|Equal0~0_combout\ = (!\inst4|pressed\(1) & (!\inst4|pressed\(0) & (!\inst4|pressed\(3) & !\inst4|pressed\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|pressed\(1),
	datab => \inst4|pressed\(0),
	datac => \inst4|pressed\(3),
	datad => \inst4|pressed\(2),
	combout => \inst4|Equal0~0_combout\);

-- Location: LCCOMB_X2_Y6_N24
\inst4|ispressed~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|ispressed~0_combout\ = (!\inst4|hold~regout\ & (\inst4|count_1\(3) & (!\inst4|Equal0~0_combout\ & \inst4|hold~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|hold~regout\,
	datab => \inst4|count_1\(3),
	datac => \inst4|Equal0~0_combout\,
	datad => \inst4|hold~0_combout\,
	combout => \inst4|ispressed~0_combout\);

-- Location: LCFF_X2_Y6_N19
\inst4|inputbottom[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|ALT_INV_clk_250Hz~clkctrl_outclk\,
	datain => \inst4|inputbottom[0]~feeder_combout\,
	ena => \inst4|ispressed~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|inputbottom\(0));

-- Location: LCCOMB_X1_Y6_N26
\inst4|Selector1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|Selector1~1_combout\ = (\inst4|temp\(2) & ((\inst4|row.s0~regout\) # ((\inst4|row.s1~regout\) # (!\inst4|row.s3~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|row.s0~regout\,
	datab => \inst4|temp\(2),
	datac => \inst4|row.s3~regout\,
	datad => \inst4|row.s1~regout\,
	combout => \inst4|Selector1~1_combout\);

-- Location: LCCOMB_X2_Y6_N10
\inst4|Selector1~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|Selector1~3_combout\ = (\c1~combout\ & (!\c0~combout\ & ((\inst4|row.s0~regout\) # (!\inst4|row.s3~regout\)))) # (!\c1~combout\ & (((\inst4|row.s0~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000001110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c1~combout\,
	datab => \c0~combout\,
	datac => \inst4|row.s0~regout\,
	datad => \inst4|row.s3~regout\,
	combout => \inst4|Selector1~3_combout\);

-- Location: LCCOMB_X2_Y6_N12
\inst4|Selector1~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|Selector1~4_combout\ = (\c1~combout\ & ((\c3~combout\ & ((\inst4|Selector1~3_combout\))) # (!\c3~combout\ & (\inst4|row.s1~regout\)))) # (!\c1~combout\ & (((\inst4|Selector1~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c1~combout\,
	datab => \c3~combout\,
	datac => \inst4|row.s1~regout\,
	datad => \inst4|Selector1~3_combout\,
	combout => \inst4|Selector1~4_combout\);

-- Location: LCCOMB_X1_Y6_N12
\inst4|Selector1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|Selector1~2_combout\ = (\inst4|Selector1~0_combout\) # ((\inst4|WideOr0~0_combout\ & ((\inst4|Selector1~4_combout\))) # (!\inst4|WideOr0~0_combout\ & (\inst4|Selector1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|Selector1~0_combout\,
	datab => \inst4|Selector1~1_combout\,
	datac => \inst4|Selector1~4_combout\,
	datad => \inst4|WideOr0~0_combout\,
	combout => \inst4|Selector1~2_combout\);

-- Location: LCFF_X1_Y6_N13
\inst4|temp[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst4|Selector1~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|temp\(2));

-- Location: LCCOMB_X2_Y6_N2
\inst4|inputbottom[2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inputbottom[2]~feeder_combout\ = \inst4|temp\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst4|temp\(2),
	combout => \inst4|inputbottom[2]~feeder_combout\);

-- Location: LCFF_X2_Y6_N3
\inst4|inputbottom[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|ALT_INV_clk_250Hz~clkctrl_outclk\,
	datain => \inst4|inputbottom[2]~feeder_combout\,
	ena => \inst4|ispressed~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|inputbottom\(2));

-- Location: PIN_14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\c1~I\ : cycloneii_io
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
	padio => ww_c1,
	combout => \c1~combout\);

-- Location: LCCOMB_X1_Y5_N0
\inst4|Selector0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|Selector0~1_combout\ = (\c3~combout\ & ((\c0~combout\ & (\c2~combout\ $ (\c1~combout\))) # (!\c0~combout\ & (\c2~combout\ & \c1~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \c3~combout\,
	datab => \c0~combout\,
	datac => \c2~combout\,
	datad => \c1~combout\,
	combout => \inst4|Selector0~1_combout\);

-- Location: LCCOMB_X2_Y6_N28
\inst4|Selector0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|Selector0~0_combout\ = (\inst4|temp\(3)) # ((\inst4|WideOr0~0_combout\ & \inst4|row.s0~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|temp\(3),
	datab => \inst4|WideOr0~0_combout\,
	datad => \inst4|row.s0~regout\,
	combout => \inst4|Selector0~0_combout\);

-- Location: LCCOMB_X1_Y5_N30
\inst4|Selector0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|Selector0~2_combout\ = (\inst4|row.s3~regout\ & !\inst4|row.s2~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst4|row.s3~regout\,
	datad => \inst4|row.s2~regout\,
	combout => \inst4|Selector0~2_combout\);

-- Location: LCCOMB_X1_Y5_N6
\inst4|Selector0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|Selector0~4_combout\ = (\inst4|Selector0~3_combout\ & (((!\inst4|Selector0~2_combout\)) # (!\inst4|Selector0~1_combout\))) # (!\inst4|Selector0~3_combout\ & ((\inst4|Selector0~1_combout\ & (\inst4|row.s1~regout\)) # (!\inst4|Selector0~1_combout\ & 
-- (!\inst4|row.s1~regout\ & \inst4|Selector0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110001111101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|Selector0~3_combout\,
	datab => \inst4|Selector0~1_combout\,
	datac => \inst4|row.s1~regout\,
	datad => \inst4|Selector0~2_combout\,
	combout => \inst4|Selector0~4_combout\);

-- Location: LCCOMB_X1_Y6_N30
\inst4|Selector0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|Selector0~5_combout\ = (\inst4|Selector0~0_combout\ & ((\inst4|row.s0~regout\) # (\inst4|Selector0~1_combout\ $ (!\inst4|Selector0~4_combout\)))) # (!\inst4|Selector0~0_combout\ & (((\inst4|Selector0~1_combout\ & \inst4|Selector0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|row.s0~regout\,
	datab => \inst4|Selector0~1_combout\,
	datac => \inst4|Selector0~0_combout\,
	datad => \inst4|Selector0~4_combout\,
	combout => \inst4|Selector0~5_combout\);

-- Location: LCFF_X1_Y6_N31
\inst4|temp[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst4|Selector0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|temp\(3));

-- Location: LCFF_X2_Y6_N21
\inst4|inputbottom[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|ALT_INV_clk_250Hz~clkctrl_outclk\,
	sdata => \inst4|temp\(3),
	sload => VCC,
	ena => \inst4|ispressed~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|inputbottom\(3));

-- Location: LCCOMB_X2_Y3_N24
\inst|WideOr0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|WideOr0~0_combout\ = (\inst4|inputbottom\(2) & (!\inst4|inputbottom\(1) & (\inst4|inputbottom\(0) $ (!\inst4|inputbottom\(3))))) # (!\inst4|inputbottom\(2) & (\inst4|inputbottom\(0) & (\inst4|inputbottom\(1) $ (!\inst4|inputbottom\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100000010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|inputbottom\(1),
	datab => \inst4|inputbottom\(0),
	datac => \inst4|inputbottom\(2),
	datad => \inst4|inputbottom\(3),
	combout => \inst|WideOr0~0_combout\);

-- Location: LCFF_X2_Y6_N29
\inst4|ispressed\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|ALT_INV_clk_250Hz~clkctrl_outclk\,
	sdata => \inst4|ispressed~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|ispressed~regout\);

-- Location: LCFF_X2_Y3_N25
\inst|OA0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst|WideOr0~0_combout\,
	ena => \inst4|ispressed~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|OA0~regout\);

-- Location: LCCOMB_X1_Y3_N8
\inst|OA1~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|OA1~feeder_combout\ = \inst|OA0~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|OA0~regout\,
	combout => \inst|OA1~feeder_combout\);

-- Location: LCFF_X1_Y3_N9
\inst|OA1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst|OA1~feeder_combout\,
	ena => \inst4|ispressed~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|OA1~regout\);

-- Location: LCCOMB_X1_Y3_N16
\inst|OA~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|OA~0_combout\ = (\inst|count~regout\ & (\inst|OA1~regout\)) # (!\inst|count~regout\ & ((\inst|OA0~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|count~regout\,
	datac => \inst|OA1~regout\,
	datad => \inst|OA0~regout\,
	combout => \inst|OA~0_combout\);

-- Location: LCFF_X1_Y3_N17
\inst|OA\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst|OA~0_combout\,
	ena => \inst4|ALT_INV_ispressed~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|OA~regout\);

-- Location: LCCOMB_X2_Y3_N22
\inst|WideOr1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|WideOr1~0_combout\ = (\inst4|inputbottom\(1) & ((\inst4|inputbottom\(0) & ((\inst4|inputbottom\(3)))) # (!\inst4|inputbottom\(0) & (\inst4|inputbottom\(2))))) # (!\inst4|inputbottom\(1) & (\inst4|inputbottom\(2) & (\inst4|inputbottom\(0) $ 
-- (\inst4|inputbottom\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|inputbottom\(1),
	datab => \inst4|inputbottom\(0),
	datac => \inst4|inputbottom\(2),
	datad => \inst4|inputbottom\(3),
	combout => \inst|WideOr1~0_combout\);

-- Location: LCFF_X2_Y3_N23
\inst|OB0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst|WideOr1~0_combout\,
	ena => \inst4|ispressed~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|OB0~regout\);

-- Location: LCCOMB_X1_Y3_N14
\inst|OB1~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|OB1~feeder_combout\ = \inst|OB0~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|OB0~regout\,
	combout => \inst|OB1~feeder_combout\);

-- Location: LCFF_X1_Y3_N15
\inst|OB1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst|OB1~feeder_combout\,
	ena => \inst4|ispressed~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|OB1~regout\);

-- Location: LCCOMB_X1_Y3_N10
\inst|OB~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|OB~0_combout\ = (\inst|count~regout\ & (\inst|OB1~regout\)) # (!\inst|count~regout\ & ((\inst|OB0~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|count~regout\,
	datac => \inst|OB1~regout\,
	datad => \inst|OB0~regout\,
	combout => \inst|OB~0_combout\);

-- Location: LCFF_X1_Y3_N11
\inst|OB\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst|OB~0_combout\,
	ena => \inst4|ALT_INV_ispressed~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|OB~regout\);

-- Location: LCCOMB_X2_Y3_N12
\inst|WideOr2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|WideOr2~0_combout\ = (\inst4|inputbottom\(2) & (\inst4|inputbottom\(3) & ((\inst4|inputbottom\(1)) # (!\inst4|inputbottom\(0))))) # (!\inst4|inputbottom\(2) & (\inst4|inputbottom\(1) & (!\inst4|inputbottom\(0) & !\inst4|inputbottom\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|inputbottom\(1),
	datab => \inst4|inputbottom\(0),
	datac => \inst4|inputbottom\(2),
	datad => \inst4|inputbottom\(3),
	combout => \inst|WideOr2~0_combout\);

-- Location: LCFF_X2_Y3_N13
\inst|OC0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst|WideOr2~0_combout\,
	ena => \inst4|ispressed~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|OC0~regout\);

-- Location: LCFF_X1_Y3_N5
\inst|OC1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	sdata => \inst|OC0~regout\,
	sload => VCC,
	ena => \inst4|ispressed~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|OC1~regout\);

-- Location: LCCOMB_X1_Y3_N20
\inst|OC~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|OC~0_combout\ = (\inst|count~regout\ & ((\inst|OC1~regout\))) # (!\inst|count~regout\ & (\inst|OC0~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|count~regout\,
	datab => \inst|OC0~regout\,
	datac => \inst|OC1~regout\,
	combout => \inst|OC~0_combout\);

-- Location: LCFF_X1_Y3_N21
\inst|OC\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst|OC~0_combout\,
	ena => \inst4|ALT_INV_ispressed~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|OC~regout\);

-- Location: LCCOMB_X2_Y3_N18
\inst|WideOr3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|WideOr3~0_combout\ = (\inst4|inputbottom\(1) & ((\inst4|inputbottom\(0) & (\inst4|inputbottom\(2))) # (!\inst4|inputbottom\(0) & (!\inst4|inputbottom\(2) & \inst4|inputbottom\(3))))) # (!\inst4|inputbottom\(1) & (!\inst4|inputbottom\(3) & 
-- (\inst4|inputbottom\(0) $ (\inst4|inputbottom\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001010010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|inputbottom\(1),
	datab => \inst4|inputbottom\(0),
	datac => \inst4|inputbottom\(2),
	datad => \inst4|inputbottom\(3),
	combout => \inst|WideOr3~0_combout\);

-- Location: LCFF_X2_Y3_N19
\inst|OD0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst|WideOr3~0_combout\,
	ena => \inst4|ispressed~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|OD0~regout\);

-- Location: LCCOMB_X1_Y3_N18
\inst|OD1~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|OD1~feeder_combout\ = \inst|OD0~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|OD0~regout\,
	combout => \inst|OD1~feeder_combout\);

-- Location: LCFF_X1_Y3_N19
\inst|OD1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst|OD1~feeder_combout\,
	ena => \inst4|ispressed~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|OD1~regout\);

-- Location: LCCOMB_X1_Y3_N26
\inst|OD~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|OD~0_combout\ = (\inst|count~regout\ & (\inst|OD1~regout\)) # (!\inst|count~regout\ & ((\inst|OD0~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|count~regout\,
	datab => \inst|OD1~regout\,
	datad => \inst|OD0~regout\,
	combout => \inst|OD~0_combout\);

-- Location: LCFF_X1_Y3_N27
\inst|OD\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst|OD~0_combout\,
	ena => \inst4|ALT_INV_ispressed~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|OD~regout\);

-- Location: LCCOMB_X2_Y3_N28
\inst|WideOr4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|WideOr4~0_combout\ = (\inst4|inputbottom\(1) & (\inst4|inputbottom\(0) & ((!\inst4|inputbottom\(3))))) # (!\inst4|inputbottom\(1) & ((\inst4|inputbottom\(2) & ((!\inst4|inputbottom\(3)))) # (!\inst4|inputbottom\(2) & (\inst4|inputbottom\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|inputbottom\(1),
	datab => \inst4|inputbottom\(0),
	datac => \inst4|inputbottom\(2),
	datad => \inst4|inputbottom\(3),
	combout => \inst|WideOr4~0_combout\);

-- Location: LCFF_X2_Y3_N29
\inst|OE0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst|WideOr4~0_combout\,
	ena => \inst4|ispressed~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|OE0~regout\);

-- Location: LCCOMB_X1_Y3_N24
\inst|OE1~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|OE1~feeder_combout\ = \inst|OE0~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|OE0~regout\,
	combout => \inst|OE1~feeder_combout\);

-- Location: LCFF_X1_Y3_N25
\inst|OE1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst|OE1~feeder_combout\,
	ena => \inst4|ispressed~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|OE1~regout\);

-- Location: LCCOMB_X1_Y3_N0
\inst|OE~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|OE~0_combout\ = (\inst|count~regout\ & (\inst|OE1~regout\)) # (!\inst|count~regout\ & ((\inst|OE0~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|count~regout\,
	datac => \inst|OE1~regout\,
	datad => \inst|OE0~regout\,
	combout => \inst|OE~0_combout\);

-- Location: LCFF_X1_Y3_N1
\inst|OE\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst|OE~0_combout\,
	ena => \inst4|ALT_INV_ispressed~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|OE~regout\);

-- Location: LCCOMB_X2_Y3_N10
\inst|WideOr5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|WideOr5~0_combout\ = (\inst4|inputbottom\(1) & (!\inst4|inputbottom\(3) & ((\inst4|inputbottom\(0)) # (!\inst4|inputbottom\(2))))) # (!\inst4|inputbottom\(1) & (\inst4|inputbottom\(0) & (\inst4|inputbottom\(2) $ (!\inst4|inputbottom\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000010001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|inputbottom\(1),
	datab => \inst4|inputbottom\(0),
	datac => \inst4|inputbottom\(2),
	datad => \inst4|inputbottom\(3),
	combout => \inst|WideOr5~0_combout\);

-- Location: LCFF_X2_Y3_N11
\inst|OF0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst|WideOr5~0_combout\,
	ena => \inst4|ispressed~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|OF0~regout\);

-- Location: LCCOMB_X2_Y3_N4
\inst|OF1~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|OF1~feeder_combout\ = \inst|OF0~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|OF0~regout\,
	combout => \inst|OF1~feeder_combout\);

-- Location: LCFF_X2_Y3_N5
\inst|OF1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst|OF1~feeder_combout\,
	ena => \inst4|ispressed~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|OF1~regout\);

-- Location: LCCOMB_X1_Y3_N22
\inst|OF~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|OF~0_combout\ = (\inst|count~regout\ & ((\inst|OF1~regout\))) # (!\inst|count~regout\ & (\inst|OF0~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|count~regout\,
	datac => \inst|OF0~regout\,
	datad => \inst|OF1~regout\,
	combout => \inst|OF~0_combout\);

-- Location: LCFF_X1_Y3_N23
\inst|OF\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst|OF~0_combout\,
	ena => \inst4|ALT_INV_ispressed~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|OF~regout\);

-- Location: LCCOMB_X2_Y3_N30
\inst|WideOr6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|WideOr6~0_combout\ = (\inst4|inputbottom\(0) & ((\inst4|inputbottom\(3)) # (\inst4|inputbottom\(1) $ (\inst4|inputbottom\(2))))) # (!\inst4|inputbottom\(0) & ((\inst4|inputbottom\(1)) # (\inst4|inputbottom\(2) $ (\inst4|inputbottom\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111101111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|inputbottom\(1),
	datab => \inst4|inputbottom\(0),
	datac => \inst4|inputbottom\(2),
	datad => \inst4|inputbottom\(3),
	combout => \inst|WideOr6~0_combout\);

-- Location: LCFF_X2_Y3_N31
\inst|OG0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst|WideOr6~0_combout\,
	ena => \inst4|ispressed~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|OG0~regout\);

-- Location: LCCOMB_X1_Y3_N30
\inst|OG1~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|OG1~feeder_combout\ = \inst|OG0~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|OG0~regout\,
	combout => \inst|OG1~feeder_combout\);

-- Location: LCFF_X1_Y3_N31
\inst|OG1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst|OG1~feeder_combout\,
	ena => \inst4|ispressed~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|OG1~regout\);

-- Location: LCCOMB_X1_Y3_N28
\inst|OG~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|OG~0_combout\ = (\inst|count~regout\ & (!\inst|OG1~regout\)) # (!\inst|count~regout\ & ((!\inst|OG0~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001001110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|count~regout\,
	datab => \inst|OG1~regout\,
	datad => \inst|OG0~regout\,
	combout => \inst|OG~0_combout\);

-- Location: LCFF_X1_Y3_N29
\inst|OG\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst|OG~0_combout\,
	ena => \inst4|ALT_INV_ispressed~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|OG~regout\);

-- Location: LCCOMB_X1_Y3_N6
\inst|count~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|count~0_combout\ = !\inst|count~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|count~regout\,
	combout => \inst|count~0_combout\);

-- Location: LCFF_X1_Y3_N7
\inst|count\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst|count~0_combout\,
	ena => \inst4|ALT_INV_ispressed~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|count~regout\);

-- Location: LCCOMB_X1_Y3_N2
\inst|DIG2~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|DIG2~feeder_combout\ = \inst|count~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|count~regout\,
	combout => \inst|DIG2~feeder_combout\);

-- Location: LCFF_X1_Y3_N3
\inst|DIG2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst|DIG2~feeder_combout\,
	ena => \inst4|ALT_INV_ispressed~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|DIG2~regout\);

-- Location: LCCOMB_X1_Y3_N12
\inst|DIG3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|DIG3~0_combout\ = !\inst|count~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|count~regout\,
	combout => \inst|DIG3~0_combout\);

-- Location: LCFF_X1_Y3_N13
\inst|DIG3\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst2|clk_250Hz~clkctrl_outclk\,
	datain => \inst|DIG3~0_combout\,
	ena => \inst4|ALT_INV_ispressed~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|DIG3~regout\);

-- Location: PIN_44,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\OA~I\ : cycloneii_io
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
	datain => \inst|ALT_INV_OA~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_OA);

-- Location: PIN_40,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\OB~I\ : cycloneii_io
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
	datain => \inst|ALT_INV_OB~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_OB);

-- Location: PIN_45,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\OC~I\ : cycloneii_io
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
	datain => \inst|ALT_INV_OC~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_OC);

-- Location: PIN_47,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\OD~I\ : cycloneii_io
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
	datain => \inst|ALT_INV_OD~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_OD);

-- Location: PIN_48,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\OE~I\ : cycloneii_io
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
	datain => \inst|ALT_INV_OE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_OE);

-- Location: PIN_41,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\OF~I\ : cycloneii_io
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
	datain => \inst|ALT_INV_OF~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => \ww_OF\);

-- Location: PIN_43,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\OG~I\ : cycloneii_io
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
	datain => \inst|ALT_INV_OG~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_OG);

-- Location: PIN_35,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\DIG0~I\ : cycloneii_io
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
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_DIG0);

-- Location: PIN_36,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\DIG1~I\ : cycloneii_io
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
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_DIG1);

-- Location: PIN_37,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\DIG2~I\ : cycloneii_io
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
	datain => \inst|ALT_INV_DIG2~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_DIG2);

-- Location: PIN_39,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\DIG3~I\ : cycloneii_io
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
	datain => \inst|ALT_INV_DIG3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_DIG3);

-- Location: PIN_34,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\r[3]~I\ : cycloneii_io
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
	datain => \inst4|row.s3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_r(3));

-- Location: PIN_33,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\r[2]~I\ : cycloneii_io
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
	datain => \inst4|ALT_INV_row.s2~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_r(2));

-- Location: PIN_32,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\r[1]~I\ : cycloneii_io
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
	datain => \inst4|ALT_INV_row.s1~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_r(1));

-- Location: PIN_31,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\r[0]~I\ : cycloneii_io
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
	datain => \inst4|ALT_INV_row.s0~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_r(0));
END structure;


