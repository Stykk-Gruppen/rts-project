with Arduino_Nano_33_Ble_Sense.IOs;

package Distance_Sensor_Controller is

   type Distance_Sensor is record
      TrigPin : Arduino_Nano_33_Ble_Sense.IOs.Pin_Id;
      EchoPin : Arduino_Nano_33_Ble_Sense.IOs.Pin_Id;
      Value : Float;
   end record;

   Front : Distance_Sensor :=
     (TrigPin => 4,
      EchoPin => 5,
      Value => 0.0);

   Back : Distance_Sensor :=
     (TrigPin => 27,
      EchoPin => 28,
      Value => 0.0);

   Dispenser : Distance_Sensor :=
     (TrigPin => 29,
      EchoPin => 30,
      Value => 0.0);

   task Measure with Priority => 9;
   procedure Measure2;
   
end Distance_Sensor_Controller;
