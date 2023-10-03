`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.01.2023 09:40:01
// Design Name: 
// Module Name: fsub_single
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


// Code your design here
module bfloat_sub(a1,b1,c);
input logic [15:0]a1,b1;
output logic[15:0]c;
  logic [15:0]a;//=32'b01000010100100000000000000000001;
  logic [15:0]b;//=32'b01000000011100000000000001000000;
  logic[7:0]ea,eb,bias,e;
  logic[6:0]ma,mb,m_f;
  logic[11:0]mb_temp,ma_temp,msub;
  logic[7:0]m1;
  logic g,r,s0,s1,s,s3,p;
  logic[15:0]temp;
  int l;
  
  
always_comb
  begin
  a=a1;
  b=b1;
    if(a[14:7]<b[14:7])
      begin
        temp=a;
        a=b;
        b=temp;
      end
  else if(a[14:7]==b[14:7])
  begin
    if(a[6:0]<b[6:0])
        begin
        temp=a;
        a=b;
        b=temp;
        end
  end
  else
    begin
    a=a;
    b=b;
    end
    
    ea=a[14:7];
    eb=b[14:7];
  
    ma=a[6:0];
    mb=b[6:0];
    
    bias=ea-eb;
    e=ea;
    s3=a[15];
    
    mb_temp[9:3]=mb;
    ma_temp[9:3]=ma;
    mb_temp[10]=1;
    ma_temp[10]=1;
    mb_temp[11]=0;
    ma_temp[11]=0;
    ma_temp[2:0]=0;
    mb_temp[2:0]=0;
    mb_temp=mb_temp>>bias;
  
    if(bias==2'b00)
      mb_temp[11:3]=(~mb_temp[11:3])+1;
    else if(bias==2'b01)
      mb_temp[11:2]=(~mb_temp[11:2])+1;
    else if(bias==2'b10)
      mb_temp[11:1]=(~mb_temp[11:1])+1;
    else if(bias==2'b11)
      mb_temp[11:0]=(~mb_temp[11:0])+1;
    else
      mb_temp=(~mb_temp);
    
    msub=ma_temp+mb_temp;
    
    g=msub[3];
    r=msub[2];
    s0=msub[0];
    s1=msub[1];
    s=s0|s1;
    
   
    p=r&(((~g)&s)|g);
    if(p)
      m1=msub[10:3]+1;
    else
      m1=msub[10:3];
    
    for(l=0;l<9;l=l+1)
    begin
    if(~m1[7])
        begin
        if(m1!=0)
        begin
          m1=m1<<1;
          e=e-1;
          if(m1[7])
          begin
          break;
          end
        end
      else
        m1=m1;
        end
        end
   
    m_f=m1[6:0];
      
      
      
    //$strobe("%b,%b,%b",s3,e,m_f);
   end
   
   assign c[15]=s3;
   assign c[14:7]=e;
   assign c[6:0]=m_f;
   
endmodule
