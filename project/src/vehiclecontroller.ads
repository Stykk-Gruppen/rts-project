with Servo;
with NRF52_DK.IOs;

package VehicleController is
   
   frontWheelsPin : NRF52_DK.IOs.Pin_Id;
   rearWheelsPin : NRF52_DK.IOs.Pin_Id;
   wheelRadius : Integer;
   
   procedure Init(frontWheelsPinId, rearWheelsPinId : NRF52_DK.IOs.Pin_Id);
   procedure SetVelocity(velocity : Integer);
   procedure SetSteeringAngle(degree, delayTime : Integer);
       
end VehicleController;
