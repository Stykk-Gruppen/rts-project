with Arduino_Nano_33_Ble_Sense.IOs;
--with VehicleController;
with HCSR04;
with Ada.Real_Time; use Ada.Real_Time;
with tasktest;


procedure Main is
   package Arduino renames Arduino_Nano_33_Ble_Sense;

   frontWheelsPin : constant Arduino.IOs.Pin_Id := 1;
   rearWheelsPin : constant Arduino.IOs.Pin_Id := 2;
   TimeNow : Ada.Real_Time.Time := Ada.Real_Time.Clock;
   TestingSensorIn : Arduino_Nano_33_Ble_Sense.IOs.Pin_Id := 5;
   TestingSensorOut : Arduino_Nano_33_Ble_Sense.IOs.Pin_Id := 4;
   DistanceValue : Float;

begin

   --VehicleController.Init(frontWheelsPin, rearWheelsPin);
   --Arduino.IOs.DigitalWrite (6, True);
   loop
      DistanceValue := HCSR04.Distance(TestingSensorOut, TestingSensorIn);

      if DistanceValue < 20.0 then
         --tasktest.highTime := 2000;
         Arduino.IOs.DigitalWrite (6, False);

      else
         --tasktest.highTime := 1000;
         Arduino.IOs.DigitalWrite (6, True);

      end if;

      TimeNow := Ada.Real_Time.Clock;
      delay until TimeNow + Ada.Real_Time.Microseconds(30000);
   end loop;
end Main;
