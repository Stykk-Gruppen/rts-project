with NRF52_DK.IOs;
with NRF52_DK.Time;

package Servo is

   type PulseRange is range 1000 .. 2000;
   type Angle is range -180 .. 180;
   period : constant Integer := 20000;


   procedure RotateCont(rpm : Integer; pinId : NRF52_DK.IOs.Pin_Id);
   procedure SetAngle(angle : Servo.Angle; pinId : NRF52_DK.IOs.Pin_Id);
   function RetAngle(pinId : NRF52_DK.IOs.Pin_Id) return Angle;

end Servo;
