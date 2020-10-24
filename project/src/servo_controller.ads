with Arduino_Nano_33_Ble_Sense.IOs;
with Servo;

package Servo_Controller is
   
   type Direction is (Forward, Backward, Stop);
   
   type Servo_Half is record
      Pin : Arduino_Nano_33_Ble_Sense.IOs.Pin_Id;
      Angle : Servo.Angle_Range;
   end record;
   
   type Servo_Full is record
      Pin : Arduino_Nano_33_Ble_Sense.IOs.Pin_Id;
      Current_Direction : Direction;
   end record;
   

   Engine_Servo : Servo_Full :=
     (Pin => 5,
      Current_Direction => Stop);
   
   task Engine with Priority => 4;


end Servo_Controller;
