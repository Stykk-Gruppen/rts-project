with NRF52_DK.IOs;
with NRF52_DK.Time;

package body servo is
   
   constant period : Integer := 20000;
   
   type PulseRange is range(1000 .. 2000);
   type Angle is range(-180 .. 180);
   currentAngle : Angle := 0;
        
   task rotateCont(rpm : Access Integer, pinId : NRF52_DK.IOs.PinId) is
   begin
      null;
   end thrust;
   
   procedure setAngle(angle : Integer; pinId : NRF52_DK.IOs.PinId) is
   begin
      null;
   end steer;
   
   function getAngle(pinId : NRF52_DK.IOs.PinId) return Angle is
   begin
      return currentAngle;
   end getAngle;
     
end servo;
