with Arduino_Nano_33_Ble_Sense.IOs;

package Servo is
   package Arduino renames Arduino_Nano_33_Ble_Sense;

   subtype Angle_Range is Integer range -90 .. 90;
   subtype Rpm_Range is Integer range -240 .. 240;

   procedure Set_Angle(Angle : Angle_Range; Pin_Id : Arduino.IOs.Pin_Id);
   procedure Set_Rpm(Rpm : Rpm_Range; Pin_Id : Arduino.IOs.Pin_Id);

private

   Period : constant Integer := 20000;
   subtype Pulse_Range is Natural range 1000 .. 2000;

   --Guessing these values, will probably have to be changed several times.

   procedure Write(High_Time : Integer; Pin_Id : Arduino.IOs.Pin_Id);
   function Map_Val(Input : Integer; Input_Min : Integer; Input_Max : Integer; Output_Min : Integer; Output_Max : Integer) return Integer;
end Servo;
