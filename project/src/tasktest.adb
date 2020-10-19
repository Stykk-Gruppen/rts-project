package body tasktest is
   package Arduino renames Arduino_Nano_33_Ble_Sense;


   
   task body EngineServo is
      --PinId : constant Arduino.IOs.Pin_Id := 3;
      TimeNow2 : Ada.Real_Time.Time := Ada.Real_Time.Clock;
   begin
      loop
         Arduino.IOs.DigitalWrite (Arduino_Nano_33_Ble_Sense.IOs.Pin_Id(3), True);
         TimeNow2 := Ada.Real_Time.Clock;
         delay until TimeNow2 + Ada.Real_Time.Microseconds(highTime);
         
         Arduino.IOs.DigitalWrite (Arduino_Nano_33_Ble_Sense.IOs.Pin_Id(3), False);
         
         TimeNow2 := Ada.Real_Time.Clock;
         delay until TimeNow2 + Ada.Real_Time.Microseconds(20000 - highTime);
      end loop;
   end EngineServo;
   
   
   task body Sensor is
      TimeNow : Ada.Real_Time.Time := Ada.Real_Time.Clock;
      TestingSensorIn : constant Arduino_Nano_33_Ble_Sense.IOs.Pin_Id := 5;
      TestingSensorOut : constant Arduino_Nano_33_Ble_Sense.IOs.Pin_Id := 4;
      DistanceValue : Float;
   begin
      loop
      DistanceValue := HCSR04.Distance(TestingSensorOut, TestingSensorIn);
      if DistanceValue < 20.0 then
         tasktest.highTime := 2000;
         Arduino.IOs.DigitalWrite (13, True);
      else
         tasktest.highTime := 1000;
         Arduino.IOs.DigitalWrite (13, False);
      end if;
      --TimeNow := Ada.Real_Time.Clock;
      --delay until TimeNow + Ada.Real_Time.Microseconds(30000);
      end loop;
   end Sensor;
   
   
   
   
   

   

end tasktest;
