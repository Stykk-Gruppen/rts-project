with Arduino_Nano_33_Ble_Sense.IOs;
with Ada.Real_Time; use Ada.Real_Time;

procedure Main is
   TimeNow : Ada.Real_Time.Time := Ada.Real_Time.Clock;
begin
   loop
      --6 13 41 16 24
      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(27, True);

      TimeNow := Ada.Real_Time.Clock;
      delay until TimeNow + Ada.Real_Time.Milliseconds(200);

      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(27, False);
      TimeNow := Ada.Real_Time.Clock;
      delay until TimeNow + Ada.Real_Time.Milliseconds(200);


   end loop;
end Main;
