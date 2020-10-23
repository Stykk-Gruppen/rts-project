with Arduino_Nano_33_Ble_Sense.IOs;
with Servo;

package Servo_Controller is
   
   type Servo_Half is record
      Pin : Arduino_Nano_33_Ble_Sense.IOs.Pin_Id;
      Angle : Servo.Angle_Range;
   end record;
   
   type Servo_Full is record
      Pin : Arduino_Nano_33_Ble_Sense.IOs.Pin_Id;
      Rpm : Servo.Rpm_Range;
   end record;
   
   Engine_Servo : Servo_Full :=
     (Pin => 5,
      Rpm => 0);
   
   task Engine with Priority => 11;

end Servo_Controller;
