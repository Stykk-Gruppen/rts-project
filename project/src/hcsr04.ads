with Arduino_Nano_33_Ble_Sense.IOs;
with Arduino_Nano_33_Ble_Sense.Time;
with HAL;

package HCSR04 is
   package Arduino renames Arduino_Nano_33_Ble_Sense;

   outPin : Arduino.IOs.Pin_Id;
   inPin : Arduino.IOs.Pin_Id;
   
   procedure Init(outPinId, inPinId : Arduino.IOs.Pin_Id);
   function Distance return Float;

end HCSR04;
