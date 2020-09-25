with Arduino_Nano_33_Ble_Sense.IOs;
with Arduino_Nano_33_Ble_Sense.Time;
with HAL;

package DistanceSensorsController is
   package Arduino renames Arduino_Nano_33_Ble_Sense;

   type Distance_Sensor is
      record
         outPin : Arduino.IOs.Pin_Id;
         inPin : Arduino.IOs.Pin_Id;
      end record;
   
   -- Begynner først med bare 3stk, da vi ikke helt vet om den kan kjøre på et bord.
   front : Distance_Sensor :=
     (outPin => 0,
      inPin => 0);
                               
   back : Distance_Sensor :=
     (outPin => 0,
      inPin => 0);
      
   dispenser : Distance_Sensor :=
     (outPin => 0,
      inPin => 0);
   
end DistanceSensorsController;
