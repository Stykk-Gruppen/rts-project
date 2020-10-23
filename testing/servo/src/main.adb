with Arduino_Nano_33_Ble_Sense.IOs;
with Ada.Real_Time; use Ada.Real_Time;

procedure Main is
   TimeNow : Ada.Real_Time.Time := Ada.Real_Time.Clock;
   InnerLoopDuration : Ada.Real_Time.Time := Ada.Real_Time.Clock;
   Pin_Id : Arduino_Nano_33_Ble_Sense.IOs.Pin_Id := 5;
   High_Time : Integer := 2000;
begin
   High_Time := 1500;
   Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (24, false);
   for j in 0 .. 100 loop
      TimeNow := Ada.Real_Time.Clock;
      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (Pin_Id, True);
      delay until TimeNow + Ada.Real_Time.Microseconds(High_Time);
      TimeNow := Ada.Real_Time.Clock;
      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (Pin_Id, false);
      delay until TimeNow + Ada.Real_Time.Microseconds(20000 - High_Time);
   end loop;
   Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (24, true);

   loop

      --FREMOVER
      High_Time := 1600;
      for j in 0 .. 200 loop
         TimeNow := Ada.Real_Time.Clock;
         Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (Pin_Id, True);
         delay until TimeNow + Ada.Real_Time.Microseconds(High_Time);
         TimeNow := Ada.Real_Time.Clock;
         Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (Pin_Id, false);
         delay until TimeNow + Ada.Real_Time.Microseconds(20000 - High_Time);
      end loop;

      --FIRST BRAKE CLICK!
      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (41, true);
      High_Time := 1400;
      for j in 0 .. 10 loop
         TimeNow := Ada.Real_Time.Clock;
         Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (Pin_Id, True);
         delay until TimeNow + Ada.Real_Time.Microseconds(High_Time);
         TimeNow := Ada.Real_Time.Clock;
         Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (Pin_Id, false);
         delay until TimeNow + Ada.Real_Time.Microseconds(20000 - High_Time);
      end loop;
      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (41, false);


      --IDLE
      High_Time := 1500;
      for j in 0 .. 30 loop
         TimeNow := Ada.Real_Time.Clock;
         Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (Pin_Id, True);
         delay until TimeNow + Ada.Real_Time.Microseconds(High_Time);
         TimeNow := Ada.Real_Time.Clock;
         Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (Pin_Id, false);
         delay until TimeNow + Ada.Real_Time.Microseconds(20000 - High_Time);
      end loop;


      --SECOND CLICK REVERSE
      High_Time := 1000;
      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (13, false);
      for j in 0 .. 200 loop
         TimeNow := Ada.Real_Time.Clock;
         Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (Pin_Id, True);
         delay until TimeNow + Ada.Real_Time.Microseconds(High_Time);
         TimeNow := Ada.Real_Time.Clock;
         Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (Pin_Id, false);
         delay until TimeNow + Ada.Real_Time.Microseconds(20000 - High_Time);
      end loop;
      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (13, true);
      TimeNow := Ada.Real_Time.Clock;
      --delay until TimeNow + Ada.Real_Time.Microseconds(2000);



      --IDLE
      High_Time := 1500;
      for j in 0 .. 10 loop
         TimeNow := Ada.Real_Time.Clock;
         Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (Pin_Id, True);
         delay until TimeNow + Ada.Real_Time.Microseconds(High_Time);
         TimeNow := Ada.Real_Time.Clock;
         Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (Pin_Id, false);
         delay until TimeNow + Ada.Real_Time.Microseconds(20000 - High_Time);
      end loop;

   end loop;
   null;
end Main;
