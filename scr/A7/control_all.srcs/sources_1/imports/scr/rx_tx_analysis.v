`timescale 1ns / 1ps

//-------------------------------------------------------------四个页面中信息的刷新-------------------------------------------------------------------------
module rx_tx_analysis(
	//system signals
	input				clk,
	input				rst_n,
	//state_analysis
	input		[5:0]	state,
	//all message
	input		[47:0]	aim_angle_z,
	input		[47:0]	aim_angle_x,
	input		[47:0]	now_angle_z,
	input		[47:0]	now_angle_x,
	
	input		[47:0]	fire_show,//					颜色65535
	input		[47:0]	up_show,
	input		[47:0]	dowm_show,
	input		[47:0]	left_show,
	input		[47:0]	right_show,

	input		[47:0]	light_intensity,
	input		[47:0]	body_temp,//0~99体表温度	
	input		[47:0]	anbient_temp,//0~99环境温度	
	input		[47:0]	humidity,//湿度
	input		[47:0]	pressure,//气压
	input		[47:0]	altitude,//海拔
	input		[47:0]	longitude,//经度
	input		[47:0]	dimension,//纬度
	input		[47:0]	comapss,//utc时间
	input		[47:0]	flame,//火焰
	input		[47:0]	co,//一氧化碳
	input		[47:0]	combustible_gas,//可燃气体
	input		[47:0]	chaoshengbo,
	//UART
	input		[7:0]	data_rx,//发射
	input				rx_vld,
	output	reg	[7:0]	data_tx,
	output	reg			tx_en,//发送使能
	//
	output	reg	[2:0]	angle_ulr
    );

	
	localparam	IDEL = 8'b000_001;//密码验证状态 
	localparam	S3 =   8'b000_010;//功能选择页面
	localparam	S4 =   8'b000_100;//自动
	localparam	S5 =   8'b001_000;//手动
	localparam	S6 =   8'b010_000;//摇杆瞄准
	localparam	S7 =   8'b100_000;//环境信息


	reg	[20:0]	cnt_9600;
	localparam	NUM_9600 = 21'd60000;
	wire		pos_9600;
	//每个页面每条信息刷新则加1,定位此时发送的数据是什么
	reg	[4:0]	cnt_message;
	reg	[63:0]	message_need;
	reg	[15:0]	aim_num;
	reg	[23:0]	aim_type;
	reg	[7:0]	page_num;
	reg			start_tx;
	//page0 ~ page1 message
	wire		add_cnt_message;
	wire		send_time;
	localparam	asci_p		=	8'b0111_0000;
	localparam	asci_a		=	8'b0110_0001;
	localparam	asci_g		=	8'b0110_0111;
	localparam	asci_e		=	8'b0110_0101;
	localparam	asci_t		=	8'b0111_0100;
	localparam	asci_x		=	8'b0111_1000;
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
	localparam	asci_spot	=	8'b0010_1110;//.
	localparam	asci_sem	=	8'b0010_0010;//"
	localparam	asci_equal	=	8'b0011_1101;//=
	localparam	asci_c		=	8'b0110_0011;
	localparam	asci_b		=	8'b0110_0010;
	localparam	asci_o		=	8'b0110_1111;
	//---------------------------------------------------------------------------------发送时序控制----------------------------------------------------------------
	//发送单个数据的时间
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)
			cnt_9600 <= 21'b0;
		else if(!start_tx)//进入一个新页面开始计数
			cnt_9600 <= 21'b0;
		else if(cnt_9600 >= NUM_9600)
			cnt_9600 <= 21'b0;
		else
			cnt_9600 <= cnt_9600 + 1'b1;
	end
	assign pos_9600 = cnt_9600 == NUM_9600;
	//tx_numbear//发送的数目
	reg	[7:0]	num_message;
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)
			num_message <= 8'b0;
		else if(!start_tx)
			num_message <= 8'b0;
		else if(num_message >= 8'd24)
			num_message <= 8'b0;
		else if(pos_9600)
			num_message <= num_message + 1'b1;
	end
	assign add_cnt_message = num_message >= 8'd24;
	assign send_time = cnt_9600 >= 13'd100 && cnt_9600 <= 13'd200;

	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)
			start_tx <= 1'b0;
		else if(state == S4 || state == S5 || state == S6 || state == S7)
			start_tx <= 1'b1;
		else
			start_tx <= 1'b0;
	end
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)begin
			cnt_message <= 5'b0;
		end
		else begin
			case(state)
				S4:begin//每次发送18位
					if(!start_tx)
						cnt_message <= 5'b0;
					else if(cnt_message >= 5'd6)
						cnt_message <= 5'd0;
					else if(add_cnt_message)
						cnt_message <= cnt_message + 1'b1;
				end
				S5:begin
					if(!start_tx)
						cnt_message <= 5'b0;
					else if(cnt_message >= 5'd4)
						cnt_message <= 5'd0;
					else if(add_cnt_message)
						cnt_message <= cnt_message + 1'b1;
				end
				S6:begin
					if(!start_tx)
						cnt_message <= 5'b0;
					else if(cnt_message >= 5'd8)
						cnt_message <= 5'd0;
					else if(add_cnt_message)
						cnt_message <= cnt_message + 1'b1;
				end
				S7:begin
					if(!start_tx)
						cnt_message <= 5'b0;
					else if(cnt_message >= 5'd13)
						cnt_message <= 5'd0;
					else if(add_cnt_message)
						cnt_message <= cnt_message + 1'b1;
				end
				default:begin
					cnt_message <= 5'b0;
				end
				endcase
			end
		end
//-------------------------------------------------------------------------------发送使能--------------------------------------------------------------------
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)begin
			tx_en <= 1'b0;
		end
		else begin
			if(send_time)begin
				case(state)
					IDEL:begin
						tx_en <= 1'b0;
					end
					S4:begin//每次发送18位
						if(cnt_message < 5'd6)
							tx_en <= 1'b1;
						else
							tx_en <= 1'b0;
					end
					S5:begin
						if(cnt_message < 5'd4)
							tx_en <= 1'd1;
						else
							tx_en <= 1'b0;
					end
					S6:begin
						if(cnt_message < 5'd8)
							tx_en <= 1'd1;
						else
							tx_en <= 1'b0;
					end
					S7:begin
						if(cnt_message < 5'd13)
							tx_en <= 1'd1;
						else
							tx_en <= 1'd0;
					end
					default:begin
						tx_en <= 1'b0;
					end
					endcase
			end
			else begin
				tx_en <= 1'b0;
			end
		end
	end
	
//------------------------------------------------------------------------------发送信息选择-----------------------------------------------------------
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)begin
			page_num  		<= 8'b0;
			aim_num			<= 16'b0;
			message_need	<= 64'b0;
			aim_type 		<= 24'b0;
		end
		else begin
			case(state) 
				S4:begin
					page_num <= asci_4;
					case(cnt_message)
						5'd0:begin
							aim_num			<= {asci_a,asci_0};
							message_need	<= {asci_sem,aim_angle_z,asci_sem};
							aim_type 		<= {asci_t,asci_x,asci_t};
						end
						5'd1:begin
							aim_num			<= {asci_a,asci_1};
							message_need	<= {asci_sem,aim_angle_x,asci_sem};
							aim_type 		<= {asci_t,asci_x,asci_t};
						end
						5'd2:begin
							aim_num			<= {asci_a,asci_2};
							message_need	<= {asci_sem,now_angle_z,asci_sem};
							aim_type 		<= {asci_t,asci_x,asci_t};
						end
						5'd3:begin
							aim_num			<= {asci_a,asci_3};
							message_need	<= {asci_sem,now_angle_x,asci_sem};
							aim_type 		<= {asci_t,asci_x,asci_t};
						end
						5'd4:begin
							aim_num			<= {asci_c,asci_0};
							message_need	<= {asci_0,asci_0,fire_show};//颜色
							aim_type 		<= {asci_b,asci_c,asci_o};
						end
						5'd5:begin
							aim_num			<= {asci_a,asci_4};
							message_need	<= {asci_sem,chaoshengbo,asci_sem};//颜色
							aim_type 		<= {asci_t,asci_x,asci_t};
						end
					default:begin
							aim_num			<= 16'b0;
							message_need	<= 64'b0;
							aim_type 		<= 24'b0;
					end
					endcase
				end
				S5:begin
					page_num <= asci_5;
					case(cnt_message)
						5'd0:begin
							aim_num			<= {asci_a,asci_0};
							message_need	<= {asci_sem,now_angle_z,asci_sem};
							aim_type 		<= {asci_t,asci_x,asci_t};
						end              
						5'd1:begin       
							aim_num			<= {asci_a,asci_1};
							message_need	<= {asci_sem,now_angle_x,asci_sem};
							aim_type 		<= {asci_t,asci_x,asci_t};
						end
						5'd2:begin
							aim_num			<= {asci_c,asci_0};
							message_need	<= {asci_0,asci_0,fire_show};//颜色
							aim_type 		<= {asci_b,asci_c,asci_o};
						end
						5'd3:begin
							aim_num			<= {asci_a,asci_2};
							message_need	<= {asci_sem,chaoshengbo,asci_sem};//颜色
							aim_type 		<= {asci_t,asci_x,asci_t};
						end
					default:begin        
							aim_num			<= 16'b0;
							message_need	<= 64'b0;
							aim_type 		<= 24'b0;
						end              
					endcase              
				end                      
				S6:begin
					page_num <= asci_6;
					case(cnt_message)    
						5'd0:begin       
							aim_num			<= {asci_a,asci_0};
							message_need	<= {asci_sem,now_angle_z,asci_sem};
							aim_type 		<= {asci_t,asci_x,asci_t};
						end              
						5'd1:begin       
							aim_num			<= {asci_a,asci_1};
							message_need	<= {asci_sem,now_angle_x,asci_sem};
							aim_type 		<= {asci_t,asci_x,asci_t};
						end              
						5'd2:begin       
							aim_num			<= {asci_c,asci_0};
							message_need	<= {asci_0,asci_0,up_show};//颜色
							aim_type 		<= {asci_b,asci_c,asci_o};
						end              
						5'd3:begin       
							aim_num			<= {asci_c,asci_1};
							message_need	<= {asci_0,asci_0,left_show};//颜色
							aim_type 		<= {asci_b,asci_c,asci_o};
						end              
						5'd4:begin       
							aim_num			<= {asci_c,asci_2};
							message_need	<= {asci_0,asci_0,dowm_show};//颜色
							aim_type 		<= {asci_b,asci_c,asci_o};
						end              
						5'd5:begin       
							aim_num			<= {asci_c,asci_3};
							message_need	<= {asci_0,asci_0,right_show};//颜色
							aim_type 		<= {asci_b,asci_c,asci_o};
						end              
						5'd6:begin       
							aim_num			<= {asci_c,asci_4};
							message_need	<= {asci_0,asci_0,fire_show};//颜色
							aim_type 		<= {asci_b,asci_c,asci_o};
						end    
						5'd7:begin
							aim_num			<= {asci_a,asci_2};
							message_need	<= {asci_sem,chaoshengbo,asci_sem};//颜色
							aim_type 		<= {asci_t,asci_x,asci_t};
						end          
					default:begin        
							aim_num			<= 16'b0;
							message_need	<= 64'b0;
							aim_type 		<= 24'b0;
						end              
					endcase              
				end                      
				S7:begin   
					page_num <= asci_7;
					case(cnt_message)    
						5'd0:begin       
							aim_num			<= {asci_a,asci_0};
							message_need	<= {asci_sem,body_temp,asci_sem};
							aim_type 		<= {asci_t,asci_x,asci_t};
						end              
						5'd1:begin       
							aim_num			<= {asci_a,asci_1};
							message_need	<= {asci_sem,anbient_temp,asci_sem};
							aim_type 		<= {asci_t,asci_x,asci_t};
						end              
						5'd2:begin       
							aim_num			<= {asci_a,asci_2};
							message_need	<= {asci_sem,humidity,asci_sem};
							aim_type 		<= {asci_t,asci_x,asci_t};
						end              
						5'd3:begin       
							aim_num			<= {asci_a,asci_3};
							message_need	<= {asci_sem,pressure,asci_sem};
							aim_type 		<= {asci_t,asci_x,asci_t};
						end              
						5'd4:begin       
							aim_num			<= {asci_a,asci_4};
							message_need	<= {asci_sem,altitude,asci_sem};
							aim_type 		<= {asci_t,asci_x,asci_t};
						end              
						5'd5:begin       
							aim_num			<= {asci_a,asci_5};
							message_need	<= {asci_sem,light_intensity,asci_sem};
							aim_type 		<= {asci_t,asci_x,asci_t};
						end              
						5'd6:begin       
							aim_num			<= {asci_b,asci_0};
							message_need	<= {asci_sem,longitude,asci_sem};
							aim_type 		<= {asci_t,asci_x,asci_t};
						end              
						5'd7:begin       
							aim_num			<= {asci_b,asci_1};
							message_need	<= {asci_sem,dimension,asci_sem};
							aim_type 		<= {asci_t,asci_x,asci_t};
						end              
						5'd8:begin       
							aim_num			<= {asci_b,asci_2};
							message_need	<= {asci_sem,comapss,asci_sem};
							aim_type 		<= {asci_t,asci_x,asci_t};
						end              
						5'd9:begin       
							aim_num			<= {asci_b,asci_3};
							message_need	<= {asci_sem,flame,asci_sem};
							aim_type 		<= {asci_t,asci_x,asci_t};
						end              
						5'd10:begin      
							aim_num			<= {asci_b,asci_4};
							message_need	<= {asci_sem,co,asci_sem};
							aim_type 		<= {asci_t,asci_x,asci_t};
						end              
						5'd12:begin      
							aim_num			<= {asci_b,asci_5};
							message_need	<= {asci_sem,combustible_gas,asci_sem};
							aim_type 		<= {asci_t,asci_x,asci_t};
						end              
					default:begin        
							aim_num			<= 16'b0;
							message_need	<= 64'b0;
							aim_type 		<= 24'b0;
						end
					endcase
				end
				default:begin
					aim_num			<= 16'b0;
					message_need	<= 64'b0;
					aim_type 		<= 24'b0;
				end
			endcase
		end
	end
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)begin
			data_tx <= 8'b0;
		end
		else begin
			case(state)
				IDEL:begin
					data_tx <= 8'b0;
				end
				S3:begin
					data_tx <= 8'b0;
				end
				default:begin
					case(num_message)
						8'd0:data_tx  <= asci_p;
						8'd1:data_tx  <= asci_a;
						8'd2:data_tx  <= asci_g;
						8'd3:data_tx  <= asci_e;
						8'd4:data_tx  <= page_num;//
						8'd5:data_tx  <= asci_spot;
						8'd6:data_tx  <= aim_num[15:8];//目标编号
						8'd7:data_tx  <= aim_num[7:0];
						8'd8:data_tx  <= asci_spot;
						8'd9:data_tx  <= aim_type[23:16];//更改的属性
						8'd10:data_tx <= aim_type[15:8];
						8'd11:data_tx <= aim_type[7:0];
						8'd12:data_tx <= asci_equal;
						8'd13:data_tx <= message_need[63:56];
						8'd14:data_tx <= message_need[55:48];
						8'd15:data_tx <= message_need[47:40];
						8'd16:data_tx <= message_need[39:32];
						8'd17:data_tx <= message_need[31:24];
						8'd18:data_tx <= message_need[23:16];
						8'd19:data_tx <= message_need[15:8];
						8'd20:data_tx <= message_need[7:0];
						8'd21:data_tx <= 8'b1111_1111;
						8'd22:data_tx <= 8'b1111_1111;
						8'd23:data_tx <= 8'b1111_1111;
						default:data_tx <= 8'b0;
					endcase
				end
			endcase
		end
	end
	
//---------------------------------------------------------------------------手动选择，炮筒方向-------------------------------------------------------------
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)
			angle_ulr <= 3'b010;
		else if(rx_vld)begin
			case(data_rx)
				8'b0101_0101:angle_ulr <= 3'b010;//收U u
				8'b0100_1100:angle_ulr <= 3'b100;//收L l
				8'b0101_0010:angle_ulr <= 3'b001;//收R r
				default:angle_ulr <= 3'b000;
			endcase
		end
		else begin
			angle_ulr <= 3'b000;
		end
	end
	
endmodule
