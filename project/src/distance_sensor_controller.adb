with HCSR04;

package body Distance_Sensor_Controller is

   -------------
   -- Measure --
   -------------

   task body Measure is
      Temp : Float;
   begin
      loop
         loop
            Temp := HCSR04.Distance(Front.TrigPin, Front.EchoPin);
            exit when Temp /= -1.0;
         end loop;
         Front.Value := Temp;
         loop
            Temp := HCSR04.Distance(Back.TrigPin, Back.EchoPin);
            exit when Temp /= -1.0;
         end loop;
         Back.Value := Temp;
      end loop;
   end Measure;

end Distance_Sensor_Controller;
