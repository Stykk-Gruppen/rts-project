with HCSR04;

package body DistanceSensorsController is

   
   
   
   procedure Measure is
   begin
      loop
         front.value := HCSR04.Distance(front.outPin, front.inPin);
         exit when front.value /= -1.0;
      end loop;
      loop
         back.value := HCSR04.Distance(back.outPin, back.inPin);
         exit when back.value /= -1.0;
      end loop;
      loop
         dispenser.value := HCSR04.Distance(dispenser.outPin, dispenser.inPin);
         exit when dispenser.value /= -1.0;
      end loop;
   end Measure;
   

end DistanceSensorsController;
