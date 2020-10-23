with Arduino_Nano_33_Ble_Sense.IOs;

package HCSR04 is
   function Distance(TrigPin, EchoPin : Arduino_Nano_33_Ble_Sense.IOs.Pin_Id) return Float;
end HCSR04;
