with Arduino_Nano_33_Ble_Sense.IOs;
with Ada.Real_Time; use Ada.Real_Time;

procedure Main is
   TimeNow : Ada.Real_Time.Time := Ada.Real_Time.Clock;
   InnerLoopDuration : Ada.Real_Time.Time := Ada.Real_Time.Clock;
   Pin_Id : Arduino_Nano_33_Ble_Sense.IOs.Pin_Id := 34;
   High_Time : Integer := 2000;
begin
   loop
      if InnerLoopDuration + Ada.Real_Time.Milliseconds(2000) < Ada.Real_Time.Clock then
         --High_Time swaps between 1000 1500 2000
         High_Time := ((High_Time + 500) mod 1000) + 1000;
         InnerLoopDuration := Ada.Real_Time.Clock;
      end if;
      TimeNow := Ada.Real_Time.Clock;
      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (Pin_Id, True);
      delay until TimeNow + Ada.Real_Time.Microseconds(High_Time);

      TimeNow := Ada.Real_Time.Clock;
      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (Pin_Id, false);
      delay until TimeNow + Ada.Real_Time.Microseconds(20000 - High_Time);
      null;
   end loop;
end Main;
