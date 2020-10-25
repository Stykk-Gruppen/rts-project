with Ada.Real_Time; use Ada.Real_Time;

package body HCSR04 is

   --------------
   -- Distance --
   --------------

   function Distance(TrigPin, EchoPin : Arduino_Nano_33_Ble_Sense.IOs.Pin_Id) return Float is
      TimeNow : Ada.Real_Time.Time;
      TimeoutStart : Ada.Real_Time.Time;
      --Maximum distance of sensor is 400cm = 23200uS. We add a 1ms margin on top of that
      DeadlineMicroseconds : constant Integer := 25200;
      Result : Duration;
      Pulse : Boolean;
   begin

      TimeoutStart := Ada.Real_Time.Clock;
      TimeNow := Ada.Real_Time.Clock;
      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(TrigPin, False);
      delay until TimeNow + Ada.Real_Time.Microseconds(2);
      
      TimeNow := Ada.Real_Time.Clock;
      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(TrigPin, True);
      delay until TimeNow + Ada.Real_Time.Microseconds(10);
      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(TrigPin, False);

      --There must be no interrupts between these parts.

      Pulse := Arduino_Nano_33_Ble_Sense.IOs.DigitalRead(EchoPin);
      
      while Pulse = Arduino_Nano_33_Ble_Sense.IOs.DigitalRead(EchoPin) loop
         --Wait for the analog signal to change from low - high or high - low
         if Ada.Real_Time.Clock > TimeoutStart + Ada.Real_Time.Microseconds(DeadlineMicroseconds) then
            return -1.0;
         end if;
      end loop;
      
      TimeoutStart := Ada.Real_Time.Clock;

      while Arduino_Nano_33_Ble_Sense.IOs.DigitalRead(EchoPin) = False loop
         --Wait for the signal to go from low to high
         if Ada.Real_Time.Clock > TimeoutStart + Ada.Real_Time.Microseconds(DeadlineMicroseconds) then
            return -1.0;
         end if;
      end loop;

      if Arduino_Nano_33_Ble_Sense.IOs.DigitalRead(EchoPin) = True then
         TimeNow := Ada.Real_Time.Clock;

         while not Arduino_Nano_33_Ble_Sense.IOs.DigitalRead(EchoPin) = False loop
            -- Wait for the signal to change to LOW
            if Ada.Real_Time.Clock > TimeNow + Ada.Real_Time.Microseconds(DeadlineMicroseconds) then
               return -1.0;
            end if;
         end loop;

         Result := Ada.Real_Time.To_Duration(Ada.Real_Time.Clock - TimeNow);

         return (Float(Result) / 58.0) * 1000000.0;

         -- https://github.com/gamegine/HCSR04-ultrasonic-sensor-lib/blob/master/src/HCSR04.cpp

      end if;

      return -1.0;

      --Something went wrong if we end up here!
   end Distance;

end HCSR04;

