with Arduino_Nano_33_Ble_Sense.IOs;
with Ada.Real_Time; use Ada.Real_Time;

procedure Main is
   TimeNow : Ada.Real_Time.Time := Ada.Real_Time.Clock;
begin
   loop
      for I in 0 .. 47 loop
         Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(Arduino_Nano_33_Ble_Sense.IOs.Pin_Id(I), True);
      end loop;

      TimeNow := Ada.Real_Time.Clock;
      delay until TimeNow + Ada.Real_Time.Milliseconds(500);

      for I in 0 .. 47 loop
         Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(Arduino_Nano_33_Ble_Sense.IOs.Pin_Id(I), False);
      end loop;

      TimeNow := Ada.Real_Time.Clock;
      delay until TimeNow + Ada.Real_Time.Milliseconds(500);
   end loop;
end Main;
