package body VehicleController is

   procedure init(frontWheelsPin_, rearWheelsPin_ : NRF52_DK.IOs.Pin_Id) is
   begin
      VehicleController.frontWheelsPin := frontWheelsPin_;
      VehicleController.rearWheelsPin := rearWheelsPin_;
      Servo.RotateCont(engineRpm, VehicleController.rearWheelsPin);
   end init;
   
   procedure setVelocity(velocity : Integer) is
   begin
      engineRpm := (60 * velocity) / (2*VehicleController.wheelRadius * 3);
   end setVelocity;
   
   procedure setSteeringAngle(degree, delayTime : Integer) is
      d := Float_Unsigned := Float_Unsigned(degree) / Float_Unsigned(delayTime);
   begin
      for i in 1 .. degree loop
         delay d;
         Servo.SetAngle(Servo.Angle(degree), VehicleController.frontWheelsPin);
      end loop;
   end setSteeringAngle;

end VehicleController;
