with HCSR04;

package body DistanceSensorsController is

   procedure Measure is
   begin
      front.value := HCSR04.Distance(front.outPin, front.inPin);
      back.value := HCSR04.Distance(back.outPin, back.inPin);
      dispenser.value := HCSR04.Distance(dispenser.outPin, dispenser.inPin);
   end Measure;
   

end DistanceSensorsController;
