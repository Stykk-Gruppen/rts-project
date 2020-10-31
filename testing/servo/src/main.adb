with Arduino_Nano_33_Ble_Sense.IOs;
with Ada.Real_Time; use Ada.Real_Time;

procedure Main is
   Time_Now : Ada.Real_Time.Time := Ada.Real_Time.Clock;
   Rotate_Time : Ada.Real_Time.Time := Ada.Real_Time.Clock;
   Pin_Id_PWM : Arduino_Nano_33_Ble_Sense.IOs.Pin_Id := 30;
   High_Time : Integer := 2_000;
begin
   loop
      if Ada.Real_Time.Clock > Rotate_Time + Ada.Real_Time.Milliseconds(1000) then
         --Changes between 1000 and 2000
         High_Time := ((High_Time + 1) mod 2000) + 1000;
         Rotate_Time := Ada.Real_Time.Clock;
      end if;
      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(Pin_Id_PWM,True);
      Time_Now := Ada.Real_Time.Clock;
      delay until Time_Now + Ada.Real_Time.Microseconds(High_Time);

      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(Pin_Id_PWM,False);
      Time_Now := Ada.Real_Time.Clock;
      delay until Time_Now + Ada.Real_Time.Microseconds(20_000 - High_Time);
   end loop;
end Main;
