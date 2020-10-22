with Arduino_Nano_33_Ble_Sense.IOs;
with Servo;

package Servo_Controller is
   
   subtype Rpm_Range is Servo.Rpm_Range;
   
   type Servo_Half is record
      Pin : Arduino_Nano_33_Ble_Sense.IOs.Pin_Id;
      Angle : Servo.Angle_Range;
   end record;
   
   type Servo_Full is record
      Pin : Arduino_Nano_33_Ble_Sense.IOs.Pin_Id;
      Rpm : Servo.Rpm_Range;
   end record;
   
   Steering_Servo : Servo_Half :=
     (Pin => 4,
      Angle => 0);
   Dispenser_Servo_Left : Servo_Half :=
     (Pin => 23,
      Angle => -90);
    Dispenser_Servo_Right : Servo_Half :=
     (Pin => 34,
      Angle => 90);
   Engine_Servo : Servo_Full :=
     (Pin => 5,
      Rpm => 0);
   
   task Steering with Priority => 11;
   task Engine with Priority => 11;
   task Dispenser_Left with Priority => 11;
   task Dispenser_Right with Priority => 11;

end Servo_Controller;
