with Arduino_Nano_33_Ble_Sense.IOs;
with Servo;
package VehicleController is
   package Arduino renames Arduino_Nano_33_Ble_Sense;
   
   --FrontWheelsPin : Arduino.IOs.Pin_Id;
   --RearWheelsPin : Arduino.IOs.Pin_Id;
   WheelRadius : Integer;
   
   procedure Init (FrontWheelsPinId, RearWheelsPinId : Arduino.IOs.Pin_Id);
   procedure SetVelocity (Velocity : Integer);
   procedure SetSteeringAngle (Degree, DelayTimeMs : Integer);
   
   WheelAngle : Servo.AngleRange := 0 with Atomic;
   EngineRpm : Servo.RpmRange := 0 with Atomic;

   task type EngineServo;
   task type SteeringServo;

       
end VehicleController;
