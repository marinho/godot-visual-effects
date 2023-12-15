## Overview

All effects in this repository are maintained as simple and easy to understand examples, meant to be copied and adjusted for the actual use cases. You can use them as they are, but it's recommended to adjust parameters so that they look better and more fit for each particular game.

Additionally, the textures used are from a third party free assets (look at the bottom). Beware in case you keep using them, make sure you respect their licenses accordingly.

Also, look at the Camera, Environment and Light configurations, as they have a direct impact on how these effects look like, for instance on post processing settings.

## Particles

### Fire

![Fire](./docs/images/particles/fire.png)

### Hurricane

![Hurricane](./docs/images/particles/hurricane.png)

### Hyperdrive

![Hyperdrive](./docs/images/particles/hyperdrive.png)

### Impact

![Impact](./docs/images/particles/impact.png)

### Implosion

![Implosion](./docs/images/particles/implosion.png)

### Rain

![Rain](./docs/images/particles/rain.png)

### Ring Portal

![Ring Portal](./docs/images/particles/ring-portal.png)

### Shield

![Shield](./docs/images/particles/shield.png)

### Shockwave

![Shockwave](./docs/images/particles/shockwave.png)

### Smoke

![Smoke](./docs/images/particles/smoke.png)

### Sparks

![Sparks](./docs/images/particles/sparks.png)

## Camera Effects

These effects should be place in a CanvasLayer object in any scene, behind other CanvasLayers for UI purpose.

All effects bellow are enabled as a ColorRect node, expanded to full screen, with a ShaderMaterial with Shader in code. The shaders have parameters to change how the effects behave. Take a look, as they can change a lot how the effects look and work.

### Blur

based on: https://godotshaders.com/shader/simple-blur-mixed-with-a-color/

![Blur](./docs/images/camera-effects/blur.png)

### Camera Shake

![Camera Shake](./docs/images/camera-effects/camera-shake.png)

### Chromatic Aberration

based on: https://www.youtube.com/watch?v=aVzY6n3e19A

![Chromatic Aberration](./docs/images/camera-effects/chromatic-aberration.png)

### Color Correction

based on: https://godotshaders.com/shader/world-environment-adjustments-for-viewporttextures/

![Color Correction](./docs/images/camera-effects/color-correction.png)

### Fish Eye

based on: https://godotshaders.com/shader/2d-radial-distortion-fisheye-barrel/

![Fish Eye](./docs/images/camera-effects/fish-eye.png)

### Grain Noise

![Grain Noise](./docs/images/camera-effects/grain-noise.png)

### Hexagon Mosaic

based on: https://docs.godotengine.org/en/4.0/tutorials/shaders/custom_postprocessing.html

![Hexagon Mosaic](./docs/images/camera-effects/hexagon-mosaic.png)

### Mirage

![Mirage](./docs/images/camera-effects/mirage.png)

### Monocolor

![Monocolor](./docs/images/camera-effects/monocolor.png)

### Pixelate

based on: https://www.youtube.com/watch?v=77F4ZjmQ07U

![Pixelate](./docs/images/camera-effects/pixelate.png)

### Sepia

based on: https://www.shadertoy.com/view/Xl3cDn

![Sepia](./docs/images/camera-effects/sepia.png)

### Under Water

based on: https://www.shadertoy.com/view/MdlXz8

![Under Water](./docs/images/camera-effects/under-water.png)

### Vignette (danger)

![Vignette](./docs/images/camera-effects/vignette.png)

## Videos

Click on the images below to jump to YouTube and watch the videos with all effects at the time of 14.12.2023

### Particles

[![alt text](https://img.youtube.com/vi/R18r8rhJ32g/0.jpg)](https://www.youtube.com/watch?v=R18r8rhJ32g)

### Camera Effects

[![alt text](https://img.youtube.com/vi/Vq8T-fPVdoA/0.jpg)](https://www.youtube.com/watch?v=Vq8T-fPVdoA)

## License

* Kenney Particle Pack is copyrighted by Kenney, and can be found at https://kenney.nl/assets/particle-pack
* Kaykit Halloween Bits is copyrighted by Kay Lousberg, and can be found at https://kaylousberg.itch.io/halloween-bits

Except for that, the particles and code in this repository are available under MIT license for free usage.
