with Ada.Real_Time; use Ada.Real_Time;

package body Servo is

   ---------------
   -- Set_Angle --
   ---------------

   procedure Set_Angle(Angle : Angle_Range; Pin_Id : Arduino.IOs.Pin_Id) is
      High_Time : Integer;
   begin
      High_Time := (Map_Val(Angle, Angle_Range'First, Angle_Range'Last, Pulse_Range'First, Pulse_Range'Last)); 
      Write(High_Time, Pin_Id);
   end Set_Angle;

   -------------
   -- Set_Rpm --
   -------------

   procedure Set_Rpm(Rpm : Rpm_Range; Pin_Id : Arduino.IOs.Pin_Id) is
      High_Time : Integer;
   begin
      High_Time := (Map_Val(Rpm, Rpm_Range'First, Rpm_Range'Last, Pulse_Range'First, Pulse_Range'Last));
      Write(High_Time, Pin_Id);
   end Set_Rpm;

   -------------
   -- Map_Val --
   -------------

   function Map_Val(Input : Integer; Input_Min : Integer; Input_Max : Integer; Output_Min : Integer; Output_Max : Integer) return Integer is
   begin
      return Output_Min + (Input - Input_Min) * (Output_Max - Output_Min) / (Input_Max - Input_Min);
   end Map_Val;

   -----------
   -- Write --
   -----------

   procedure Write(High_Time : Integer; Pin_Id : Arduino.IOs.Pin_Id) is
      TimeNow : Time;
   begin
      TimeNow := Ada.Real_Time.Clock;
      Arduino.IOs.DigitalWrite (Pin_Id, True);
      delay until TimeNow + Ada.Real_Time.Microseconds(2000);--High_Time);
      
      TimeNow := Ada.Real_Time.Clock;
      Arduino.IOs.DigitalWrite (Pin_Id, False);
      delay until TimeNow + Ada.Real_Time.Microseconds(20000 - 2000);
   end Write;

end Servo;

