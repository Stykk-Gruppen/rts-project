--Av en eller annen grunn må man skrive USE HAL, selv om alle referanser til namespace HAL har prefixet i seg. Merkelig!
with HAL; use HAL;
with Ada.Real_Time; use Ada.Real_Time;

package body Servo is
      
   
   
   procedure SetAngle(angle : AngleRange; PinId : Arduino.IOs.Pin_Id) is
      highTime : HAL.UInt64;
   begin
      highTime := HAL.UInt64(mapVal(angle, AngleRange'First, AngleRange'Last, PulseRange'First, PulseRange'Last)); 
      write(highTime, pinId);
   end SetAngle;
      
   procedure SetRpm(rpm : RpmRange; pinId : Arduino.IOs.Pin_Id) is
      highTime : HAL.UInt64;
   begin
      highTime := (HAL.UInt64(mapVal(rpm, RpmRange'First, RpmRange'Last, PulseRange'First, PulseRange'Last)));
      write(highTime, pinId);
   end SetRpm;

     
   function MapVal(input : Integer; inputMin : Integer; inputMax : Integer; outputMin : Integer; outputMax : Integer) return Integer is
   begin
      return outputMin + (input - inputMin) * (outputMax - outputMin) / (inputMax - inputMin);
   end MapVal;
   
   procedure Write(highTime : HAL.UInt64; pinId : Arduino.IOs.Pin_Id) is
      --Har satt inn det krøkkete greiene her, siden det virket som delay ikke ville fungere med mikrosekunder.
      TimeNow : Time;
   begin
      TimeNow := Ada.Real_Time.Clock;
      Arduino.IOs.Set (pinId, True);
      delay until TimeNow + Ada.Real_Time.Microseconds(Integer(highTime));
      
      TimeNow := Ada.Real_Time.Clock;
      Arduino.IOs.Set (pinId, false);
      delay until TimeNow + Ada.Real_Time.Microseconds(Integer(period - highTime));
   end Write;
   
   
end Servo;

