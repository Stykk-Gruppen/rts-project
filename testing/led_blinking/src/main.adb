with Arduino_Nano_33_Ble_Sense.IOs;
with Arduino_Nano_33_Ble_Sense.IOs2;
with Ada.Real_Time; use Ada.Real_Time;

procedure Main is
   TimeNow : Ada.Real_Time.Time := Ada.Real_Time.Clock;
begin
   loop
      --for I in 0 .. 31 loop
         --Arduino_Nano_33_Ble_Sense.IOs2.DigitalWrite(Arduino_Nano_33_Ble_Sense.IOs2.Pin_Id(I), True);
         Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(Arduino_Nano_33_Ble_Sense.IOs.Pin_Id(4), True);
      --end loop;

      TimeNow := Ada.Real_Time.Clock;
      delay until TimeNow + Ada.Real_Time.Milliseconds(2);

      --for I in 0 .. 31 loop
         --Arduino_Nano_33_Ble_Sense.IOs2.DigitalWrite(Arduino_Nano_33_Ble_Sense.IOs2.Pin_Id(I), False);
         Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(Arduino_Nano_33_Ble_Sense.IOs.Pin_Id(4), False);
      --end loop;

      TimeNow := Ada.Real_Time.Clock;
      delay until TimeNow + Ada.Real_Time.Milliseconds(10);
   end loop;
end Main;
