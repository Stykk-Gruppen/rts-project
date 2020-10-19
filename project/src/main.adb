
pragma Task_Dispatching_Policy(FIFO_Within_Priorities);


with Arduino_Nano_33_Ble_Sense.IOs;
--with VehicleController;
with Ada.Real_Time; use Ada.Real_Time;
with tasktest;

procedure Main is
   package Arduino renames Arduino_Nano_33_Ble_Sense;
   TimeNow : Ada.Real_Time.Time;

begin

   --VehicleController.Init(frontWheelsPin, rearWheelsPin);
   Arduino.IOs.DigitalWrite (6, True);
   TimeNow := Ada.Real_Time.Clock;
   delay until TimeNow + Ada.Real_Time.Microseconds(2000);

   Arduino.IOs.DigitalWrite (6, True);

   TimeNow := Ada.Real_Time.Clock;
   delay until TimeNow + Ada.Real_Time.Microseconds(2000);


   end Main;
