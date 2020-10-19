with Arduino_Nano_33_Ble_Sense.IOs;
with Servo;

package Servo_Controller is
   
   type Servo_Half is record
      Pin : Arduino_Nano_33_Ble_Sense.IOs.Pin_Id;
      Angle : Servo.AngleRange;
   end record;
   
   type Servo_Full is record
      Pin : Arduino_Nano_33_Ble_Sense.IOs.Pin_Id;
      Rpm : Servo.RpmRange;
   end record;
   
   SteeringServo : Servo_Half :=
     (Pin => 3,
      Angle => 0);
   DispenserServo : Servo_Half :=
     (Pin => 23,
      Angle => 0);
   EngineServo : Servo_Full :=
     (Pin => 21,
      Rpm => 0);
   
   task Steering with Priority => 10;
   task Engine with Priority => 1;
   task Dispenser with Priority => 1;

end Servo_Controller;
