with Arduino_Nano_33_Ble_Sense.IOs;
with Ada.Real_Time; use Ada.Real_Time;

package Servo is
   package Arduino renames Arduino_Nano_33_Ble_Sense;

   subtype AngleRange is Integer range -180 .. 180;
   subtype RpmRange is Integer range -240 .. 240;

   procedure SetAngle(angle : AngleRange; PinId : Arduino.IOs.Pin_Id);
   procedure SetRpm(rpm : RpmRange; pinId : Arduino.IOs.Pin_Id);




private

   period : constant Integer := 20000;
   subtype PulseRange is Natural range 1000 .. 2000;

   --Guessing these values, will probably have to be changed several times.






   procedure Write(highTime : Integer; pinId : Arduino.IOs.Pin_Id);
   function mapVal(input : Integer; inputMin : Integer; inputMax : Integer; outputMin : Integer; outputMax : Integer) return Integer;
end Servo;
