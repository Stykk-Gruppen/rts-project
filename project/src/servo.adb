

package body servo is
   
   
   
   currentAngle : Angle := 0;
        
   procedure rotateCont(rpm : Access Integer; pinId : NRF52_DK.IOs.Pin_Id) is
   begin
      null;
   end rotateCont;
   
   procedure setAngle(angle : Integer; pinId : NRF52_DK.IOs.Pin_Id) is
   begin
      null;
   end setAngle;
   
   function getAngle(pinId : NRF52_DK.IOs.Pin_Id) return Angle is
   begin
      return currentAngle;
   end getAngle;
     
end servo;
