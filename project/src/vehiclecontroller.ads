with Servo;
with NRF52_DK.IOs;
with NRF52_DK.Time;
with HAL;

package VehicleController is
   
   FrontWheelsPin : NRF52_DK.IOs.Pin_Id;
   RearWheelsPin : NRF52_DK.IOs.Pin_Id;
   WheelRadius : Integer;
   
   procedure Init (FrontWheelsPinId, RearWheelsPinId : NRF52_DK.IOs.Pin_Id);
   procedure SetVelocity (Velocity : Integer);
   procedure SetSteeringAngle (Degree, DelayTimeMs : Integer);
       
end VehicleController;
