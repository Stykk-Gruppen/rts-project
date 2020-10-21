with HCSR04;

package body Distance_Sensor_Controller is

   procedure Measure2 is
   begin
      loop
         Front.Value := HCSR04.Distance(Front.TrigPin, Front.EchoPin);
         exit when Front.Value /= -1.0;
      end loop;
      loop
         Back.Value := HCSR04.Distance(back.TrigPin, back.EchoPin);
         exit when Back.Value /= -1.0;
      end loop;
      loop
         Dispenser.Value := HCSR04.Distance(dispenser.TrigPin, dispenser.EchoPin);
         exit when Dispenser.Value /= -1.0;
      end loop;
   end Measure2;

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
         loop
            Temp := HCSR04.Distance(Dispenser.TrigPin, Dispenser.EchoPin);
            exit when Temp /= -1.0;
         end loop;
         Dispenser.Value := Temp;
      end loop;
   end Measure;

end Distance_Sensor_Controller;
