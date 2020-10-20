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
   
   
   task body Measure is
   begin
      loop
         loop
            Front.Value := HCSR04.Distance(Front.TrigPin, Front.EchoPin);
            exit when Front.Value /= -1.0;
         end loop;
         loop
            Back.Value := HCSR04.Distance(Back.TrigPin, Back.EchoPin);
            exit when Back.Value /= -1.0;
         end loop;
         loop
            Dispenser.Value := HCSR04.Distance(Dispenser.TrigPin, Dispenser.EchoPin);
            exit when Dispenser.Value /= -1.0;
         end loop;
      end loop;
   end Measure;

end Distance_Sensor_Controller;
