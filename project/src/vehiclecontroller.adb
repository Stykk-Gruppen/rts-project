package body VehicleController is
   
   ----------
   -- Init --
   ----------

   procedure Init (FrontWheelsPinId, RearWheelsPinId : NRF52_DK.IOs.Pin_Id) is
   begin
      VehicleController.frontWheelsPin := frontWheelsPinId;
      VehicleController.rearWheelsPin := rearWheelsPinId;
      --Servo.RotateCont(0, VehicleController.rearWheelsPin);
   end Init;
   
   -----------------
   -- SetVelocity --
   -----------------
   
   procedure SetVelocity (Velocity : Integer) is
      Rpm : Integer;
   begin
      null;
      --Rpm := (60 * velocity) / (2 * VehicleController.wheelRadius * 3);
      
      --.RotateCont(rpm, VehicleController.rearWheelsPin); -- Will be threaded
   end SetVelocity;
   
   ----------------------
   -- SetSteeringAngle --
   ----------------------
   
   procedure SetSteeringAngle (Degree, DelayTimeMs : Integer) is
      D : Float;
   begin
      D := Float(degree) / Float(delayTimeMs);
      for i in 1 .. degree loop
         NRF52_DK.Time.Delay_Ms(Hal.Uint64(D));
         Servo.SetAngle(Servo.AngleRange(Degree), VehicleController.frontWheelsPin);
      end loop;
   end SetSteeringAngle;

end VehicleController;
