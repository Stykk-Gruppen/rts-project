with Arduino_Nano_33_Ble_Sense.IOs;
--with VehicleController;
--with HCSR04;
with Ada.Real_Time; use Ada.Real_Time;

package tasktest is
   highTime : Integer := 1000 with Atomic;
   Task EngineServo;

end tasktest;