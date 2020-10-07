with Arduino_Nano_33_Ble_Sense.LEDs;
with Arduino_Nano_33_Ble_Sense.IOs;
with Ada.Real_Time; use Ada.Real_Time;

procedure Main is
   TimeNow : Ada.Real_Time.Time := Ada.Real_Time.Clock;
begin
   Arduino_Nano_33_Ble_Sense.LEDs.Initialize_LED;
   loop
      for I in 1 .. 31 loop
         -- Turns on every pin and the builtin led
         Arduino_Nano_33_Ble_Sense.LEDs.Turn_On(Arduino_Nano_33_Ble_Sense.LEDs.LED);
         Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(Arduino_Nano_33_Ble_Sense.IOs.Pin_Id(I), True);
      end loop;

      TimeNow := Ada.Real_Time.Clock;
      delay until TimeNow + Ada.Real_Time.Milliseconds(500);

      for I in 1 .. 31 loop
         -- Turns off every pin and the builtin led
         Arduino_Nano_33_Ble_Sense.LEDs.Turn_Off(Arduino_Nano_33_Ble_Sense.LEDs.LED);
         Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(Arduino_Nano_33_Ble_Sense.IOs.Pin_Id(I), False);
      end loop;

      TimeNow := Ada.Real_Time.Clock;
      delay until TimeNow + Ada.Real_Time.Milliseconds(500);
   end loop;
end Main;
