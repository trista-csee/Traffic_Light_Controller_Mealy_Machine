<a name="readme-top"></a>
<!-- PROJECT SHIELDS -->
[![Contributors][contributors-shield]]()
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

<!-- PROJECT Name --> 
<h1 align="center">Designing a traffic light controller to coordinate traffic lights on highways and farm ways</h1>

<!--  State Diagram -->
## State Diagram
* In a Mealy machine, the output depends on both the current state and the current inputs.
* A general model of a Mealy sequential machine consists of a combinatorial network, which generates the outputs and the next state, and a state register which holds the current state as shown below.
* The state register is normally modeled as D flip-flops.
* The other block(s) can be modeled either using the always procedural block or a mixture of the always procedural block and dataflow modeling statements.

* The two blocks Mealy machine
![image](https://github.com/trista-csee/Traffic_Light_Controller_Mealy_Machine/blob/main/two%20blocks%20Mealy%20machine.png)

* Traffic Light Controller - 
A sensor on the farmway is to detect if there are any vehicles 
and change the traffic light to allow the vehicles to cross the highway. 
Otherwise, highway light is always green since it has higher priority than the farmway. 

<!-- Schematic -->
## Schematic
![image](https://github.com/trista-csee/Traffic_Light_Controller_Mealy_Machine/blob/main/Schmatic_all.png)

* Enlarge the left half
![image](https://github.com/trista-csee/Traffic_Light_Controller_Mealy_Machine/blob/main/Schmatic_left.png)

* Enlarge the right half
![image](https://github.com/trista-csee/Traffic_Light_Controller_Mealy_Machine/blob/main/Schmatic_right.png)

<!-- Simulation -->
## Simulation
* Highway light is always green since it has higher priority than the farmway
* Green on highway and red on farmway
![image](https://github.com/trista-csee/Traffic_Light_Controller_Mealy_Machine/blob/main/HGRE_FRED.png)

* Sensor detects vehicles on farmway, green on highway and red on farmway turn to yellow on highway and red on farmway
* Yellow on highway and red on farmway
![image](https://github.com/trista-csee/Traffic_Light_Controller_Mealy_Machine/blob/main/sensor_HYEL_FRED.png)

* Yellow on highway and red on farmway for 3s, then turn to red on highway and green on farmway
* Red on highway and green on farmway
![image](https://github.com/trista-csee/Traffic_Light_Controller_Mealy_Machine/blob/main/delay3s1_HRED_FGRE.png)

* Red on highway and green on farmway for 10s, then turn to red on highway then yellow on highway
* Red on highway and yellow on farmway
![image](https://github.com/trista-csee/Traffic_Light_Controller_Mealy_Machine/blob/main/delay10s_HRED_FYEL.png)

* Red on highway and yellow on farmway for 3s, then turn to green on highway and red on farmway
* Green on highway and red on farmway
![image](https://github.com/trista-csee/Traffic_Light_Controller_Mealy_Machine/blob/main/delay3s2_HGRE_FRED.png)

<!-- Monitor -->
## Monitor
![image](https://github.com/trista-csee/Traffic_Light_Controller_Mealy_Machine/blob/main/Monitor.png)

<!-- LICENSE -->
## License
Distributed under the MIT License. See `LICENSE` for more information.

<!-- LET'S GET SOCIAL -->
## Let's Get Social
* [LinkedIn](https://www.linkedin.com/in/hua-chen-wu-363252241/)
* [Github](https://github.com/trista-csee)

<!-- CONTACT -->
## Contact
吳華楨 Trista Wu - trista.cs11@nycu.edu.tw

Project Link: [https://github.com/trista-csee/Traffic_Light_Controller_Mealy_Machine](https://github.com/trista-csee/Traffic_Light_Controller_Mealy_Machine)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
[contributors-shield]: https://img.shields.io/badge/contributors-1-orange.svg?style=flat-square
[license-shield]: https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square
[license-url]: https://choosealicense.com/licenses/mit
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/hua-chen-wu-363252241/
[product-screenshot]: ./images/projects/portfolio.jpg

