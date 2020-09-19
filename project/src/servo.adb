--Av en eller annen grunn må man skrive USE HAL, selv om alle referanser til namespace HAL har prefixet i seg. Merkelig!
with HAL; use HAL;
with Ada.Real_Time; use Ada.Real_Time;

package body Servo is
      
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
   
   task body SteeringServo is
      pinId : constant Arduino.IOs.Pin_Id := 5;
      highTime : HAL.UInt64;
   begin
      loop
         highTime := HAL.UInt64(mapVal(WheelAngle, AngleRange'First, AngleRange'Last, PulseRange'First, PulseRange'Last)); 
         write(highTime, pinId);
      end loop;
   end SteeringServo;
   
   
   task body EngineServo is
      PinId : constant Arduino.IOs.Pin_Id := 8;
      highTime : Arduino.Time.Time_Ms;
   begin
      loop
         highTime := (HAL.UInt64(mapVal(EngineRpm, RpmRange'First, RpmRange'Last, PulseRange'First, PulseRange'Last)));
         write(highTime, pinId);
      end loop;
   end EngineServo;
end Servo;

