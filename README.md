# PWM-Generator
Digital implementation of PWM Generator using Verilog HDL

## Schematic
![Circuit Diagram](https://github.com/Moaz-Helmy/PWM-Generator-/blob/main/PWM.jpg)

---

## Design Mechanism
> In this design, PWM sigal is being generated using the followin submodules:
> 1. Timer
> 2. Up Counter
> 3. Comparator

## Testing the design by generating 1MHz PWM with duty=0.25
- The Final Value for the timer in this case will be approximately 3.
- The Duty should have the value 64, given that the counter maximum value is 255.

## The Result from Modelsim
![Waveform](https://github.com/Moaz-Helmy/PWM-Generator-/blob/main/Testing/Waveform/PWM.JPG)
