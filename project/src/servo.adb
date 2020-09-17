

package body Servo is
   
   currentAngle : Angle := 0;
        
   procedure RotateCont(rpm : Integer; pinId : NRF52_DK.IOs.Pin_Id) is
   begin
      null;
   end RotateCont;
   
   procedure SetAngle(angle : Servo.Angle; pinId : NRF52_DK.IOs.Pin_Id) is
   begin
      null;
   end SetAngle;
   
   function RetAngle(pinId : NRF52_DK.IOs.Pin_Id) return Angle is
   begin
      return currentAngle;
   end RetAngle;
     
end Servo;
