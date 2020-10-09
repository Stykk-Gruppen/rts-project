with Arduino_Nano_33_Ble_Sense.IOs;
with HCSR04;

procedure Main is
   TestingSensorIn : Arduino_Nano_33_Ble_Sense.IOs.Pin_Id := 3;
   TestingSensorOut : Arduino_Nano_33_Ble_Sense.IOs.Pin_Id := 4;
   DistanceValue : Float;
begin

   loop
      --Trenger kanskje ikke init.
      --HCSR04.Init(TestingSensorOut, TestingSensorIn);

      DistanceValue := HCSR04.Distance(TestingSensorOut, TestingSensorIn);

      --Ada.Text_IO.Put_Line(DistanceValue'Image);
   end loop;

end Main;
