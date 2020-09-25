with Ada.Real_Time; use Ada.Real_Time;

package body HCSR04 is

   procedure Init(outPinId, inPinId : Arduino.IOs.Pin_Id) is
   begin
      HCSR04.outPin := outPinId;
      HCSR04.inPin := inPinId;
      
   end Init;

   function Distance return Float is
      TimeNow : Ada.Real_Time.Time;
      Result : Float;
      Pulse : Boolean;
   begin
      TimeNow := Ada.Real_Time.Clock;
      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(outPin, False);
      delay until TimeNow + Ada.Real_Time.Microseconds(2);
      
      TimeNow := Ada.Real_Time.Clock;
      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(outPin, True);
      delay until TimeNow + Ada.Real_Time.Microseconds(10);
      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(outPin, False);
      
      --There must be no interrupts between these parts.
      
      -- Av en teit grunn s� ser det ut som at Set funksjonen er analog read og analog write??
      
      Pulse := Arduino_Nano_33_Ble_Sense.IOs.DigitalRead(inPin);
      
      while Pulse = Arduino_Nano_33_Ble_Sense.IOs.DigitalRead(inPin) loop
         --Wait for the analog signal to change from low - high or high - low
         -- F�r ikke lov � kompilere hvis while loopen er tom..
         Result := -1.0;
      end loop;
      
      while Arduino_Nano_33_Ble_Sense.IOs.DigitalRead(inPin) = False loop
         --Wait for the signal to go from low to high
         Result := -1.0;
      end loop;
      
      if Arduino_Nano_33_Ble_Sense.IOs.DigitalRead(inPin) = True then
         TimeNow := Ada.Real_Time.Clock;
         
         while not Arduino_Nano_33_Ble_Sense.IOs.DigitalRead(inPin) = False loop
            -- Wait for the signal to change to LOW
            Result := -1.0;
         end loop;
         
         --return Float(Ada.Real_Time.Clock - TimeNow) / 58.0;
         -- https://github.com/gamegine/HCSR04-ultrasonic-sensor-lib/blob/master/src/HCSR04.cpp
         
      end if;
      
      return Result;
      
      --Something went wrong if we end up here!
   end Distance;

end HCSR04;