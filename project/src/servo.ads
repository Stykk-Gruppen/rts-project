with NRF52_DK.IOs;
with NRF52_DK.Time;

package servo is

   type PulseRange is range 1000 .. 2000;
   type Angle is range -180 .. 180;
   period : constant Integer := 20000;


   procedure rotateCont(rpm : Access Integer; pinId : NRF52_DK.IOs.Pin_Id);
   procedure setAngle(angle : Integer; pinId : NRF52_DK.IOs.Pin_Id);
   function getAngle(pinId : NRF52_DK.IOs.Pin_Id) return Angle;

end servo;
