// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Wed Mar 19 13:56:08 2025
// Host        : Siddesh running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file {C:/Users/sidde/Desktop/Verilog/Vending Machine/Vending
//               Machine.sim/sim_1/synth/func/xsim/vending_machine_tb_func_synth.v}
// Design      : vending_machine
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* C0 = "3'b111" *) (* C1 = "3'b001" *) (* C2 = "3'b010" *) 
(* C5 = "3'b101" *) (* S0 = "4'b0000" *) (* S1 = "4'b0001" *) 
(* S10 = "4'b1010" *) (* S2 = "4'b0010" *) (* S3 = "4'b0011" *) 
(* S4 = "4'b0100" *) (* S5 = "4'b0101" *) (* S6 = "4'b0110" *) 
(* S7 = "4'b0111" *) (* S8 = "4'b1000" *) (* S9 = "4'b1001" *) 
(* NotValidForBitStream *)
module vending_machine
   (done,
    product,
    change,
    in,
    start,
    clk,
    reset,
    coins);
  output done;
  output product;
  output [2:0]change;
  input in;
  input start;
  input clk;
  input reset;
  input [2:0]coins;

  wire \FSM_onehot_prv_state[0]_i_1_n_0 ;
  wire \FSM_onehot_prv_state[0]_i_2_n_0 ;
  wire \FSM_onehot_prv_state[0]_i_3_n_0 ;
  wire \FSM_onehot_prv_state[1]_i_1_n_0 ;
  wire \FSM_onehot_prv_state[2]_i_1_n_0 ;
  wire \FSM_onehot_prv_state[3]_i_1_n_0 ;
  wire \FSM_onehot_prv_state[4]_i_1_n_0 ;
  wire \FSM_onehot_prv_state[5]_i_1_n_0 ;
  wire \FSM_onehot_prv_state[6]_i_1_n_0 ;
  wire \FSM_onehot_prv_state[7]_i_1_n_0 ;
  wire \FSM_onehot_prv_state[8]_i_1_n_0 ;
  wire \FSM_onehot_prv_state[9]_i_1_n_0 ;
  wire \FSM_onehot_prv_state_reg_n_0_[0] ;
  wire \FSM_onehot_prv_state_reg_n_0_[10] ;
  wire \FSM_onehot_prv_state_reg_n_0_[1] ;
  wire \FSM_onehot_prv_state_reg_n_0_[2] ;
  wire \FSM_onehot_prv_state_reg_n_0_[3] ;
  wire \FSM_onehot_prv_state_reg_n_0_[4] ;
  wire \FSM_onehot_prv_state_reg_n_0_[5] ;
  wire \FSM_onehot_prv_state_reg_n_0_[6] ;
  wire \FSM_onehot_prv_state_reg_n_0_[7] ;
  wire \FSM_onehot_prv_state_reg_n_0_[8] ;
  wire \FSM_onehot_prv_state_reg_n_0_[9] ;
  wire [2:0]change;
  wire [2:0]change_OBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [2:0]coins;
  wire [2:0]coins_IBUF;
  wire done;
  wire done_OBUF;
  wire in;
  wire in_IBUF;
  wire product;
  wire product_OBUF;
  wire reset;
  wire reset_IBUF;
  wire start;
  wire start_IBUF;

  LUT5 #(
    .INIT(32'hFFFFFFAE)) 
    \FSM_onehot_prv_state[0]_i_1 
       (.I0(\FSM_onehot_prv_state_reg_n_0_[10] ),
        .I1(\FSM_onehot_prv_state_reg_n_0_[0] ),
        .I2(start_IBUF),
        .I3(\FSM_onehot_prv_state[0]_i_2_n_0 ),
        .I4(\FSM_onehot_prv_state[0]_i_3_n_0 ),
        .O(\FSM_onehot_prv_state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0302)) 
    \FSM_onehot_prv_state[0]_i_2 
       (.I0(\FSM_onehot_prv_state_reg_n_0_[6] ),
        .I1(coins_IBUF[1]),
        .I2(coins_IBUF[2]),
        .I3(\FSM_onehot_prv_state_reg_n_0_[7] ),
        .O(\FSM_onehot_prv_state[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h000EEEEE)) 
    \FSM_onehot_prv_state[0]_i_3 
       (.I0(\FSM_onehot_prv_state_reg_n_0_[2] ),
        .I1(\FSM_onehot_prv_state_reg_n_0_[3] ),
        .I2(coins_IBUF[1]),
        .I3(coins_IBUF[0]),
        .I4(coins_IBUF[2]),
        .O(\FSM_onehot_prv_state[0]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \FSM_onehot_prv_state[1]_i_1 
       (.I0(\FSM_onehot_prv_state_reg_n_0_[0] ),
        .I1(start_IBUF),
        .O(\FSM_onehot_prv_state[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \FSM_onehot_prv_state[2]_i_1 
       (.I0(\FSM_onehot_prv_state_reg_n_0_[1] ),
        .I1(in_IBUF),
        .O(\FSM_onehot_prv_state[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h8880)) 
    \FSM_onehot_prv_state[3]_i_1 
       (.I0(\FSM_onehot_prv_state_reg_n_0_[2] ),
        .I1(coins_IBUF[2]),
        .I2(coins_IBUF[0]),
        .I3(coins_IBUF[1]),
        .O(\FSM_onehot_prv_state[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \FSM_onehot_prv_state[4]_i_1 
       (.I0(coins_IBUF[1]),
        .I1(coins_IBUF[0]),
        .I2(\FSM_onehot_prv_state_reg_n_0_[3] ),
        .I3(coins_IBUF[2]),
        .O(\FSM_onehot_prv_state[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \FSM_onehot_prv_state[5]_i_1 
       (.I0(coins_IBUF[2]),
        .I1(coins_IBUF[1]),
        .I2(\FSM_onehot_prv_state_reg_n_0_[3] ),
        .O(\FSM_onehot_prv_state[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_onehot_prv_state[6]_i_1 
       (.I0(\FSM_onehot_prv_state_reg_n_0_[1] ),
        .I1(in_IBUF),
        .O(\FSM_onehot_prv_state[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \FSM_onehot_prv_state[7]_i_1 
       (.I0(coins_IBUF[2]),
        .I1(coins_IBUF[1]),
        .I2(\FSM_onehot_prv_state_reg_n_0_[6] ),
        .O(\FSM_onehot_prv_state[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    \FSM_onehot_prv_state[8]_i_1 
       (.I0(coins_IBUF[0]),
        .I1(coins_IBUF[1]),
        .I2(coins_IBUF[2]),
        .I3(\FSM_onehot_prv_state_reg_n_0_[7] ),
        .O(\FSM_onehot_prv_state[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hEA00)) 
    \FSM_onehot_prv_state[9]_i_1 
       (.I0(coins_IBUF[2]),
        .I1(coins_IBUF[0]),
        .I2(coins_IBUF[1]),
        .I3(\FSM_onehot_prv_state_reg_n_0_[7] ),
        .O(\FSM_onehot_prv_state[9]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "S3:00000000100,S4:00010000000,S2:00001000000,S10:10000000000,S1:00000000010,S0:00000000001,S9:00000100000,S7:00000010000,S8:01000000000,S6:00100000000,S5:00000001000" *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_prv_state_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_onehot_prv_state[0]_i_1_n_0 ),
        .Q(\FSM_onehot_prv_state_reg_n_0_[0] ),
        .S(reset_IBUF));
  (* FSM_ENCODED_STATES = "S3:00000000100,S4:00010000000,S2:00001000000,S10:10000000000,S1:00000000010,S0:00000000001,S9:00000100000,S7:00000010000,S8:01000000000,S6:00100000000,S5:00000001000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_prv_state_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(done_OBUF),
        .Q(\FSM_onehot_prv_state_reg_n_0_[10] ),
        .R(reset_IBUF));
  (* FSM_ENCODED_STATES = "S3:00000000100,S4:00010000000,S2:00001000000,S10:10000000000,S1:00000000010,S0:00000000001,S9:00000100000,S7:00000010000,S8:01000000000,S6:00100000000,S5:00000001000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_prv_state_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_onehot_prv_state[1]_i_1_n_0 ),
        .Q(\FSM_onehot_prv_state_reg_n_0_[1] ),
        .R(reset_IBUF));
  (* FSM_ENCODED_STATES = "S3:00000000100,S4:00010000000,S2:00001000000,S10:10000000000,S1:00000000010,S0:00000000001,S9:00000100000,S7:00000010000,S8:01000000000,S6:00100000000,S5:00000001000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_prv_state_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_onehot_prv_state[2]_i_1_n_0 ),
        .Q(\FSM_onehot_prv_state_reg_n_0_[2] ),
        .R(reset_IBUF));
  (* FSM_ENCODED_STATES = "S3:00000000100,S4:00010000000,S2:00001000000,S10:10000000000,S1:00000000010,S0:00000000001,S9:00000100000,S7:00000010000,S8:01000000000,S6:00100000000,S5:00000001000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_prv_state_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_onehot_prv_state[3]_i_1_n_0 ),
        .Q(\FSM_onehot_prv_state_reg_n_0_[3] ),
        .R(reset_IBUF));
  (* FSM_ENCODED_STATES = "S3:00000000100,S4:00010000000,S2:00001000000,S10:10000000000,S1:00000000010,S0:00000000001,S9:00000100000,S7:00000010000,S8:01000000000,S6:00100000000,S5:00000001000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_prv_state_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_onehot_prv_state[4]_i_1_n_0 ),
        .Q(\FSM_onehot_prv_state_reg_n_0_[4] ),
        .R(reset_IBUF));
  (* FSM_ENCODED_STATES = "S3:00000000100,S4:00010000000,S2:00001000000,S10:10000000000,S1:00000000010,S0:00000000001,S9:00000100000,S7:00000010000,S8:01000000000,S6:00100000000,S5:00000001000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_prv_state_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_onehot_prv_state[5]_i_1_n_0 ),
        .Q(\FSM_onehot_prv_state_reg_n_0_[5] ),
        .R(reset_IBUF));
  (* FSM_ENCODED_STATES = "S3:00000000100,S4:00010000000,S2:00001000000,S10:10000000000,S1:00000000010,S0:00000000001,S9:00000100000,S7:00000010000,S8:01000000000,S6:00100000000,S5:00000001000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_prv_state_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_onehot_prv_state[6]_i_1_n_0 ),
        .Q(\FSM_onehot_prv_state_reg_n_0_[6] ),
        .R(reset_IBUF));
  (* FSM_ENCODED_STATES = "S3:00000000100,S4:00010000000,S2:00001000000,S10:10000000000,S1:00000000010,S0:00000000001,S9:00000100000,S7:00000010000,S8:01000000000,S6:00100000000,S5:00000001000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_prv_state_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_onehot_prv_state[7]_i_1_n_0 ),
        .Q(\FSM_onehot_prv_state_reg_n_0_[7] ),
        .R(reset_IBUF));
  (* FSM_ENCODED_STATES = "S3:00000000100,S4:00010000000,S2:00001000000,S10:10000000000,S1:00000000010,S0:00000000001,S9:00000100000,S7:00000010000,S8:01000000000,S6:00100000000,S5:00000001000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_prv_state_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_onehot_prv_state[8]_i_1_n_0 ),
        .Q(\FSM_onehot_prv_state_reg_n_0_[8] ),
        .R(reset_IBUF));
  (* FSM_ENCODED_STATES = "S3:00000000100,S4:00010000000,S2:00001000000,S10:10000000000,S1:00000000010,S0:00000000001,S9:00000100000,S7:00000010000,S8:01000000000,S6:00100000000,S5:00000001000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_prv_state_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_onehot_prv_state[9]_i_1_n_0 ),
        .Q(\FSM_onehot_prv_state_reg_n_0_[9] ),
        .R(reset_IBUF));
  OBUF \change_OBUF[0]_inst 
       (.I(change_OBUF[0]),
        .O(change[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFC800080)) 
    \change_OBUF[0]_inst_i_1 
       (.I0(\FSM_onehot_prv_state_reg_n_0_[5] ),
        .I1(coins_IBUF[1]),
        .I2(coins_IBUF[2]),
        .I3(coins_IBUF[0]),
        .I4(\FSM_onehot_prv_state_reg_n_0_[9] ),
        .O(change_OBUF[0]));
  OBUF \change_OBUF[1]_inst 
       (.I(change_OBUF[1]),
        .O(change[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h8F008000)) 
    \change_OBUF[1]_inst_i_1 
       (.I0(\FSM_onehot_prv_state_reg_n_0_[5] ),
        .I1(coins_IBUF[0]),
        .I2(coins_IBUF[1]),
        .I3(coins_IBUF[2]),
        .I4(\FSM_onehot_prv_state_reg_n_0_[9] ),
        .O(change_OBUF[1]));
  OBUF \change_OBUF[2]_inst 
       (.I(change_OBUF[2]),
        .O(change[2]));
  LUT3 #(
    .INIT(8'h80)) 
    \change_OBUF[2]_inst_i_1 
       (.I0(coins_IBUF[1]),
        .I1(coins_IBUF[2]),
        .I2(\FSM_onehot_prv_state_reg_n_0_[9] ),
        .O(change_OBUF[2]));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  IBUF \coins_IBUF[0]_inst 
       (.I(coins[0]),
        .O(coins_IBUF[0]));
  IBUF \coins_IBUF[1]_inst 
       (.I(coins[1]),
        .O(coins_IBUF[1]));
  IBUF \coins_IBUF[2]_inst 
       (.I(coins[2]),
        .O(coins_IBUF[2]));
  OBUF done_OBUF_inst
       (.I(done_OBUF),
        .O(done));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    done_OBUF_inst_i_1
       (.I0(\FSM_onehot_prv_state_reg_n_0_[5] ),
        .I1(\FSM_onehot_prv_state_reg_n_0_[4] ),
        .I2(\FSM_onehot_prv_state_reg_n_0_[9] ),
        .I3(\FSM_onehot_prv_state_reg_n_0_[8] ),
        .O(done_OBUF));
  IBUF in_IBUF_inst
       (.I(in),
        .O(in_IBUF));
  OBUF product_OBUF_inst
       (.I(product_OBUF),
        .O(product));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'hE)) 
    product_OBUF_inst_i_1
       (.I0(\FSM_onehot_prv_state_reg_n_0_[4] ),
        .I1(\FSM_onehot_prv_state_reg_n_0_[5] ),
        .O(product_OBUF));
  IBUF reset_IBUF_inst
       (.I(reset),
        .O(reset_IBUF));
  IBUF start_IBUF_inst
       (.I(start),
        .O(start_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
