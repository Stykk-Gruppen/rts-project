
package tasktest is
   highTime : Integer := 2000 with Atomic;
   highTime2 : Integer := 2000 with Atomic;
   Task EngineServo with Priority => 10;
   Task SteeringServo with Priority => 9;
   Task Sensor with Priority => 8;



end tasktest;
