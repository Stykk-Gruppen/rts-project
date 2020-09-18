with NRF52_DK.IOs;
with NRF52_DK.Time;
with HAL;

package Servo is

   period : constant NRF52_DK.Time.Time_Ms := 20;
   subtype PulseRange is Natural range 1000 .. 2000;

   --Assuming these values, will probably have to be changed several times.
   subtype AngleRange is Integer range -180 .. 180;
   subtype RpmRange is Integer range -240 .. 240;


   task type rotateCont(rpm : Integer; pinId : NRF52_DK.IOs.Pin_Id);
   task type SetAngle(angle : AngleRange; pinId : NRF52_DK.IOs.Pin_Id);
   --procedure SetAngle(angle : AngleRange; pinId : NRF52_DK.IOs.Pin_Id);
   function RetAngle(pinId : NRF52_DK.IOs.Pin_Id) return AngleRange;
function mapVal(input : Integer; inputMin : Integer; inputMax : Integer; outputMin : Integer; outputMax : Integer) return Integer;
end Servo;
