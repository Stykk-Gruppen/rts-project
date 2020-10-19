
pragma Task_Dispatching_Policy(FIFO_Within_Priorities);


with Arduino_Nano_33_Ble_Sense.IOs;
--with VehicleController;
with Ada.Real_Time; use Ada.Real_Time;
with tasktest;

procedure Main with Priority => 1 is
   TimeNow : Ada.Real_Time.Time;

begin


   loop
   --VehicleController.Init(frontWheelsPin, rearWheelsPin);

      null;

   end loop;
   end Main;
