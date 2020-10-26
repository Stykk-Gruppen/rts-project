with HCSR04;
with Ada.Real_Time; use Ada.Real_Time;
package body Distance_Sensor_Controller is

   -------------
   -- Measure --
   -------------

   task body Measure is
      Temp : Float;
      TimeNow : Ada.Real_Time.Time;
   begin
      loop
         TimeNow := Ada.Real_Time.Clock;

         Temp := HCSR04.Distance(Front.TrigPin, Front.EchoPin);
         if Temp /= -1.0 then
            Front.Value := Temp;
         end if;

         Temp := HCSR04.Distance(Back.TrigPin, Back.EchoPin);
         if Temp /= -1.0 then
            Back.Value := Temp;
         end if;

         delay until TimeNow + Ada.Real_Time.Microseconds(16000);
      end loop;
   end Measure;

end Distance_Sensor_Controller;
