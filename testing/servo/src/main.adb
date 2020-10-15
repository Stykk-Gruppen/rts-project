--with Arduino_Nano_33_Ble_Sense.Servo; use Arduino_Nano_33_Ble_Sense.Servo;
with Arduino_Nano_33_Ble_Sense.IOs;
with Ada.Real_Time; use Ada.Real_Time;

procedure Main is
   TimeNow : Ada.Real_Time.Time := Ada.Real_Time.Clock;
begin

   --Arduino_Nano_33_Ble_Sense.IOs.Set_Analog_Period_Us(20_000);
   Arduino_Nano_33_Ble_Sense.IOs.AnalogWrite(5, 127);

   loop

      --Arduino_Nano_33_Ble_Sense.IOs.AnalogWrite(5, 127);
      null;
   end loop;
end Main;
