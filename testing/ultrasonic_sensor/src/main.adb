with Arduino_Nano_33_Ble_Sense.IOs;
with HCSR04;
--with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
   TestingSensorIn : Arduino_Nano_33_Ble_Sense.IOs.Pin_Id := 5;
   TestingSensorOut : Arduino_Nano_33_Ble_Sense.IOs.Pin_Id := 4;
   DistanceValue : Float;
begin

   loop
      --Trenger kanskje ikke init.
      --HCSR04.Init(TestingSensorOut, TestingSensorIn);

      DistanceValue := HCSR04.Distance(TestingSensorOut, TestingSensorIn);
      null;
      --Ada.Text_IO.Put_Line(DistanceValue'Image);
   end loop;

end Main;
