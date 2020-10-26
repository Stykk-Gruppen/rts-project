with Arduino_Nano_33_Ble_Sense.IOs;

package Servo is
   package Arduino renames Arduino_Nano_33_Ble_Sense;

   subtype Angle_Range is Integer range -90 .. 90;

   procedure Write(High_Time : Integer; Pin_Id : Arduino.IOs.Pin_Id);

private

   Period : constant Integer := 20000;
   subtype Pulse_Range is Natural range 1000 .. 2000;

end Servo;
