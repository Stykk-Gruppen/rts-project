with Arduino_Nano_33_Ble_Sense.Time;
with HAL;

package body VehicleController is
   
   ----------
   -- Init --
   ----------

   procedure Init (FrontWheelsPinId, RearWheelsPinId : Arduino_Nano_33_Ble_Sense.IOs.Pin_Id) is
   begin
      --VehicleController.frontWheelsPin := frontWheelsPinId;
      --VehicleController.rearWheelsPin := rearWheelsPinId;
      --Servo.RotateCont(0, VehicleController.rearWheelsPin);
      null;
   end Init;
   
   -----------------
   -- SetVelocity --
   -----------------
   
   procedure SetVelocity (Velocity : Integer) is
      Rpm : Servo.RpmRange;
   begin
      null;
      Rpm := (60 * velocity) / (2 * VehicleController.wheelRadius * 3);
      EngineRpm := Rpm;
   end SetVelocity;
   
   ----------------------
   -- SetSteeringAngle --
   ----------------------
   
   procedure SetSteeringAngle (Degree, DelayTimeMs : Integer) is
      D : Float;
   begin
      D := Float(degree) / Float(delayTimeMs);
      for i in 1 .. Degree loop
         Arduino_Nano_33_Ble_Sense.Time.Delay_Ms(Hal.Uint64(D));
         WheelAngle := Servo.AngleRange(Degree);
      end loop;
   end SetSteeringAngle;
   
   task body SteeringServo is
      pinId : constant Arduino.IOs.Pin_Id := 5;
      
   begin
      loop
         Servo.SetAngle(WheelAngle, pinId);
      end loop;
   end SteeringServo;
   
   
   task body EngineServo is
      PinId : constant Arduino.IOs.Pin_Id := 8;
   begin
      loop
         Servo.SetRpm(EngineRpm, PinId);
      end loop;
   end EngineServo;

end VehicleController;
