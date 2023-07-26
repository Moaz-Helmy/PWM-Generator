# PWM-Generator
Digital implementation of PWM Generator using Verilog HDL.
Implemented a simple circuit that generates a pulse-width modulated signal using three basic blocks, which are:
- A Timer.
- An Up-Counter.
- A Comparator.

The Timer takes a specific final value which upon reaching up to, the timer ticks one tick. This tick is connected to the enable of the Up-counter, thus triggering it to count up only once, then it waits for the next tick. 
The Up-counter is considered the clock generator of the PWM signal. Because when the counter overflows, a full PWM signal is generated.
As for the comparator, its role is so simple. It compares the counter value with a specific input value that represents the duty cycle. As long as, the counter value is less than the duty, the PWM signal is high. Otherwise, it's low.

## Schematic
![Circuit Diagram](https://github.com/Moaz-Helmy/PWM-Generator-/blob/main/PWM.jpg)

---

## Design Blocks
> In this design, PWM sigal is being generated using the followin submodules:
> 1. Timer
> 2. Up Counter
> 3. Comparator

## Testing the design by generating 1MHz PWM with duty=0.25. After feeding the circuit with clock source of 1GHz.
- The Final Value for the timer in this case will be approximately 3.
- The Duty should have the value 64, given that the counter maximum value is 255.

## The Result from Modelsim
![Waveform](https://github.com/Moaz-Helmy/PWM-Generator-/blob/main/Testing/Waveform/PWM.JPG)
