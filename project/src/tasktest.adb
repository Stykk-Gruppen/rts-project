package body tasktest is
   package Arduino renames Arduino_Nano_33_Ble_Sense;


   
   task body EngineServo is
      
      
      --PinId : constant Arduino.IOs.Pin_Id := 3;
      TimeNow2 : Ada.Real_Time.Time := Ada.Real_Time.Clock;

   begin
      loop
         Arduino.IOs.DigitalWrite (3, True);
         TimeNow2 := Ada.Real_Time.Clock;
         delay until TimeNow2 + Ada.Real_Time.Microseconds(2000);
         
         Arduino.IOs.DigitalWrite (3, False);
         
         TimeNow2 := Ada.Real_Time.Clock;
         delay until TimeNow2 + Ada.Real_Time.Microseconds(18000);
      end loop;
   end EngineServo;

end tasktest;
