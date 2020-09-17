package body VehicleController is

   procedure init(frontWheelsPinId, rearWheelsPinId : NRF52_DK.IOs.Pin_Id) is
   begin
      VehicleController.frontWheelsPin := frontWheelsPinId;
      VehicleController.rearWheelsPin := rearWheelsPinId;
      Servo.RotateCont(0, VehicleController.rearWheelsPin);
   end init;
   
   procedure setVelocity(velocity : Integer) is
      rpm : Integer;
   begin
      rpm := (60 * velocity) / (2 * VehicleController.wheelRadius * 3);
      
      Servo.RotateCont(rpm, VehicleController.rearWheelsPin); -- Will be threaded
      
      
   end setVelocity;
   
   procedure setSteeringAngle(degree, delayTime : Integer) is
      d : Float;
   begin
      d := Float(degree) / Float(delayTime);
      for i in 1 .. degree loop
         --delay Duration(d);
         Servo.SetAngle(Servo.Angle(degree), VehicleController.frontWheelsPin);
      end loop;
   end setSteeringAngle;

end VehicleController;
