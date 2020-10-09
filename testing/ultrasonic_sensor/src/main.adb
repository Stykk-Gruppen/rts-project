with Arduino_Nano_33_Ble_Sense.LEDs;
with Arduino_Nano_33_Ble_Sense.IOs;
with Ada.Real_Time; use Ada.Real_Time;

procedure Main is
   TestingSensorIn : Arduino_Nano_33_Ble_Sense.IOs.Pin_Id := 3;
   TestingSensorOut : Arduino_Nano_33_Ble_Sense.IOs.Pin_Id := 4; --gul
   Test : Arduino_Nano_33_Ble_Sense.IOs.Pin_Id := 5;
   DistanceValue : Float;
   TimeNow : Ada.Real_Time.Time := Ada.Real_Time.Clock;
   Tall : Integer := 0;
   Pulse : Boolean;
   Stop : Boolean := False;
begin

   loop
      TimeNow := Ada.Real_Time.Clock;
      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(TestingSensorOut, False);
      delay until TimeNow + Ada.Real_Time.Microseconds(2);
      
      TimeNow := Ada.Real_Time.Clock;
      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(TestingSensorOut, True);
      delay until TimeNow + Ada.Real_Time.Microseconds(10);
      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(TestingSensorOut, False);

      Until_Loop :
      loop
         Pulse := Arduino_Nano_33_Ble_Sense.IOs.DigitalRead(TestingSensorIn);
         TimeNow := Ada.Real_Time.Clock;
         delay until TimeNow + Ada.Real_Time.Microseconds(1);
         if Pulse then
            Stop := True;
            Tall := Tall + 1;
         else
            exit Until_Loop when Stop;
         end if;

         

      end loop Until_Loop;
      
      
      
      
      TimeNow := Ada.Real_Time.Clock;
      delay until TimeNow + Ada.Real_Time.Milliseconds(1000);
      if Tall >= 2 then
       Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(Test, True);
      --else
       --  Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(Test, True);
      end if;
      -- Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite(Test, True);
      TimeNow := Ada.Real_Time.Clock;
      --delay until TimeNow + Ada.Real_Time.Milliseconds(1000);


   end loop;

end Main;
