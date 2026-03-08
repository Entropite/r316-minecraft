# What is an "R316"?

The R316 is a computer that runs entirely in the falling sand game known as [The Powder Toy](https://powdertoy.co.uk/). You can learn more about it [here](https://github.com/LBPHacker/R316).

# How can I run this?

Use NMCV1-9's [R3emu](https://github.com/NMCV1-9/R3emu) with no fps cap and an update rate of 200,000 frames. You may have to play around with the parameters to optimize performance. Pass `minecraft.bin` as a parameter to R3emu.

## Controls:

- `W` moves forwards
- `S` moves backwards
- `A` moves leftwards
- `D` moves rightwards

- `I` rotates the camera upwards
- `K` rotates the camera downwards
- `J` rotates the camera leftwards
- `L` rotates the camera rightwards

- `R` breaks a selected block
- `F` places the block that is currently selected in the hotbar
- `1` ... `9` selects the slots from 1 through 9 in the hotbar

# How can I compile `minecraft.c`?

Use my [R3 C Compiler](https://github.com/Entropite/tpt-c-compiler). Make sure set the `--size` option to `8192`, `--term-width` to `29`, and `--term-height` to `29`. This should produce a `minecraft.asm` file which you can then pass to [tptasm](https://github.com/LBPHacker/tptasm) for a `minecraft.bin` file.

# Is this really Minecraft?

No, it's just a demo. Crafting hasn't even been implemented yet.

### You can find me on [TPT's Discord](https://powdertoy.co.uk/Discussions/Thread/View.html?Thread=25871) as `lithium404` for any suggestions or questions.

Don't bother looking into the scripts in `/assets` since they were hastily developed to prepare the sprites used in this program.