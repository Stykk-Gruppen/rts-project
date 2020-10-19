with Ada.Real_Time; use Ada.Real_Time;

package body Servo is

   --------------
   -- SetAngle --
   --------------

   procedure SetAngle(angle : AngleRange; PinId : Arduino.IOs.Pin_Id) is
      highTime : Integer;
   begin
      highTime := (mapVal(angle, AngleRange'First, AngleRange'Last, PulseRange'First, PulseRange'Last)); 
      Write(highTime, pinId);
   end SetAngle;

   ------------
   -- SetRpm --
   ------------

   procedure SetRpm(rpm : RpmRange; pinId : Arduino.IOs.Pin_Id) is
      highTime : Integer;
   begin
      highTime := ((mapVal(rpm, RpmRange'First, RpmRange'Last, PulseRange'First, PulseRange'Last)));
      Write(highTime, pinId);
   end SetRpm;

   ------------
   -- MapVal --
   ------------

   function MapVal(input : Integer; inputMin : Integer; inputMax : Integer; outputMin : Integer; outputMax : Integer) return Integer is
   begin
      return outputMin + (input - inputMin) * (outputMax - outputMin) / (inputMax - inputMin);
   end MapVal;

   -----------
   -- Write --
   -----------

   procedure Write(highTime : Integer; pinId : Arduino.IOs.Pin_Id) is
      --Har satt inn det krøkkete greiene her, siden det virket som delay ikke ville fungere med mikrosekunder.
      TimeNow : Time;
   begin
      TimeNow := Ada.Real_Time.Clock;
      Arduino.IOs.DigitalWrite (pinId, True);
      delay until TimeNow + Ada.Real_Time.Microseconds(highTime);
      
      TimeNow := Ada.Real_Time.Clock;
      Arduino.IOs.DigitalWrite (pinId, false);
      delay until TimeNow + Ada.Real_Time.Microseconds(20000 - highTime);
   end Write;

end Servo;

