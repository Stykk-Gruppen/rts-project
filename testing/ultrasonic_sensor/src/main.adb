with Arduino_Nano_33_Ble_Sense.IOs;
with HCSR04;

procedure Main is
   TestingSensorIn : constant Arduino_Nano_33_Ble_Sense.IOs.Pin_Id := 5;
   TestingSensorOut : constant Arduino_Nano_33_Ble_Sense.IOs.Pin_Id := 4;
   DistanceValue : Float;
begin

   loop
      DistanceValue := HCSR04.Distance(TestingSensorOut, TestingSensorIn);

   end loop;

end Main;
