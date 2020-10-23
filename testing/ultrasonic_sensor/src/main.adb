with Arduino_Nano_33_Ble_Sense.IOs;
with HCSR04;

procedure Main is
   TestingSensorEcho : constant Arduino_Nano_33_Ble_Sense.IOs.Pin_Id := 44;
   TestingSensorTrig : constant Arduino_Nano_33_Ble_Sense.IOs.Pin_Id := 43;
   TestingSensorEcho1 : constant Arduino_Nano_33_Ble_Sense.IOs.Pin_Id := 45;
   TestingSensorTrig1 : constant Arduino_Nano_33_Ble_Sense.IOs.Pin_Id := 47;
   DistanceValue : Float;
   DistanceValue1 : Float;

begin

   loop
      DistanceValue := HCSR04.Distance(TestingSensorTrig, TestingSensorEcho);
      DistanceValue1 := HCSR04.Distance(TestingSensorTrig1, TestingSensorEcho1);


   end loop;

end Main;
