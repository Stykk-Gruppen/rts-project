with Arduino_Nano_33_Ble_Sense.IOs;

package Distance_Sensor_Controller is

   type Distance_Sensor is record
      TrigPin : Arduino_Nano_33_Ble_Sense.IOs.Pin_Id;
      EchoPin : Arduino_Nano_33_Ble_Sense.IOs.Pin_Id;
      Value : Float;
   end record;

   Front : Distance_Sensor :=
     (TrigPin => 21,
      EchoPin => 27,
      Value => 50.0);

   Back : Distance_Sensor :=
     (TrigPin => 30,
      EchoPin => 29,
      Value => 50.0);

   Dispenser : Distance_Sensor :=
     (TrigPin => 21,
      EchoPin => 27,
      Value => 50.0);

   task Measure with Priority => 9;
   procedure Measure2;
   
end Distance_Sensor_Controller;
