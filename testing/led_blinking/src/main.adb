with Arduino_Nano_33_Ble_Sense.IOs;
with Ada.Real_Time; use Ada.Real_Time;

procedure Main is
   TimeNow : Ada.Real_Time.Time := Ada.Real_Time.Clock;
begin
   loop
      --6 13 41 16 24
      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(13, True);

      TimeNow := Ada.Real_Time.Clock;
      delay until TimeNow + Ada.Real_Time.Milliseconds(50);

      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(41, True);

      TimeNow := Ada.Real_Time.Clock;
      delay until TimeNow + Ada.Real_Time.Milliseconds(50);

      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(6, False);

      TimeNow := Ada.Real_Time.Clock;
      delay until TimeNow + Ada.Real_Time.Milliseconds(50);

      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(13, False);

      TimeNow := Ada.Real_Time.Clock;
      delay until TimeNow + Ada.Real_Time.Milliseconds(50);

      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(41, False);

      TimeNow := Ada.Real_Time.Clock;
      delay until TimeNow + Ada.Real_Time.Milliseconds(50);

      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(6, True);

      TimeNow := Ada.Real_Time.Clock;
      delay until TimeNow + Ada.Real_Time.Milliseconds(50);

      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(13, True);

      TimeNow := Ada.Real_Time.Clock;
      delay until TimeNow + Ada.Real_Time.Milliseconds(50);

      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(41, True);

      TimeNow := Ada.Real_Time.Clock;
      delay until TimeNow + Ada.Real_Time.Milliseconds(50);

      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(16, False);

      TimeNow := Ada.Real_Time.Clock;
      delay until TimeNow + Ada.Real_Time.Milliseconds(50);

      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(13, False);

      TimeNow := Ada.Real_Time.Clock;
      delay until TimeNow + Ada.Real_Time.Milliseconds(50);

      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(41, False);

      TimeNow := Ada.Real_Time.Clock;
      delay until TimeNow + Ada.Real_Time.Milliseconds(50);

      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(16, True);

      TimeNow := Ada.Real_Time.Clock;
      delay until TimeNow + Ada.Real_Time.Milliseconds(50);

      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(13, True);

      TimeNow := Ada.Real_Time.Clock;
      delay until TimeNow + Ada.Real_Time.Milliseconds(50);

      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(41, True);

      TimeNow := Ada.Real_Time.Clock;
      delay until TimeNow + Ada.Real_Time.Milliseconds(50);

      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(24, False);

      TimeNow := Ada.Real_Time.Clock;
      delay until TimeNow + Ada.Real_Time.Milliseconds(50);

      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(13, False);

      TimeNow := Ada.Real_Time.Clock;
      delay until TimeNow + Ada.Real_Time.Milliseconds(50);

      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(41, False);

      TimeNow := Ada.Real_Time.Clock;
      delay until TimeNow + Ada.Real_Time.Milliseconds(50);

      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(24, True);

      TimeNow := Ada.Real_Time.Clock;
      delay until TimeNow + Ada.Real_Time.Milliseconds(50);


   end loop;
end Main;
