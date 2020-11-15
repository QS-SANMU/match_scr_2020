`timescale 1ns / 1ps

module top_fpga_usart(
	//system signals
	input				clk,
	input				rst_n,
	//usart signals
	input				data_in,
	output				data_out,
	output		[2:0]	angle_ulr,
	//各种信息
	input				temp_hum_rx,//温度湿度
	input				light_data_rx,//光强
	input				red_lazer_temp_data_rx,//红外
	input				burn_judge_data_in,//火焰
	input				co_judge_data_in,//co
	input				combustible_judge_data_in,//可燃气体
	input		[8:0]	angle_x_use,
	input		[8:0]	angle_z_use,
	input		[8:0]	angle_z_camera,
	input		[8:0]	angle_x_camera,
	input				compass_data_rx,
	output				compass_data_tx,
	input				air_pressure_data_in,
	input 				Echo,
	output 	 			trig,
	//摇杆方向
	input				keys_fire,
	input 				keys_up_in,
	input 				keys_down_in,
	input 				keys_left_in,
	input 				keys_right_in,

	output		[5:0]	state,
	//finger
	input				finger_data_in,
	output				finger_data_out,
	//
	input				voice_data_in,
	output				data_out_speech,

	//
	input				seen
    );

//----------------------------------------------------------------------------信号------------------------------------------------------	
localparam	asci_0		=	8'b0011_0000;
localparam	asci_1		=	8'b0011_0001;
localparam	asci_2		=	8'b0011_0010;
localparam	asci_3		=	8'b0011_0011;
localparam	asci_4		=	8'b0011_0100;
localparam	asci_5		=	8'b0011_0101;
localparam	asci_6		=	8'b0011_0110;
localparam	asci_7		=	8'b0011_0111;
localparam	asci_8		=	8'b0011_1000;
localparam	asci_9		=	8'b0011_1001;
localparam	asci_space	=	8'b0010_0000;
localparam 	asci_N		=   8'b0100_1110;
localparam  asci_O		=   8'b0100_1111;
localparam	asci_s		=	8'b0111_0011;
localparam	asci_a		=	8'b0110_0001;
localparam	asci_f		=	8'b0110_0110;
localparam	asci_e		=	8'b0110_0101;
localparam	asci_d		=	8'b0110_0100;
localparam	asci_n		=	8'b0110_1110;
localparam	asci_g		=	8'b0110_0111;
localparam	asci_r		=	8'b0111_0010;	
localparam	asci_du	=	8'b0010_1010;
wire	[47:0]	color_up;
wire	[47:0]	color_dowm;
wire	[47:0]	color_left;
wire	[47:0]	color_right;
wire	[7:0]	data_rx;
wire			rx_vld;
wire			tx_en;
wire	[7:0]	data_tx;
reg		[5:0]	state_t;
reg 			seen_t;
//
wire	[7:0]	rx_data_voice;
wire			rx_vld_voice;
//
wire	[15:0]	data_o_o;//xx体表温度
wire	[23:0]	data_l_out;//xxx光强
//finger_data
wire			check_ok;
wire			check_no;
//
wire			burn_show;
wire			co_show;
wire			combustible_show;
//格式转换
wire	[39:0]	temp_hum_data_h;//xx.xx环境温度
wire	[39:0]	temp_hum_data_t;//xx.xx环境湿度
wire	[39:0]  compass_data_zhinan;
wire 	[55:0]	air_pressure_data_p;
wire 	[39:0]	air_pressure_data_h;
wire 	[15:0]	chaoshengbo_data;
wire	[47:0]	asci_comapss;
wire	[47:0]	asci_temp_hum_data_h;//xx.xx环境温度
wire	[47:0]	asci_temp_hum_data_t;//xx.xx环境湿度
wire	[47:0]	asci_aim_angle_z;
wire	[47:0]	asci_aim_angle_x;
wire	[47:0]	asci_now_angle_z;
wire	[47:0]	asci_now_angle_x;
wire 	[47:0]	asci_red_lazer_temp;
wire 	[47:0]	asci_data_l_light;
wire 	[47:0]	fire_show;
wire	[47:0]	asci_aim_z;
wire 	[47:0]	asci_aim_x;
wire 	[47:0]	asci_chaoshengbo;
//火焰，CO，可燃气体
wire 	[47:0]	asci_burn_show;
wire 	[47:0]	asci_co_show;
wire 	[47:0]	asci_combustible_show;

wire 	[47:0]	asci_airpressure_h;
wire 	[47:0]	asci_airpressure_p;

wire	[47:0]	asci_longitude;
wire	[47:0]	asci_dimension;

//
wire [7:0]page_data;
wire page_data_en;
wire data_page_flag;
//
wire cmd_1;
wire cmd_2;
wire cmd_3;
wire cmd_4;
wire cmd_5;
wire cmd_6;
wire cmd_7;
wire cmd_8;
wire cmd_9;

reg co_judge_data_in_t;
reg burn_judge_data_in_t;
//----------------------------------------------------------------------------信号------------------------------------------------------


//-------------------------------------------------------------------------串口屏通信选择------------------------------------------------
	UART UART_rx_tx_analyasis(
	//system signal
    .clk				(clk),
    .rst				(rst_n),
	//rx_in
    .data_in			(data_in),
	//tx_in
    .data_tx			(data_tx),
	.tx_en				(tx_en),
	//tx_out
    .data_out			(data_out_rx_tx_analysis),
	//rx_out
	.data_rx			(data_rx),
	.rx_vld				(rx_vld)//uart接收到,拉高一个周期
    );

	UART UART_usart_page_change(
	//system signal
    .clk				(clk),
    .rst				(rst_n),
	//rx_in
    .data_in			(voice_data_in),
	//tx_in
    .data_tx			(page_data),
	.tx_en				(page_data_en),
	//tx_out
    .data_out			(data_out_page_change),
	//rx_out
	.data_rx			(rx_data_voice),
	.rx_vld				(rx_vld_voice)//uart接收到,拉高一个周期
    );
assign data_out = data_page_flag ? data_out_page_change : data_out_rx_tx_analysis;
//-------------------------------------------------------------------------串口屏通信选择------------------------------------------------

//--------------------------------------------------------------------------状态分析数据选择---------------------------------------------
//判断串口屏当前所处状态
state_analysis state_analysis(
	//-----------------------------------------------system signals
	.clk				(clk),
	.rst_n				(rst_n),
	.rx_vld				(rx_vld),
	.rx_data			(data_rx),
	
	.state				(state)
    );
//对来自语音模块和指纹模块的数据结合当前状态进行分析
usart_page_change usart_page_change(
	.clk					(clk),
	.rst_n					(rst_n),
	.check_ok				(check_ok),
	.check_no				(check_no),
	.state					(state),
	//
	.page_data				(page_data),
	.data_en				(page_data_en),
	//UART_RX_voice input
	.voice_data				(rx_data_voice),
	.voice_vld				(rx_vld_voice),

	.data_en_flag			(data_page_flag)//拉高时向usart发送此UART_usart_page_change数据
);
//对来自串口屏的数据进行分析
rx_tx_analysis rx_tx_analysis(
	//system signals
	.clk				(clk),
	.rst_n				(rst_n),
	//state_analysis
	.state				(state),
	//all message
	.aim_angle_z		(asci_aim_z),
	.aim_angle_x		(asci_aim_x),
	.now_angle_z		(asci_now_angle_z),
	.now_angle_x		(asci_now_angle_x),
	.humidity			(asci_temp_hum_data_h), 
	.anbient_temp		(asci_temp_hum_data_t), 
	.body_temp			(asci_red_lazer_temp), 
	.light_intensity	(asci_data_l_light),   
	.fire_show			(fire_show),
	.longitude 			(asci_longitude),
	.dimension 			(asci_dimension),
	.up_show			(color_up),
	.dowm_show			(color_dowm),
	.left_show			(color_left),
	.right_show			(color_right),
	.pressure			(asci_airpressure_p),
	.altitude			(asci_airpressure_h),
	.flame				(asci_burn_show),
	.co					(asci_co_show),
	.combustible_gas	(asci_combustible_show),
	.comapss			(asci_comapss),
	.chaoshengbo		(asci_chaoshengbo),
	//UART in usart
	.data_rx			(data_rx),
	.rx_vld				(rx_vld),
	.data_tx			(data_tx),
	.tx_en				(tx_en),
	//output
	.angle_ulr			(angle_ulr)
    );
//--------------------------------------------------------------------------状态分析数据选择---------------------------------------------

//--------------------------------------------------------------------外设模块---------------------------------------------------
light_top light_top(
	.clk				(clk),
	.rst				(rst_n),
	.data_rx			(light_data_rx),
	.data_l_out			(data_l_out)

   );
   
red_lazer_temp_top red_lazer_temp_top(
	.clk				(clk),
	.rst				(rst_n),
	.data_rx			(red_lazer_temp_data_rx),
	.data_o_o			(data_o_o)
   );
temp_hum_top temp_hum_top(
	.clk				(clk),
	.rst				(rst_n),
	.data_rx			(temp_hum_rx),
	.data_t				(temp_hum_data_t),
	.data_h				(temp_hum_data_h)
   );
//指纹模块
top_finger top_finger(
	.clk				(clk),
	.rst				(rst_n),
	.data_in			(finger_data_in),	
	//finger out to finger
	.data_out			(finger_data_out),
	//finger to fpga to usart
	.check_ok			(check_ok),
	.check_no			(check_no)
	);
top_speech top_speech(
	.clk     			(clk),
	.rst	    		(rst_n),
	.cmd_1   			(cmd_1),                  //自动模式
	.cmd_2   			(cmd_2),                  //辅助模式
	.cmd_3   			(cmd_3),                  //摇杆模式
	.cmd_4   			(cmd_4),                  //环境信息
	.cmd_5   			(cmd_5),                  //指纹正确
	.cmd_6   			(cmd_6),                  //指纹错误
	.cmd_7   			(cmd_7),                  //发现目标
	.cmd_8   			(cmd_8),                  //目标消失 //前一始终有，后一时钟周期消失
//	.cmd_9   			(cmd_9),                  //一氧化碳警告
//	.cmd_10  			(cmd_10),                 //火焰警告
//	.cmd_11  			(cmd_11),                 //以获取最高权限
	.data_out			(data_out_speech)
    );
fire_judge fire_judge(//火焰
	.data_in			(burn_judge_data_in),
	.flag				(burn_show)
    );
//fire_judge CO_judge(//一氧化碳
//	.data_in			(co_judge_data_in),
//	.flag				(co_show)
 //   );
	c0_judge CO_judge(                 //low is value
	.data_in(co_judge_data_in),
	.data_out(co_show)
    );
	
	
fire_judge combustible_judge(//可燃气体
	.data_in			(combustible_judge_data_in),
	.flag				(combustible_show)
    );
top_compass top_compass(//指南针
	.clk				(clk),
	.rst				(rst_n),
	.data_rx			(compass_data_rx),
	.data_tx			(compass_data_tx),
	.data_zhinan    	(compass_data_zhinan)//方位     ASCII码
   );
top_air_pressure top_air_pressure(
	.clk				(clk),
	.rst				(rst_n),
	.data_in			(air_pressure_data_in),
	.data_p				(air_pressure_data_p),
	.data_h				(air_pressure_data_h)
    );
drive chaoshengbo_drive(
	//system singnals
	.s_clk(clk) 		,
	.s_rst_n(rst_n) 	,
	//supersonic wave module singnals
	.Echo(Echo) 		,
	.trig(trig) 		,
	//connect with Nixie tube display
	.data (chaoshengbo_data)	
    );




always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		state_t <= 6'b0;
	end
	else begin
		state_t <= state;
	end
end
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		seen_t <= 1'b0;
	end
	else begin
		seen_t <= seen;
	end
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		co_judge_data_in_t <= 1;
		burn_judge_data_in_t <= 1;
	end
	else begin
		co_judge_data_in_t <=co_judge_data_in;
		burn_judge_data_in_t <= burn_judge_data_in;
	end
end
assign cmd_1 = ((state != state_t) && state == 6'b000_100) ? 1'b1 : 1'b0;
assign cmd_2 = ((state != state_t) && state == 6'b001_000) ? 1'b1 : 1'b0;
assign cmd_3 = ((state != state_t) && state == 6'b010_000) ? 1'b1 : 1'b0;
assign cmd_4 = ((state != state_t) && state == 6'b100_000) ? 1'b1 : 1'b0;
assign cmd_5 = (check_ok && state == 6'b000_001) ? 1'b1 : 1'b0;
assign cmd_6 = (check_no && state == 6'b000_001) ? 1'b1 : 1'b0;
assign cmd_7 = ((state == 6'b000_100) && (!seen_t && seen)) ? 1'b1 : 1'b0;
assign cmd_8 = ((state == 6'b000_100) && (seen_t && !seen)) ? 1'b1 : 1'b0;
assign cmd_9 = (co_judge_data_in_t && !co_judge_data_in) ? 1'b1 : 1'b0;// co_judge_data_in;//
assign cmd_10 = (burn_judge_data_in_t && !burn_judge_data_in) ? 1'b1 : 1'b0;// burn_judge_data_in;//不知道行不,试了不行
//assign cmd_10 = 
//assign cmd_11 =  
//--------------------------------------------------------------------外设模块---------------------------------------------------

//------------------------------------------------------格式转换-------------------------------------------------------------------
bin_asci bin_asci_1(//bin转asci码
	.bin				(angle_x_use - 9'd30),
	.asci				(asci_now_angle_x)
    );
bin_asci bin_asci_2(//bin转asci码
	.bin				(9'd360 - angle_z_use),
	.asci				(asci_now_angle_z)
    );
bin_asci bin_asci_3(//bin转asci码
	.bin				(angle_x_camera - 9'd30),
	.asci				(asci_aim_angle_x)
    );
bin_asci bin_asci_4(//bin转asci码
	.bin				(9'd360 - angle_z_camera),
	.asci				(asci_aim_angle_z)
    );
bcd_asci bcd_asci_1(
    .bcd				(data_o_o[3:0]),
    .asci				(asci_red_lazer_temp[23:16])
    );
bcd_asci bcd_asci_2(
    .bcd				(data_o_o[11:8]),
    .asci				(asci_red_lazer_temp[31:24])
    );


bcd_asci bcd_asci_3(
    .bcd				(data_l_out[19:16]),
    .asci				(asci_data_l_light[31:24])
    );
bcd_asci bcd_asci_4(
    .bcd				(data_l_out[11:8]),
    .asci				(asci_data_l_light[23:16])
    );
bcd_asci bcd_asci_5(
    .bcd				(data_l_out[3:0]),
    .asci				(asci_data_l_light[15:8])
    );
bcd_asci bcd_asci_6(
    .bcd				(chaoshengbo_data[3:0]),
    .asci				(asci_chaoshengbo[15:8])
    );
bcd_asci bcd_asci_7(
    .bcd				(chaoshengbo_data[7:4]),
    .asci				(asci_chaoshengbo[23:16])
    );
bcd_asci bcd_asci_8(
    .bcd				(chaoshengbo_data[11:8]),
    .asci				(asci_chaoshengbo[31:24])
    );
bcd_asci bcd_asci_9(
    .bcd				(chaoshengbo_data[15:12]),
    .asci				(asci_chaoshengbo[39:32])
    );
assign asci_temp_hum_data_h = {asci_space,temp_hum_data_h};
assign asci_temp_hum_data_t = {asci_space,temp_hum_data_t};
assign  color_up		= (keys_up_in == 1'b1) 		? {asci_0,asci_6,asci_3,asci_4,asci_8,asci_8} : {asci_0,asci_6,asci_5,asci_5,asci_3,asci_5} ;
assign  color_dowm		= (keys_down_in ==1'b1)		? {asci_0,asci_6,asci_3,asci_4,asci_8,asci_8} : {asci_0,asci_6,asci_5,asci_5,asci_3,asci_5} ;
assign  color_left		= (keys_left_in == 1'b1)	? {asci_0,asci_6,asci_3,asci_4,asci_8,asci_8} : {asci_0,asci_6,asci_5,asci_5,asci_3,asci_5} ;
assign  color_right		= (keys_right_in == 1'b1) 	? {asci_0,asci_6,asci_3,asci_4,asci_8,asci_8} : {asci_0,asci_6,asci_5,asci_5,asci_3,asci_5} ;
assign  fire_show		= (keys_fire == 1'b1) ? {asci_0,asci_6,asci_3,asci_4,asci_8,asci_8} : {asci_0,asci_6,asci_5,asci_5,asci_3,asci_5} ;
assign	asci_red_lazer_temp[47:32] = {2{asci_space}};
assign	asci_data_l_light[47:32] = {2{asci_space}};
assign	asci_red_lazer_temp[15:0] = {2{asci_space}} ;
assign	asci_data_l_light[7:0] = asci_space;
assign 	asci_aim_z = (seen) ? asci_aim_angle_z : {asci_space,asci_space,asci_N,asci_O,asci_space,asci_space};
assign	asci_aim_x = (seen) ? asci_aim_angle_x : {asci_space,asci_space,asci_N,asci_O,asci_space,asci_space};
assign	asci_burn_show = (burn_show == 1'b1) ? {asci_d,asci_a,asci_n,asci_g,asci_e,asci_r} : {asci_space,asci_s,asci_a,asci_f,asci_e,asci_space};
assign	asci_comapss = {asci_space,compass_data_zhinan};
assign  asci_chaoshengbo[7:0] = asci_space;
assign  asci_chaoshengbo[47:40] = asci_space;
//经纬度
assign	asci_longitude = {asci_space,asci_3,asci_4,asci_du,asci_9,asci_space};
assign	asci_dimension = {asci_1,asci_0,asci_8,asci_du,asci_5,asci_3};


assign	asci_airpressure_h = {asci_space,air_pressure_data_h};
assign	asci_airpressure_p = {asci_space,air_pressure_data_p[55:16]};
assign	asci_co_show = (co_show == 1'b1) ? {asci_d,asci_a,asci_n,asci_g,asci_e,asci_r} : {asci_space,asci_s,asci_a,asci_f,asci_e,asci_space};
assign	asci_combustible_show	= (combustible_show == 1'b1) ? {asci_d,asci_a,asci_n,asci_g,asci_e,asci_r} : {asci_space,asci_s,asci_a,asci_f,asci_e,asci_space};
//------------------------------------------------------格式转换-------------------------------------------------------------------

endmodule
