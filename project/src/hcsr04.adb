with Ada.Real_Time; use Ada.Real_Time;

package body HCSR04 is

   procedure Init(outPin, inPin : Arduino.IOs.Pin_Id) is
      Test : Integer;
   begin
      -- Må kanskje gjøre noe her..
      Test := 1;
      
   end Init;

   function Distance(outPin, inPin : Arduino.IOs.Pin_Id) return Float is
      TimeNow : Ada.Real_Time.Time;
      Result : Duration;
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
      
      -- Av en teit grunn så ser det ut som at Set funksjonen er analog read og analog write??
      
      Pulse := Arduino_Nano_33_Ble_Sense.IOs.DigitalRead(inPin);
      
      while Pulse = Arduino_Nano_33_Ble_Sense.IOs.DigitalRead(inPin) loop
         --Wait for the analog signal to change from low - high or high - low
         -- Får ikke lov å kompilere hvis while loopen er tom..
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
         
         
         Result := Ada.Real_Time.To_Duration(Ada.Real_Time.Clock - TimeNow);
         
         return (Float(Result) / 58.0) * 1000000.0;

         -- https://github.com/gamegine/HCSR04-ultrasonic-sensor-lib/blob/master/src/HCSR04.cpp
         
      end if;
      
      return -1.0;
      
      --Something went wrong if we end up here!
   end Distance;

end HCSR04;

