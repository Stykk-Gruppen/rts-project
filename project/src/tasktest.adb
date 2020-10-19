with Ada.Real_Time; use Ada.Real_Time;
with Arduino_Nano_33_Ble_Sense.IOs;
with Arduino_Nano_33_Ble_Sense;
with Ada;
with DistanceSensorsController;


package body tasktest is
   package Arduino renames Arduino_Nano_33_Ble_Sense;


   
   task body EngineServo is
      --PinId : constant Arduino.IOs.Pin_Id := 3;
      TimeNow2 : Ada.Real_Time.Time := Ada.Real_Time.Clock;
   begin
      loop
         if DistanceSensorsController.front.value < 20.0 then 
            highTime := 2000;
         else
            highTime := 1000;
         end if;
         
         Arduino.IOs.DigitalWrite (Arduino_Nano_33_Ble_Sense.IOs.Pin_Id(3), True);
         TimeNow2 := Ada.Real_Time.Clock;
         delay until TimeNow2 + Ada.Real_Time.Microseconds(highTime);
         
         Arduino.IOs.DigitalWrite (Arduino_Nano_33_Ble_Sense.IOs.Pin_Id(3), False);
         
         TimeNow2 := Ada.Real_Time.Clock;
         delay until TimeNow2 + Ada.Real_Time.Microseconds(20000 - highTime);
      end loop;
   end EngineServo;
   
   task body SteeringServo is
      --PinId : constant Arduino.IOs.Pin_Id := 3;
      TimeNow2 : Ada.Real_Time.Time := Ada.Real_Time.Clock;
   begin
      loop
         if DistanceSensorsController.back.value < 20.0 then 
            highTime := 1000;
         else
            highTime := 2000;
         end if;
         
         Arduino.IOs.DigitalWrite (Arduino_Nano_33_Ble_Sense.IOs.Pin_Id(21), True);
         TimeNow2 := Ada.Real_Time.Clock;
         delay until TimeNow2 + Ada.Real_Time.Microseconds(highTime);
         
         Arduino.IOs.DigitalWrite (Arduino_Nano_33_Ble_Sense.IOs.Pin_Id(21), False);
         
         TimeNow2 := Ada.Real_Time.Clock;
         delay until TimeNow2 + Ada.Real_Time.Microseconds(20000 - highTime);
      end loop;
   end SteeringServo;
   
   
   task body DispenserServo is
      --PinId : constant Arduino.IOs.Pin_Id := 3;
      TimeNow2 : Ada.Real_Time.Time := Ada.Real_Time.Clock;
   begin
      loop
         if DistanceSensorsController.dispenser.value < 20.0 then 
            highTime := 1000;
         else
            highTime := 2000;
         end if;
         
         Arduino.IOs.DigitalWrite (Arduino_Nano_33_Ble_Sense.IOs.Pin_Id(23), True);
         TimeNow2 := Ada.Real_Time.Clock;
         delay until TimeNow2 + Ada.Real_Time.Microseconds(highTime);
         
         Arduino.IOs.DigitalWrite (Arduino_Nano_33_Ble_Sense.IOs.Pin_Id(23), False);
         
         TimeNow2 := Ada.Real_Time.Clock;
         delay until TimeNow2 + Ada.Real_Time.Microseconds(20000 - highTime);
      end loop;
   end DispenserServo;
   
   
   task body Sensor is
      TimeNow : Ada.Real_Time.Time;
   begin
      loop
         
         DistanceSensorsController.Measure;
         --TimeNow := Ada.Real_Time.Clock;
         --delay until TimeNow + Ada.Real_Time.Microseconds(10000);
         
      end loop;
   end Sensor;
   
   
   
   
   

   

end tasktest;
