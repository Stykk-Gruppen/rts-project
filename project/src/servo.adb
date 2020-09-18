with HAL; use HAL;

package body Servo is
   
   currentAngle : AngleRange := 0;
   
   function mapVal(input : Integer; inputMin : Integer; inputMax : Integer; outputMin : Integer; outputMax : Integer) return Integer is
   begin
      return outputMin + ((outputMax - outputMin) / (inputMax - inputMin)) * (input - outputMax);
   end mapVal;
        
   
   procedure write(highTime : HAL.UInt64; pinId : NRF52_DK.IOs.Pin_Id) is
   begin
      NRF52_DK.IOs.Set (pinId, True);
      NRF52_DK.Time.Delay_Ms(HAL.UInt64 (highTime / 1000));
      NRF52_DK.IOs.Set (pinId, false);
      NRF52_DK.Time.Delay_Ms(HAL.UInt64(period-highTime) / 1000));
   end write;
   
   task body SetAngle is
      highTime : HAL.UInt64 := HAL.UInt64(mapVal(angle, AngleRange'First, AngleRange'Last, PulseRange'First, PulseRange'Last)); 
   begin
      currentAngle := angle;
      loop
         write(highTime, pinId);
      end loop;
   end SetAngle;
   
   
   task body rotateCont is
      --Mapping the rpm values, to the min and max pulse high time. 
      highTime : constant NRF52_DK.Time.Time_Ms := (HAL.UInt64(mapVal(rpm, RpmRange'First, RpmRange'Last, PulseRange'First, PulseRange'Last)));
   begin
      loop
         write(highTime, pinId);
      end loop;
   end Drive;
   
    
   function RetAngle(pinId : NRF52_DK.IOs.Pin_Id) return AngleRange is
   begin
      return currentAngle;
   end RetAngle;
   
   
end Servo;

