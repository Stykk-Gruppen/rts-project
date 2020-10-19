with Arduino_Nano_33_Ble_Sense.IOs;

package HCSR04 is
   package Arduino renames Arduino_Nano_33_Ble_Sense;
   
   function Distance(outPin, inPin : Arduino.IOs.Pin_Id) return Float;
end HCSR04;
