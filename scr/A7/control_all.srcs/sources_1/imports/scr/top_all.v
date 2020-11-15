`timescale 1ns / 1ps

module top_all(
	input				clk				,
	input				rst_n			,
	//usart数据输入输出
	input				uasrt_data_in	,
	output				usart_data_out	,
	//摇杆输入
	input				keys_up_in		,
	input				keys_down_in	,
	input				keys_left_in	,
	input				keys_right_in	,
	input				fire_data_in	,
	//各种传感器
	input				temp_hum_rx		,//温度湿度
	input				light_data_rx	,//光强
	input				red_lazer_temp_data_rx			,//红外，体温
	input				compass_data_rx	,//指南针
	output				compass_data_tx	,
	input				air_pressure_data_in			,//气压高度
	//舵机
	output				pwm_z			,
	output				pwm_x			,
	output				pwm_camera		,
	//指纹输入输出
	input				finger_data_in	,
	output				finger_data_out	,
	//mpu传感器
	input				mpu_data_in		,
	//检测传感器
	input				burn_judge_data_in				,//火焰
	input				co_judge_data_in				,//co
	input				combustible_judge_data_in		,//可燃气体
	//语音输入
	input				voice_data_in	,
	//短信模块
	output				message_data_tx	,
	//播报模块
	output				data_out_speech	,
	//超声测距
	input 				Echo 			,
	output 	 			trig 			,
	//摄像头传来的具体角度
	input				angle_z_data_in	,
	input				angle_x_data_in	,
	input				seen			,
	//开火按钮
	output				fire_data_out	,
input wire pclk,
input wire vsync,
input wire href,
input wire [7:0] d,

//input wire key, 
//--------------------------SRAM
//inout wire [15:0] 	sram_data,
//
//output reg			sram_oe_r,
//output reg			sram_ce_r,
//output reg			sram_we_r,
//output reg			sram_ub_r,
//output reg			sram_lb_r,
//output wire [18:0] 	sram_addr,
//------------------------------
output [4:0] vga_red,
output [5:0] vga_green,
output [4:0] vga_blue, 
output  vga_hsync,
output  vga_vsync,
output wire xclk,
output wire I2C_SCLK,
output wire I2C_SDAT,
output wire pwdm,
output wire reset_cam

    );
	wire	[8:0]	angle_x_use;
	wire	[8:0]	angle_z_use;
	wire	[8:0]	angle_z_camera;
	wire	[8:0]	angle_x_camera;
	wire 	[2:0]	angle_ulr;
	wire 	[5:0]	state;
	wire            clk_s;
	wire 			data_z_vld;
	wire 			data_x_vld;
	wire 	[7:0]	angle_z_camera_tmp;
	wire 	[7:0]	angle_x_camera_tmp;
	wire 	[7:0]	angle_z_camera_tmp_t;
	wire 	[7:0]	angle_x_camera_tmp_t;
	
	wire	up_out		;
	wire	down_out	;
	wire	left_out	;
	wire	right_out	;
	wire	midle_out	;

	wire	seen_t;

angle_wen angle_wen(
    .clk(clk),
    .rst_n(rst_n),

    .angle_z_in(angle_z_camera_tmp),
    .angle_x_in(angle_x_camera_tmp),

    .angle_z_out(angle_z_camera_tmp_t),
    .angle_x_out(angle_x_camera_tmp_t)
    );


key_debounce key_debounce_seen(
    .clk(clk),
    .rst(rst_n),
    .key_in(seen),
    .key_state_out(seen_t)
    );
OV_VGA_TEST OV_VGA_TEST(
.clk100				(clk),
.pclk				(pclk),
.vsync				(vsync),
.href				(href),
.d					(d),
.vga_red			(vga_red),
.vga_green			(vga_green),
.vga_blue			(vga_blue), 
.vga_hsync			(vga_hsync),
.vga_vsync			(vga_vsync),
.xclk				(xclk),
.I2C_SCLK			(I2C_SCLK),
.I2C_SDAT			(I2C_SDAT),
.pwdm				(pwdm),
.reset_cam			(reset_cam)
    );

	clk_system clk_system(
	.clk(clk),
	.rst_n(rst_n),
	.clk_s(clk_s)
    );
//-------------------------------------------------------------------------------
	UART_RX ANGLE_Z_UART_RX(
	.clk				(clk_s),
	.rst				(rst_n),
	.data_rx			(angle_z_data_in),
	.tx_en				(data_z_vld),
	.rx_data			(angle_z_camera_tmp)
	);
	UART_RX ANGLE_X_UART_RX(
	.clk				(clk_s),
	.rst				(rst_n),
	.data_rx			(angle_x_data_in),
	.tx_en				(data_x_vld),
	.rx_data			(angle_x_camera_tmp)
	);
//

//---------------------------------------------------------------------------------------串口屏传感器部分-------------------------------------------
top_fpga_usart top_fpga_usart_1(
	//system signals
	.clk				(clk_s),
	.rst_n				(rst_n),
	//usart signals
	.data_in			(uasrt_data_in),
	.data_out			(usart_data_out),
	//手动模式前左右选择
	.angle_ulr			(angle_ulr),
	//给串口输出信息的各模块的输入输出
	.temp_hum_rx		(temp_hum_rx),
	.light_data_rx		(light_data_rx),
	.red_lazer_temp_data_rx(red_lazer_temp_data_rx),
	.angle_x_use		(angle_x_use),
	.angle_z_use		(angle_z_use),
	.angle_z_camera		(angle_z_camera),
	.angle_x_camera		(angle_x_camera),
	.finger_data_in		(finger_data_in),
	.finger_data_out	(finger_data_out),
	//摇杆输入
	.keys_fire			(midle_out),
	.keys_up_in			(up_out),
	.keys_down_in		(down_out),
	.keys_left_in		(left_out),
	.keys_right_in		(right_out),
	//超声波
	.Echo				(Echo),
	.trig				(trig),
	//分析的得出的状态
	.state				(state),
	//火焰传感器
	.burn_judge_data_in	(burn_judge_data_in),
	.co_judge_data_in	(co_judge_data_in),//co
	.combustible_judge_data_in(combustible_judge_data_in),//可燃气体
	//语音识别输入
	.voice_data_in		(voice_data_in),
	//语音播报输出
	.data_out_speech	(data_out_speech),
	//摄像头是否检测到
	.seen				(seen_t),
	//气压高度
	.air_pressure_data_in(air_pressure_data_in),
	//指南针
	.compass_data_rx	(compass_data_rx),
	.compass_data_tx	(compass_data_tx)
    );
//---------------------------------------------------------------------------------------串口屏传感器部分-------------------------------------------

//-----------火焰------------------------------------------------------------------发射----------------------------------------------------------------
/*fire_judge fire_judge(
	.data_in			(fire_data_in),
	.flag				(fire)
    );
//-----------------------------------------------------------------------------发射----------------------------------------------------------------
*/
//---------------------------------------------------------------------------舵机控制部分-----------------------------------------------------------
top_angle_analysils top_angle_analysils_1(
	//system signal
	.clk				(clk_s),
	.rst_n				(rst_n),
	//mpu输入
	.mpu_data_in		(mpu_data_in),
	//摇杆输入
	.keys_up_in			(~keys_up_in	),
	.keys_down_in		(~keys_down_in),
	.keys_left_in		(~keys_left_in),
	.keys_right_in		(~keys_right_in),
	.fire_data_in		(~fire_data_in),


	.up_out				(up_out		),
	.down_out			(down_out	),
	.left_out			(left_out	),
	.right_out			(right_out	),
	.midle_out			(midle_out	),

	
	//状态
	.state				(state),
	//串口屏选择炮筒角度
	.angle_ulr			(angle_ulr),
	//舵机控制PWM波
	.pwm_z				(pwm_z),
	.pwm_x				(pwm_x),
	.pwm_camera			(pwm_camera),
	//输出给串口屏用的的角度
	.angle_x_use_t		(angle_x_use),
	.angle_z_use_t		(angle_z_use),
	.angle_z_camera		(angle_z_camera),
	.angle_x_camera		(angle_x_camera),
	//给串口屏用的自动检测
	.data_x_vld 					(data_x_vld),
	.angle_x_camera_tmp 			(angle_x_camera_tmp_t),
	.data_z_vld 					(data_z_vld),	
	.angle_z_camera_tmp 			(angle_z_camera_tmp_t),
    .stop_camera                    (seen_t)
    );
//---------------------------------------------------------------------------舵机控制部分-----------------------------------------------------------

//-------------------------------------------------信息模块-------------------------------------------------------------------
top_message_drive top_message_drive(
	.clk				(clk_s),
	.rst				(rst_n),
	.data_tx			(message_data_tx)
    );
//-------------------------------------------------信息模块-------------------------------------------------------------------


//--------------------------------------------------发射控制-------------------------------------------------------------------
assign fire_data_out = midle_out;
//--------------------------------------------------发射控制-------------------------------------------------------------------
endmodule
