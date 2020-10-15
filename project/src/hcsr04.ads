with Arduino_Nano_33_Ble_Sense.IOs;
----
--with Arduino_Nano_33_Ble_Sense.Time;
--with HAL;

package HCSR04 is
   package Arduino renames Arduino_Nano_33_Ble_Sense;
   
   procedure Init(outPin, inPin : Arduino.IOs.Pin_Id);
   function Distance(outPin, inPin : Arduino.IOs.Pin_Id) return Float;

end HCSR04;
