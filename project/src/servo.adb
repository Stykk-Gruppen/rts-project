with Ada.Real_Time; use Ada.Real_Time;

package body Servo is
   
   -----------
   -- Write --
   -----------

   procedure Write(High_Time : Integer; Pin_Id : Arduino.IOs.Pin_Id) is
      TimeNow : Time;
   begin
      TimeNow := Ada.Real_Time.Clock;
      Arduino.IOs.DigitalWrite (Pin_Id, True);
      delay until TimeNow + Ada.Real_Time.Microseconds(High_Time);--High_Time);
      
      TimeNow := Ada.Real_Time.Clock;
      Arduino.IOs.DigitalWrite (Pin_Id, False);
      delay until TimeNow + Ada.Real_Time.Microseconds(20000 - High_Time);
   end Write;

end Servo;

