---
layout: post
title:  "How to dry your 3D printing filament properly"
author: iliao
categories: [ 3D-printing, Tutorial ]
image: assets/images/webp/PXL_20230828_023941587_cropped-795x1024.webp
# featured: true
# hidden: true
comments: false
redirect_from:
  - /2023/08/30/dry-3d-printing-filament-properly/
redirect_to: https://makerspet.com/blog/dry-3d-printing-filament-properly/
---
If you 3D-print PLA only, I don't think you need a dryer. But if you print just about anything else - PETG, ABS, ASA, Nylon, TPU, polycarbonate and so on - keep reading!

Most 3D printing filaments, except PLA, are hygroscopic, i.e., they absorb moisture from the air. You can usually tell that your filament got moist by listening to popcorn-style pops
as the print goes on.

- Hearing the distinct popcorn-popping sound as the filament makes its way through the 3D printer's extruder. The extruder quickly heats up tiny moisture pockets, turning them into little bubbles of compressed steam.
- Noticing your print having unusually many pockmarks left by the steam bubbles that have burst.
- Noticing atypically lots of stringing in your print.

I'm using an 1700W electric air fryer oven that I "borrowed" from my wife. The air fryer oven vendor and model are GoWISE USA AG89B. The oven has 1700W of power and a built-in air circulation fan. I'm not associated with GoWISE USA, I'm just describing my personal experience. I'm sure you can find similar fryers from other vendors - just try searching Amazon.

<blockquote>{% include signup-form.html %}</blockquote>

Here are instructions on using this oven to dry filament:

![The air fryer oven set at 125ºF](/assets/images/webp/PXL_20230828_024221446-771x1024.webp){:class="zoom-image"}

- Place your filament into the dryer. This oven has enough capacity to dry two 1Kg filament spools at the same time. 
- Press the power button - the oven will beep - and set the temperature using the "^" and "v" buttons on the left. Choose the temperature to match your filament.
- Set your dry time using the "^" and "v" buttons on the right side. I usually max out the timer setting to 8 hours.
- Press the power button one more time to start the drying.

Here are recommended 3D printing filament drying temperatures:

{::options parse_block_html="true" /}
<div style="background-color: silver; width: 100%;">
<style>
    table {
    width: 100%;
    }
</style>

| Filament Type | Temperature °F | Temperature °C |
|:--------|:--------|:--------|
| PLA | 104°F - 122°F | 40°C - 50°C |
| PETG | 140°F - 149°F | 60°C - 65°C |
| TPU | 104°F - 113°F | 40°C - 45°C |
| ABS | 176°F | 80°C |
| ASA | 176°F - 185°F | 80°C - 85°C |
| Nylon | 176°F - 194°F | 80°C - 90°C |
| Polycarbonate | 176°F | 80°C |

</div>
<p></p>
From my experience it takes 24-48 hours to dry a spool of filament. This time depends on how wet the filament is, how much filament is there on the spool and the type of the filament.

## Verify your temperatures

The actual best drying temperature may differ from the recommended one. For example, the dryer can be poorly calibrated by its manufacturer with respect to the temperature readings.

I recommend getting a thermometer you can trust to verify your real temperatures. Here is a list of temperatures to keep an eye on:
- filament in the oven
- 3D printer's extruder nozzle
- 3D printer's bed
- 3D printer enclosure, if you are using one

I use an infrared spot thermometer (from Amazon) to check the spool's temperature. You have to open the oven's door, point the thermometer at the spool, take a measurement, rotate the spool and take a measurement again - to see what the actual temperature is and whether it stays uniform around the spool during the drying process.

<div class="text-center">
![My table's surface temperature is 23.4 degrees Celsius according to this infrared handheld temperature sensor](/assets/images/webp/infrared-thermometer-504x1024.webp){:class="zoom-image"}
</div>

Keep in mind that the filament loops closer to the center of the spool take longer to dry. What I usually do is - I run the oven for 24 hours, take the filament out and try printing it. If the filament is still wet (you can hear the popcorn sound), put the filament back into the oven and dry it for another 24 hours.

Before I discovered the air fryer oven, I used a SUNLU filament dryer box (with a built-in fan). I must admit, I'm puzzled why this dryer box has 4.5 stars on Amazon - it hardly did anything for me. I was not able to take a moist filament and make it - substantially completely - dry. Its maximum temperature is not enough to make filament dry and this dryer's heating element is located on the bottom, so that the top of the spool stays barely warm - unless the spool rotates. When the spool does rotate, there is not enough power and time to dry the filament out as the filament leaves the box.

Happy 3D printing!