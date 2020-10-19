with Ada.Real_Time; use Ada.Real_Time;

package body HCSR04 is

   --------------
   -- Distance --
   --------------

   function Distance(outPin, inPin : Arduino_Nano_33_Ble_Sense.IOs.Pin_Id) return Float is
      TimeNow : Ada.Real_Time.Time;
      TimeoutStart : Ada.Real_Time.Time;
      Result : Duration;
      Pulse : Boolean;
   begin
      <<DistStart>>
      TimeNow := Ada.Real_Time.Clock;
      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(outPin, False);
      delay until TimeNow + Ada.Real_Time.Microseconds(2);
      
      TimeNow := Ada.Real_Time.Clock;
      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(outPin, True);
      delay until TimeNow + Ada.Real_Time.Microseconds(10);
      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(outPin, False);

      --There must be no interrupts between these parts.

      Pulse := Arduino_Nano_33_Ble_Sense.IOs.DigitalRead(inPin);
      TimeoutStart := Ada.Real_Time.Clock;
      while Pulse = Arduino_Nano_33_Ble_Sense.IOs.DigitalRead(inPin) loop
         --Wait for the analog signal to change from low - high or high - low
         --exit when Ada.Real_Time.Clock > TimeoutStart + Ada.Real_Time.Microseconds(500000);
         if Ada.Real_Time.Clock > TimeoutStart + Ada.Real_Time.Microseconds(5000) then
            goto DistStart;
         end if;
        null;
      end loop;
      
      TimeoutStart := Ada.Real_Time.Clock;

      while Arduino_Nano_33_Ble_Sense.IOs.DigitalRead(inPin) = False loop
         --Wait for the signal to go from low to high
         if Ada.Real_Time.Clock > TimeoutStart + Ada.Real_Time.Microseconds(5000) then
            goto DistStart;
         end if;

        null;
      end loop;

      if Arduino_Nano_33_Ble_Sense.IOs.DigitalRead(inPin) = True then
         TimeNow := Ada.Real_Time.Clock;

         TimeoutStart := Ada.Real_Time.Clock;

         while not Arduino_Nano_33_Ble_Sense.IOs.DigitalRead(inPin) = False loop
            -- Wait for the signal to change to LOW
            --exit when Ada.Real_Time.Clock > TimeoutStart + Ada.Real_Time.Microseconds(500000);
            if Ada.Real_Time.Clock > TimeoutStart + Ada.Real_Time.Microseconds(5000) then
               goto DistStart;
            end if;

            null;
         end loop;

         Result := Ada.Real_Time.To_Duration(Ada.Real_Time.Clock - TimeNow);

         return (Float(Result) / 58.0) * 1000000.0;

         -- https://github.com/gamegine/HCSR04-ultrasonic-sensor-lib/blob/master/src/HCSR04.cpp

      end if;

      return 0.0;

      --Something went wrong if we end up here!
   end Distance;

end HCSR04;

